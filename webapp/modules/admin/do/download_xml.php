<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */
require_once 'XML/Serializer.php';

// RDFダウンロード
class admin_do_download_xml extends OpenPNE_Action
{
    function handleError($errors)
    {
        openpne_forward('admin', 'page', 'download_xml', $errors);
        exit;
    }

    function execute($requests)
    {
        $arr_start_date['year']  = $requests['PERIOD_FROM_YEAR'];
        $arr_start_date['month'] = $requests['PERIOD_FROM_MONTH'];
        $arr_start_date['day']   = $requests['PERIOD_FROM_DAY'];
        $arr_end_date['year']    = $requests['PERIOD_TO_YEAR'];
        $arr_end_date['month']   = $requests['PERIOD_TO_MONTH'];
        $arr_end_date['day']     = $requests['PERIOD_TO_DAY'];

        //入力値の精査
        //(1)日付入力ﾁｪｯｸ(期間指定だった場合)
        if ($requests['IS_PERIOD'] > 0 ){

            $this->check_date_error($arr_start_date, $errors, "対象期間（開始）");
            $this->check_date_error($arr_end_date, $errors, "対象期間（終了）");
            if (empty($errors))$this->check_date_error_for_period($arr_start_date, $arr_end_date, $errors);
            // エラーがあればリダイレクト
            if(!empty($errors)) $this->handleError($errors);

            $start_datetime = $this->conv_timestamp_to_datetime($this->conv_arr_date_to_timestamp($arr_start_date));
            $end_datetime = $this->conv_timestamp_to_datetime($this->conv_arr_date_to_timestamp($arr_end_date), array('strtotime' => '+1 day'));
            $dsp_datetime = $this->conv_timestamp_to_datetime($this->conv_arr_date_to_timestamp($arr_end_date));
        }

        //画面ﾃﾞｰﾀを配列に格納
        $input['data_type']   = $requests['GET_DATA_TYPE'];
        $input['member']['select']       = $requests['SELECT_MEMBER'];
        $input['member']['c_member_id']  = $requests['SELECT_MEMBER_ID'];
        $input['period']['is_period']    = $requests['IS_PERIOD'];
        $input['period']['start_datetime']= $start_datetime;
        $input['period']['end_datetime']  = $end_datetime;
        $input['period']['dsp_datetime']  = $dsp_datetime;
        $input['commu']['is_commu']      = $requests['IS_COMMU'];
        $input['commu']['category_id']   = $requests['CATEGORY_ID'];
        $input['commu']['commu_id']      = $requests['COMMU_ID'];

        //データ存在チェック
        $id_list = $this->get_id_list($input);
        if (!$id_list){
            $errors = array('ダウンロードデータ対象データが存在しません');
            $this->handleError($errors);
        }

        //download日時を取得
        $download_date = date('Y/m/d H:i:s');

        //ｼﾘｱﾗｲｻﾞ作成
        $options    = $this->create_serial_option();
        $serializer = new XML_Serializer($options);

        //RDF配列作成
        $rdf = $this->create_rdf_array($input, $download_date, $id_list);
        $result = $serializer->serialize($rdf);
        if( $result === true ) {
            $xml = $serializer->getSerializedData();
            //IE以外の場合、キャッシュをさせないヘッダを出力
            if (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') === false) {
                send_nocache_headers(true);
            }
            header("Content-Type: application/octet-stream");
            header("Content-Disposition: attachment; filename=download.rdf");
            echo $xml;
            //echo "<pre>".htmlspecialchars($xml)."</pre>";
        }
        exit;
    }
    /*
     * 取得データ存在チェック
     */
    function get_id_list($input){
        $data_type      = $input['data_type'];
        $c_member_id    = $input['member']['c_member_id'];
        $start_datetime = $input['period']['start_datetime'];
        $end_datetime   = $input['period']['end_datetime'];
        $c_commu_category_id  = $input['commu']['category_id'];
        $c_commu_id           = $input['commu']['commu_id'];

        $params = array();
        //メンバーで絞る場合

        if ($input['member']['select'] > 0 ){
            $where .= " and a.c_member_id = ?";
            array_push($params ,intval($c_member_id));
        }
        //期間指定だった場合(日付で絞る条件追加)
        if ($input['period']['is_period'] > 0 ) {
            $where .= " and a.r_datetime >= ?  and a.r_datetime < ?";
            array_push($params ,$start_datetime);
            array_push($params ,$end_datetime);
        }
        //コミュ指定の場合
        if ($data_type > 1){
            if ($input['commu']['is_commu'] == 1){
                $where .= ' and cm.c_commu_category_id = ?';
                array_push($params ,$c_commu_category_id);
            } else if ($input['commu']['is_commu']== 2){
                $where .= ' and a.c_commu_id = ?';
                array_push($params ,$c_commu_id);

            }
            if ($data_type > 3){
                $where .= " and a.event_flag = 1";
            } else {
                $where .= " and a.event_flag = 0";
            }
        }
        if ($where){
            $where = ereg_replace('^ and', ' WHERE',$where);
        }

        //本体データの取得(本体のIDのみ）
        //  日記の場合
        if ($data_type <= 1){
            $sql = "SELECT a.c_diary_id FROM c_diary as a" .$where. " ORDER BY c_diary_id";
            //  トピック/イベントの場合
        } else {
            $sql = "SELECT a.c_commu_topic_id FROM c_commu_topic as a,c_commu as cm ".
                $where . " and a.c_commu_id = cm.c_commu_id ORDER BY a.c_commu_id,a.c_commu_topic_id";
        }
        $id_list = db_get_col($sql,$params);
        return $id_list;
    }

