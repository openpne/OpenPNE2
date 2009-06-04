<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_csv_access_analysis_target_member extends OpenPNE_Action
{
    function isSecure()
    {
        session_cache_limiter('public');
        return true;
    }

    function handleError($errors)
    {
        admin_client_redirect('access_analysis_target_member', array_shift($errors));
    }

    function execute($requests)
    {
        if (!LOG_C_ACCESS_LOG) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }

        $ktai_flag = $requests['ktai_flag'];
        $ymd = $requests['ymd'];
        $month_flag = $requests['month_flag'];
        $page_name = $requests['page_name'];
        $orderby = $requests['orderby'];

        header("Content-Type: application/octet-stream");
        header("Content-Disposition: attachment; filename=access_analysis_target_member.csv");

        $out = fopen('php://output', 'w');

        $csv_header = array('メンバーID', WORD_NICKNAME, 'アクセス数');
        for ($i = 0; $i < sizeof($csv_header); $i++) {
            $csv_header[$i] = mb_convert_encoding($csv_header[$i], 'SJIS', 'UTF-8');
        }
        fputcsv($out, $csv_header);

        $sum = 0;
        $page = 1;
        $page_size = -1;
        list($target_member) = p_access_analysis_target_member_access_member4ym_page_name($ymd, $month_flag, $page_name, $ktai_flag, $page, $page_size, $orderby);
        foreach ($target_member as $item) {
            $nickname = $item['is_c_member_exists'] ? $item['nickname'] : '(既に退会したメンバーです)';
            $nickname = mb_convert_encoding($nickname, 'SJIS', 'UTF-8');

            $csv_line = array($item['target_c_member_id'], $nickname, $item['count']);
            fputcsv($out, $csv_line);
            $sum += $item['count'];
        }
        fputcsv($out, array(mb_convert_encoding('合計', 'SJIS', 'UTF-8'), '', $sum));
        exit;
    }
}

?>
