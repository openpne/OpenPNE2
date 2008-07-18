<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_f_link_request_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $body = $requests['body'];
        // ----------

        $c_member = db_member_c_member4c_member_id($target_c_member_id);
        if (!$c_member) {
            openpne_redirect('pc', 'page_h_err_f_home');
        }

        $frined_status=db_friend_status($u, $target_c_member_id);

        if ($target_c_member_id == $u) {
            openpne_redirect('pc', 'page_h_home');
        }

        if ($frined_status['is_friend']) {
            $p = array('target_c_member_id' => $target_c_member_id);
            openpne_redirect('pc', 'page_f_link_request_err_already', $p);
        }

        if ($frined_status['is_friend_confirm']) {
            $p = array('target_c_member_id' => $target_c_member_id);
            openpne_redirect('pc', 'page_f_link_request_err_wait', $p);
        }

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        $this->set('inc_navi', fetch_inc_navi("f", $target_c_member_id));


        //ターゲット情報
        $this->set("target_member", $c_member);

        //ターゲットのid
        $this->set("target_c_member_id", $target_c_member_id);


        $form_val=array(
           'target_c_member_id' => $target_c_member_id,
           'body' => $body,
        );
        //$this->set("form_val" ,$form_val);
        $this->set("form", $form_val);

        return 'success';
    }
}

?>
