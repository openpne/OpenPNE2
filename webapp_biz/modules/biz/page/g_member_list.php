<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_page_g_member_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $direc = $requests['direc'];
        $start = $requests['start'];
        // ----------

        $this->set("page", $page);

        //メンバー情報
        $this->set("member", db_member_c_member4c_member_id($u));

        //コミュニティID
        $this->set("c_commu_id", $target_c_commu_id);

        //
        $this->set("c_commu_num", count(biz_getGroupMember($target_c_commu_id)));

        //$this->set("c_commu", db_commu_c_commu4c_commu_id );
        $this->set("c_commu", biz_getGroupMember($target_c_commu_id));

        $page_size = 50;

        //次ページへのインクリメント
        $page += $direc;


        $c_member_list = biz_getGroupMember($target_c_commu_id, $page_size, $start);

        foreach ($c_member_list as $key => $value) {
            $c_member_list[$key] = db_member_c_member4c_member_id_LIGHT($value['member_id']);
        }

        $total_num = count(biz_getGroupMember($target_c_commu_id));

        $this->set('inc_navi', fetch_inc_navi('h'));

        $this->set("c_member_list", $c_member_list);
        $this->set("page", $page);
        $this->set("total_num", $total_num);
        $this->set('start_num', $start);
        $this->set('end_num', $start+$page_size-1);

        for($i=1;$i<=ceil($total_num / $page_size);$i++){
            $page_num[]=($i-1) * $page_size +1;
        }
        $this->set("page_num",$page_num);

        return 'success';
    }
}

?>
