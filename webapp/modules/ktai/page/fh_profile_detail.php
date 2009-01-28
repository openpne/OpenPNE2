<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_fh_profile_detail extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        $is_h = 0;
        if ($target_c_member_id == $u || empty($target_c_member_id)) {
            $target_c_member_id = $u;
            $is_h = 1;
        }

        if (!$is_h) {
            if (!db_member_is_active_c_member_id($target_c_member_id)) {
                ktai_display_error('該当するメンバーが見つかりません。');
            }

            if (db_member_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('ktai', 'page_h_access_block');
            }

            //あしあとをつける
            db_ashiato_insert_c_ashiato($target_c_member_id, $u);
        }

        $is_friend = db_friend_is_friend($u, $target_c_member_id);
        if ($is_h || $is_friend) {
            $target_c_member = db_member_c_member_with_profile($target_c_member_id, 'friend');
        } else {
            $target_c_member = db_member_c_member_with_profile($target_c_member_id, 'public');
        }
        if ($target_c_member['birth_year']) {
            $target_c_member['age'] = getAge($target_c_member['birth_year'], $target_c_member['birth_month'], $target_c_member['birth_day']);
        }

        $this->set('is_h', $is_h);
        $this->set('target_c_member', $target_c_member);
        $this->set('profile_list', db_member_c_profile_list());
        $this->set('relation', db_friend_relationship4two_members($u, $target_c_member_id));

        return 'success';
    }
}

?>