    /*
     *  シリアルoption生成
     */
    function create_serial_option(){
        $options = array(
                "indent" => " ",
                "linebreak" => "\n",
                "typeHints" => false,
                "addDecl" => true,
                "encoding" => "UTF-8",
                "rootName" => "rdf:RDF",
                "rootAttributes" => array("xmlns"   => "http://purl.org/rss/1.0/",
                    "xmlns:rdf" => "http://www.w3.org/1999/02/22-rdf-syntax-ns#" ,
                    "xmlns:dc" => "http://purl.org/dc/elements/1.1/",
                    "xmlns:taxo" => "http://purl.org/rss/1.0/modules/taxonomy/",
                    "xml:lang"  => "ja"),
                "defaultTagName" => array('rdf:RDF'=>'item', 'rdf:Seq'=>'rdf:li'),
                "attributesArray" => "_attributes",
                );
        return $options;
    }
    /*
     *   chennel配列の生成
     */
    function make_channel($input, $download_date){
        $dscript['sns_title'] = SNS_NAME;
        $data_names = array ('日記', '日記とコメント', 'トピック', 'トピックとコメント', 'イベント', 'イベントとコメント');
        //ダウンロード対象
        $dscript['dl_target'] = $data_names[$input['data_type']];

        //ニックネーム取得
        $nickname = "";
        if ($input['member']['select'] > 0 ){
            $member = db_member_c_member4c_member_id_LIGHT($input['member']['c_member_id']);
            $dscript['dl_user'] = $member['nickname'];
        }

        //カテゴリ名称取得
        $category = "";
        if ($input['data_type'] > 1){
            if($input['commu']['is_commu'] == 1){
                $dscript['dl_category'] = db_commu_c_commu_category_name4c_commu_category_id($input['commu']['category_id']);
            }
        }

        //期間の編集
        $period = "";
        if ($input['period']['is_period']){
            $start_date = date('Y/m/d',strtotime($input['period']['start_datetime']));
            $end_date   = date('Y/m/d',strtotime($input['period']['dsp_datetime']));
            $dscript['dl_date'] = sprintf("%s～%sまで", $start_date, $end_date);
        }

        $channel = array(
                "title" => SNS_NAME,
                "link"  => OPENPNE_URL,
                "description"  => $dscript,
                "items" => array(
                    "rdf:Seq" => array(
                        "rdf:li" => array(
                            "_attributes" => array(
                                "rdf:resource" => OPENPNE_URL,
                                ),
                            ),
                        ),
                    "pubDate" => $download_date,
                    ),
                );
        return($channel);
    }
    /*
     * RDF配列にデータ格納
     */
    function create_rdf_array($input, $download_date, $id_list){

        //channel data作成
        $channel = $this->make_channel($input, $download_date);

        $rdf = array("channel" => $channel);

        //リンク先決定
        $http = OPENPNE_URL ."?m=pc&a=page_";
        if ($input['data_type']  > 3){
            $http .= "c_event_detail&target_c_commu_topic_id=";
        } else if ($input['data_type']  > 1) {
            $http .= "c_topic_detail&target_c_commu_topic_id=";
        } else {
            $http .= "fh_diary&target_c_diary_id=";
        }
        foreach ($id_list as $id){
            //本体データ取得
            $main_data = $this->get_main_data($input, $id);
            //(1)本体データ
            $items = array(
                    "title" => $main_data['subject'],
                    "link"  => $http. $id,
                    "description" => $main_data['description'],
                    );
            //(2)コメントデータ
            if ($input['data_type'] % 2 == 1){
                $comment_rdf = $this->make_comment_rdf($input, $id);
            }
            if ($comment_rdf){
                $items += array(
                        "taxo:topics" => array(
                            "rdf:Seq" => $comment_rdf,
                            ),
                        );
            }
            $items += array(
                    "dc:date"     => $main_data['datetime'],
                    "_attributes" => array(
                        "rdf:about" => $this->plus_entity_character($http. $id),
                        ),
                    );
            $rdf[] = $items;

        }
        return $rdf;
    }
    /*
     *  エンティティ参照に変換
     */
    function plus_entity_character($str){
        $pattern[0] = '/&/';
        $pattern[1] = '/</';
        $pattern[2] = '/>/';
        $pattern[3] = '/"/';
        $pattern[4] = "/'/";

        $replace[4] = '&amp;';
        $replace[3] = '&lt;';
        $replace[2] = '&gt;';
        $replace[1] = '&quot;';
        $replace[0] = '&apos;';
        $ret = preg_replace($pattern, $replace, $str);
        return $ret;
    }
    /*
     *  メインデータの取得
     */
    function get_main_data($input, $id){
        //日記の場合
        if ($input['data_type'] < 2){
            $data = db_diary_get_c_diary4id($id);
            $ret['subject'] = $data['subject'];
            $ret['datetime']= $this->conv_timestamp_to_datetime(strtotime($data['r_datetime']));
            $ret['description'] = array(
                    'id'       => $data['c_member_id'],
                    'isopen'   => $data['public_flag'],
                    'contents' => $data['body'],
                    );
            //トピック・イベントの場合
        } else {
            //トピック
            if ($input['data_type'] < 4) {
                $data = db_commu_c_topic4c_commu_topic_id($id);
                //イベント
            } else {
                $data = db_commu_c_topic4c_commu_topic_id_2($id);
            }
            $commu = db_commu_c_commu4c_commu_id($data['c_commu_id']);
            $ret['subject'] = $data['name'];
            $ret['datetime']= $this->conv_timestamp_to_datetime(strtotime($data['r_datetime']));
            $ret['description'] = array(
                    'id'        => $data['c_member_id'],
                    'isopen'    => $commu['public_flag'],
                    'community' => $commu['name'],
                    'contents'  => $data['body'],
                    );
            //イベントに限り参加人数・開催日を追記
            if ($input['data_type'] >= 4){
                $ret['description'] += array(
                        'number' => $data['member_num'],
                        'opendate'  => $data['open_date'],
                        );
            }
        }
        return($ret);
    }

