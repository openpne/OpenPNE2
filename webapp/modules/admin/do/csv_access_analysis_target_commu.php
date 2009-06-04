<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_csv_access_analysis_target_commu extends OpenPNE_Action
{
    function isSecure()
    {
        session_cache_limiter('public');
        return true;
    }

    function handleError($errors)
    {
        admin_client_redirect('access_analysis_target_commu', array_shift($errors));
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

        //IE以外の場合、キャッシュをさせないヘッダを出力
        if (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') === false) {
            send_nocache_headers(true);
        }
        header("Content-Type: application/octet-stream");
        header("Content-Disposition: attachment; filename=access_analysis_target_commu.csv");

        $out = fopen('php://output', 'w');

        $csv_header = array(WORD_COMMUNITY . 'ID', WORD_COMMUNITY . '名', 'アクセス数');
        for ($i = 0; $i < sizeof($csv_header); $i++) {
            $csv_header[$i] = mb_convert_encoding($csv_header[$i], 'SJIS', 'UTF-8');
        }
        fputcsv($out, $csv_header);

        $sum = 0;
        $page = 1;
        $page_size = -1;
        list($target_commu) = p_access_analysis_target_commu_target_commu4ym_page_name($ymd, $month_flag, $page_name, $ktai_flag, $page, $page_size, $orderby);
        foreach ($target_commu as $item) {
            $name = $item['is_c_commu_exists'] ? $item['name'] : '(既に削除された' . WORD_COMMUNITY . 'です)';
            $name = mb_convert_encoding($name, 'SJIS', 'UTF-8');

            $csv_line = array($item['target_c_commu_id'], $name, $item['count']);
            fputcsv($out, $csv_line);
            $sum += $item['count'];
        }
        fputcsv($out, array(mb_convert_encoding('合計', 'SJIS', 'UTF-8'), '', $sum));
        exit;
    }
}

?>
