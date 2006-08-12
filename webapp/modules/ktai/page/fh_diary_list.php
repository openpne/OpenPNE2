<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_fh_diary_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $direc = $requests['direc'];
        $page = $requests['page'];
        // ----------

        if(!$target_c_member_id) $target_c_member_id = $u;

        if (p_common_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('ktai', 'page_h_access_block');
        }

        $target_c_member = db_common_c_member4c_member_id($target_c_member_id);
        // フレンドにしか公開していない
        if ($target_c_member['public_flag_diary'] == "friend" &&
            !db_friend_is_friend($u,$target_c_member_id) &&
            $target_c_member_id != $u) {

            ktai_display_error('この日記にはアクセスできません');
        }

        //ターゲット情報
        $this->set("target_c_member", db_common_c_member4c_member_id_LIGHT($target_c_member_id));

        // 1ページ当たりに表示する日記の数
        $page_size = 10;
        $page += $direc;
        //ターゲットの詳細な日記リスト
        $list = k_p_fh_diary_list_c_diary_list4c_member_id($target_c_member_id,$page_size,$page);

        $this->set("target_diary_list", $list[0]);
        $this->set("page",$page);
        $this->set("is_prev",$list[1]);
        $this->set("is_next",$list[2]);

        //f or h
        $this->set("INC_NAVI_type", k_p_fh_common_get_type($target_c_member_id, $u));

        //あしあとをつける
        db_ashiato_insert_c_ashiato($target_c_member_id, $u);

        return 'success';
    }
}

?>
