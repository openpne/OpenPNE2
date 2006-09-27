<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_biz_group_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        $member_list = serialize($requests['member_list']);

        if(!$requests['name'])
        {
            client_redirect_absolute('?m=biz&a=page_h_biz_group_add&m=biz&msg='.urlencode('グループ名を登録してください。').'&name='.$requests['name'].'&info='.$requests['info'].'&memberlist='.$member_list);
            exit();
        }

        $filename = '';
        if($_FILES['image_filename']['name'])
        {
            $filename = biz_saveImage($_FILES['image_filename'], "g_".$sessid);
            if(!$filename)
            {
                $filename = $requests['image_filename'];
                client_redirect_absolute('?m=biz&a=page_h_biz_group_add&msg='.urlencode('画像は300KB以内のGIF・JPEG・PNGにしてください。').'&m=biz&id='.$id);
                exit();
            }
        }
        t_image_clear_tmp(session_id());

        biz_insertGroup($requests['name'], $u, $requests['info'], $filename, $requests['member_list']);
        
        client_redirect_absolute("?m=biz&a=page_g_home&target_c_commu_id=".biz_getGroupMax());
    }
}

?>
