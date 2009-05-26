<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_search_result extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $page = $requests['page'];
        $birth_year = $requests['birth_year'];
        $birth_month = $requests['birth_month'];
        $birth_day = $requests['birth_day'];
        $image = $requests['image'];
        $nickname = $requests['nickname'];
        // ----------

        $profiles = array();
        if ($_REQUEST['profile']) {
            $profiles = db_member_search_check_profile($_REQUEST['profile']);
        }

        $limit = 20;
        $this->set("page", $page);

        $cond = array(
            'birth_year' => $birth_year,
            'birth_month' => $birth_month,
            'birth_day' => $birth_day,
            'image' => $image,
        );
        $cond_like = array(
            'nickname' => $nickname,
        );

        $result = db_member_search($cond, $cond_like, $limit, $page, $u, $profiles);
        $this->set("target_friend_list", $result[0]);
        $pager = array(
            "page_prev" => $result[1],
            "page_next" => $result[2],
            "total_num" => $result[3],
        );

        $pager["disp_start"] = $limit * ($page - 1) + 1;
        if (($disp_end  = $limit * $page) > $pager['total_num']) {
            $pager['disp_end'] = $pager['total_num'];
        } else {
            $pager['disp_end'] = $disp_end;
        }

        $this->set("pager", $pager);


        $tmp = array();
        foreach ($cond as $key => $value) {
            if ($value) {
                $tmp[] = "$key=".urlencode($value);
            }
        }
        foreach ($cond_like as $key => $value) {
            if ($value) {
                $tmp[] = "$key=".urlencode($value);
            }
        }
        foreach ($profiles as $key => $value) {
            if ($value['c_profile_option_id']) {
                $v = $value['c_profile_option_id'];
            } else {
                $v = urlencode($value['value']);
            }
            $tmp[] = urlencode("profile[{$key}]")."={$v}";
        }
        $search_condition = implode("&", $tmp);
        $this->set("search_condition", $search_condition);

        $this->set('inc_navi', fetch_inc_navi("h"));

        return 'success';
    }
}

?>
