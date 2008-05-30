<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_download_xml extends OpenPNE_Action
{
    function handleError($errors)
    {
        $msg = array_shift($errors);
        admin_client_redirect('download_xml', $msg);
    }

    function execute($requests)
    {
        $c_commu_category_list = db_commu_c_commu_category4null();
        $this->set("c_commu_category_list", $c_commu_category_list);

        // 表示用データ作成
        $date['month'] = create_option_values(1, 12);
        $date['day'] = create_option_values(1, 31);
        $this->set("date", $date);
        return 'success';
    }
}

function create_option_values($start, $end)
{
    $ret = array();
    for ($i = $start; $i <= $end; $i++) {
        array_push($ret, $i);
    }
    return $ret;
}

?>