    /*
     *  コメントdataの取得
     */
    function get_comment_data($input, $id){
        //日記の場合
        if ($input['data_type'] < 2){
            $sql = 'SELECT c_diary_comment_id as id,c_member_id as uid,body as comment,r_datetime as date ' .
                ' FROM  c_diary_comment' .
                ' WHERE c_diary_id = ?' .
                ' ORDER BY c_diary_comment_id';

            //トピック/イベントの場合
        } else {
            $sql = 'SELECT c_commu_topic_comment_id as id,c_member_id as uid,body as comment,r_datetime as date ' .
                ' FROM  c_commu_topic_comment' .
                ' WHERE c_commu_topic_id = ? AND number > 0 ' .
                ' ORDER BY c_commu_topic_comment_id';
        }
        $params = array(intval($id));
        $data = db_get_all($sql, $params);
        return($data);
    }

    /*
     *  コメント部分RDF配列作成
     */
    function make_comment_rdf($input,$id){
        $data = $this->get_comment_data($input,$id);
        if (!$data) return;
        $rdf_comment = array();
        foreach($data as $com){
            $rdf_comment[] = $com;
        }
        return($rdf_comment);
    }

    /**
     * 開始日時、終了日時の大小関係のチェック
     *
     * @param array $arr_start_date
     * @param array $arr_end_date
     * @param array &$errors
     * @return boolean
     */
    function check_date_error_for_period($arr_start_date, $arr_end_date, &$errors){
        if($this->conv_arr_date_to_timestamp($arr_start_date) > $this->conv_arr_date_to_timestamp($arr_end_date)){
            $errors[] = "対象期間（開始）は対象期間（終了）より前の日付でなければなりません";
            return true;
        }
        return false;
    }

