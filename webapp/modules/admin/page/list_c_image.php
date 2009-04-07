<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 画像リスト
class admin_page_list_c_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();
        $pager = array();

        $v['SNS_NAME'] = SNS_NAME;

        $c_image_list = db_image_c_image_list($requests['page'], $requests['page_size'], $pager);

        //ファイル名からリンク先を生成
        foreach ($c_image_list as $key => $c_image) {
            $temp = explode("_", $c_image['filename']);

            //
            switch ($temp[0]) {
                case 'm':   //メンバー画像
                    $c_image_list[$key]['param'] = '&a=page_f_home&target_c_member_id='.$temp[1];
                break;
                case 'c':   //コミュニティ画像
                    $c_image_list[$key]['param'] = '&a=page_c_home&target_c_commu_id='.$temp[1];
                break;
                case 'd':   //日記画像
                    $c_image_list[$key]['param'] = '&a=page_fh_diary&target_c_diary_id='.$temp[1];
                break;
                case 'dc':  //日記コメント画像
                    $id = _do_c_diary_comment4c_diary_comment_id($temp[1]);
                    $c_image_list[$key]['param'] = '&a=page_fh_diary&target_c_diary_id='.$id['c_diary_id'];
                break;
                case 't':   //トピック、イベント画像
                    $c_image_list[$key]['param'] = '&a=page_c_topic_detail&target_c_commu_topic_id='.$temp[1];
                break;
                case 'tc':  //トピック、イベントコメント画像
                    $id = db_commu_c_commu_topic_comment4c_commu_topic_comment_id_2($temp[1]);
                    $c_image_list[$key]['param'] = '&a=page_c_topic_detail&target_c_commu_topic_id='.$id['c_commu_topic_id'];
                break;
            }
        }

        $v['c_image_list'] = $c_image_list;
        $v['pager'] = $pager;

        $this->set($v);
        return 'success';
    }
}

?>
