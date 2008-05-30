<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_intro extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        if (is_null($target_c_member_id)) {
            $target_c_member_id = $u;
        }

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        // navi 振り分け用
        if ($target_c_member_id == $u) {
            $type = "h";
        } else {
            $type = "f";
        }
        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));

        //自分情報
        $this->set("member", db_member_c_member4c_member_id($u));

        //ターゲット情報
        $this->set("target_member", db_member_c_member4c_member_id($target_c_member_id));

        if ($target_c_member_id == $u) {
            $raw_c_friend_comment_list = db_friend_intro_list_with_my_intro4c_member_id($target_c_member_id);
        } else {
            $raw_c_friend_comment_list=db_friend_intro_list4c_member_id($target_c_member_id);
        }
        $c_friend_comment_list = $raw_c_friend_comment_list;

        //紹介文達
        $this->set("intro_list", $c_friend_comment_list);

        //---- ページ表示 ----//
        return 'success';
    }
}

?>