    /**
     * 入力日付のチェック
     *
     * @param array &$arr_date
     * @param array &$errors
     * @param string $position
     * @return boolean
     */
    function check_date_error(&$arr_date, &$errors, $position=""){
        // 入力チェック
        // 年月日すべての入力がないと無効とする。
        // 日がなくても1日とする場合は、これより前にその処理を入れるといいかもしれない。
        if(empty($arr_date['year']) || empty($arr_date['month']) || empty($arr_date['day'])){
            $errors[] = "{$position} : 年を入力してください";
            return true;
        }else{
            // 存在しない日付の場合はエラーとする
            if(!checkdate(intval($arr_date['month']), intval($arr_date['day']), intval($arr_date['year']))){
                $errors[] = "{$position} : 入力された日付は存在しません";
                return true;
            }
        }
        return false;
    }

    /**
     * その月の最後の日を返す
     *
     * @param 'int or string' $year
     * @param 'int or string' $month
     * @return int
     */
    function last_day($year, $month){
        if(in_array($month, array(2, 4, 6, 9, 11))) $day = 30;
        if(2 == $month) $day = (($this->is_reap_year($year)) ? 29 : 28);
        return $day;
    }

    /**
     * 閏年チェック
     *
     * @param 'int or string' $year
     * @return 0 or 1(閏年)
     */
    function is_reap_year($year){
        return date("L", mktime(0,0,0,1,1,$year));
    }

    /**
     * 配列で渡された日付データをタイムスタンプに
     *
     * @param array $arr_date
     * @return timestamp
     */
    function conv_arr_date_to_timestamp($arr_date){
        return mktime(0, 0, 0, $arr_date['month'], $arr_date['day'], $arr_date['year']);
    }

    /**
     * タイムスタンプを　DATETIME　へ
     *
     * @param timestamp $timestamp
     * @param array $options (拡張可：ご自由に)
     * @return datetime
     */
    function conv_timestamp_to_datetime($timestamp, $options=array()){
        if(!empty($options['strtotime'])) $timestamp = strtotime($options['strtotime'], $timestamp);
        return date("Y/m/d H:i:s", $timestamp);
    }
}

?>
