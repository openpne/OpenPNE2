<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'XML/Serializer.php'; 
require_once OPENPNE_WEBAPP_DIR . '/modules/kanshi/lib/kanshi.php';

class kanshi_do_get extends OpenPNE_Action
{
    function handleError($errors, $code = 0, $requests = array())
    {
        if(strcmp($code, 1) == 0) { //パラメータ不足
            $message = '必須パラメータが不足しています';
        }
        elseif(empty($code) || strcmp($code, 99) == 0) { //その他
            $message = 'パラメータの値が正しくありません';
        }

        $data    = array(
            'meta' => array(
                'watch_type_id'        => $requests['watch_type_id'],
                'api_version'          => $requests['api_version'],
                'import_data_type_seq' => $requests['import_data_type_seq'],
                'result'               => '0',
                'error_code'           => $code,
                'error_message'        => $message
            ),
            'entities' => '',
        );

        $options = array(
            "defaultTagName" => "entity",
            "rootName"       => "root",
        );

        $serializer = new XML_Serializer($options);
        $serializer->serialize($data);
        $result = $serializer->getSerializedData();

        header("Content-Type: text/xml; charset=utf-8");
        echo $result;
        exit;
    }

    function execute($requests)
    {
        $import_data_type_seq = $requests['import_data_type_seq'];
        $watch_type_id        = $requests['watch_type_id'];
        $updated_from         = $requests['updated_from'];
        $updated_to           = $requests['updated_to'];
        $api_version          = $requests['api_version'];
        $display              = 1;
        $creator_nickname     = $requests['creator_nickname'];
        $offset               = $requests['offset'];
        $limit                = $requests['limit'];

        $errors = array();
        $code   = 0;
        if(empty($import_data_type_seq) || empty($watch_type_id) || empty($updated_from) || empty($updated_to)) {
            $this->handleError($errors, 1, $requests);
            exit;
        }

        if(!preg_match('/[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.*/', $updated_from)
                || !preg_match('/[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.*/', $updated_to)
                    || strtotime($updated_from) >= strtotime($updated_to) ) {

            $this->handleError($errors, 99, $requests);
            exit;
        }


        $updated_from         = kanshi_get_date($requests['updated_from']);
        $updated_to           = kanshi_get_date($requests['updated_to']);

        // 日記型（タイトル＋本文）
        if(strcmp($import_data_type_seq, 1) == 0) {
            // 日記
            if(strcmp($watch_type_id, 1) == 0) {
                $list = kanshi_get_diary_list($updated_from, $updated_to, $offset, $limit);
            }
            // 掲示板・イベント
            elseif(strcmp($watch_type_id, 2) == 0) {
                $list = kanshi_get_topic_event_list($updated_from, $updated_to, $offset, $limit);
            }
            // コミュニティ
            elseif(strcmp($watch_type_id, 3) == 0) {
                $list = kanshi_get_community_list($updated_from, $updated_to, $offset, $limit);
            }
            else{
                $this->handleError($errors, 99, $requests);
                exit;
            }
        }
        // コメント型（本文のみ）
        elseif(strcmp($import_data_type_seq, 2) == 0) {
            // 日記コメント
            if(strcmp($watch_type_id, 4) == 0) {
                $list = kanshi_get_diary_comment_list($updated_from, $updated_to, $offset, $limit);
            }
            // 掲示板・イベントコメント
            elseif(strcmp($watch_type_id, 5) == 0) {
                $list = kanshi_get_topic_event_comment_list($updated_from, $updated_to, $offset, $limit);
            }
            else{
                $this->handleError($errors, 99, $requests);
                exit;                
            }
        }
        // 画像型（URL+タイトル）
        elseif(strcmp($import_data_type_seq, 3) == 0) {
            $list = kanshi_get_image_list($updated_from, $updated_to, $offset, $limit);
        }
        else{
            $this->handleError($errors, 99, $requests);
            exit;
        }

        $data_list = array();
        // 日記型（タイトル＋本文）
        if(strcmp($import_data_type_seq, 1) == 0) {
            if(count($list) > 0) {
                foreach($list as $row_data) {
                    $data_list[] = array(
                        'data_id'             => $row_data['data_id'],
                        'title'               => $row_data['title'],
                        'content'             => $row_data['content'],
                        'creator'             => $row_data['creator'],
                        'creator_nickname'    => $row_data['c_member']['nickname'],
                        'created_on'          => $row_data['r_datetime'],
                        'updated_on'          => (!empty($row_data['u_datetime']))? $row_data['u_datetime']: $row_data['r_datetime'],
                        'display'             => 1,
                        'creator_email'       => $row_data['c_member']['secure']['pc_address'],
                        'creator_mobile_utn'  => $row_data['c_member']['secure']['easy_access_id'],
                        'refer_watch_type_id' => $row_data['refer_watch_type_id'],
                        'refer_data_id'       => $row_data['refer_data_id'],
                        'refer_data_url'      => $row_data['refer_data_url'],
                    );
                }
            }
        }
        // コメント型（本文のみ）
        elseif(strcmp($import_data_type_seq, 2) == 0) {
            if(count($list) > 0) {
                foreach($list as $row_data) {
                    $data_list[] = array(
                        'data_id'             => $row_data['data_id'],
                        'content'             => $row_data['content'],
                        'creator'             => $row_data['creator'],
                        'creator_nickname'    => $row_data['c_member']['nickname'],
                        'created_on'          => $row_data['r_datetime'],
                        'updated_on'          => (!empty($row_data['u_datetime']))? $row_data['u_datetime']: $row_data['r_datetime'],
                        'display'             => 1,
                        'creator_email'       => $row_data['c_member']['secure']['pc_address'],
                        'creator_mobile_utn'  => $row_data['c_member']['secure']['easy_access_id'],
                        'refer_watch_type_id' => $row_data['refer_watch_type_id'],
                        'refer_data_id'       => $row_data['refer_data_id'],
                        'refer_data_url'      => $row_data['refer_data_url'],
                    );
                }
            }
        }
        // 画像型
        elseif(strcmp($import_data_type_seq, 3) == 0) {
            if(count($list) > 0) {
                foreach($list as $row_data) {
                    $data_list[] = array(
                        'data_id'             => $row_data['data_id'],
                        'title'               => $row_data['title'],
                        'image_url'           => $row_data['image_url'],
                        'creator'             => $row_data['creator'],
                        'creator_nickname'    => $row_data['c_member']['nickname'],
                        'created_on'          => $row_data['r_datetime'],
                        'updated_on'          => (!empty($row_data['u_datetime']))? $row_data['u_datetime']: $row_data['r_datetime'],
                        'display'             => 1,
                        'creator_email'       => $row_data['c_member']['secure']['pc_address'],
                        'creator_mobile_utn'  => $row_data['c_member']['secure']['easy_access_id'],
                        'refer_watch_type_id' => $row_data['refer_watch_type_id'],
                        'refer_data_id'       => $row_data['refer_data_id'],
                        'refer_data_url'      => $row_data['refer_data_url'],
                    );
                }
            }
        }

        $data    = array(
            'meta' => array(
                'watch_type_id'        => $watch_type_id,
                'api_version'          => $api_version,
                'import_data_type_seq' => $import_data_type_seq,
                'result'               => '1'
            ),
            'entities' => $data_list
        );

        $options = array(
            "defaultTagName" => "entity",
            "rootName"       => "root",
        );

        $serializer = new XML_Serializer($options);
        $serializer->serialize($data); 
        $result = $serializer->getSerializedData();
        header("Content-Type: text/xml; charset=utf-8");
        echo $result;
    }
}

?>
