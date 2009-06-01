<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_csv_user_analysis_date_day extends OpenPNE_Action
{
    function isSecure()
    {
        session_cache_limiter('public');
        return true;
    }

    function handleError($errors)
    {
        admin_client_redirect('user_analysis_date_day', array_shift($errors));
    }

    function execute($requests)
    {
        $date = $requests['date'];

        list($year, $month, $day) = explode('-', $date);
        $date = mb_substr($date,0,7);

        $csv = '"年月日","人数"' . "\n";
        $csv = mb_convert_encoding($csv, 'SJIS', 'UTF-8');

        $analysis_date_day = get_analysis_date_day($date);
        foreach ($analysis_date_day as $key => $value) {
            $csv .= sprintf("\"%d/%d/%d\",%d\n", $year, $month, $key, $value);
        }
        $csv_analysis_sum = '合計';
        $csv_analysis_sum = mb_convert_encoding($csv_analysis_sum, 'SJIS', 'UTF-8');
        $analysis_date_day_sum = array_sum($analysis_date_day);
        $csv .= sprintf("\"%s\",%d\n", $csv_analysis_sum, $analysis_date_day_sum);

        //IE以外の場合、キャッシュをさせないヘッダを出力
        if (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') === false) {
            send_nocache_headers(true);
        }
        header("Content-Type: application/octet-stream");
        header("Content-Disposition: attachment; filename=user_analysis_date_day.csv");
        echo $csv;
        exit;
    }
}

?>
