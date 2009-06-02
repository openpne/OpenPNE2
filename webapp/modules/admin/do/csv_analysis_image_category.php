<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_csv_analysis_image_category extends OpenPNE_Action
{
    function isSecure()
    {
        session_cache_limiter('public');
        return true;
    }

    function handleError($errors)
    {
        admin_client_redirect('image_analysis_category', array_shift($errors));
    }

    function execute($requests)
    {
        $csv = '"カテゴリ","画像容量","平均容量(1人当り)"' . "\n";
        $csv = mb_convert_encoding($csv, 'SJIS', 'UTF-8');

        $analysis_image_category = get_analysis_image_category();
        foreach ($analysis_image_category as $key => $value) {
            $category = $analysis_image_category[$key]['category'];
            $category = mb_convert_encoding($category, 'SJIS', 'UTF-8');
            $sum = $analysis_image_category[$key]['sum'];
            $avg = $analysis_image_category[$key]['avg'];
            $csv .= sprintf("\"%s\",%01.2f,%01.2f\n", $category, $sum, $avg);
        }
        $analysis_image_category_sum = get_analysis_image_category_sum();
        $category_sum = $analysis_image_category_sum['category'];
        $category_sum = mb_convert_encoding($category_sum, 'SJIS', 'UTF-8');
        $sum_all = $analysis_image_category_sum['sum'];
        $avg_all = $analysis_image_category_sum['avg'];
        $csv .= sprintf("\"%s\",%01.2f,%01.2f\n", $category_sum, $sum_all, $avg_all);

        //IE以外の場合、キャッシュをさせないヘッダを出力
        if (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') === false) {
            send_nocache_headers(true);
        }
        header("Content-Type: application/octet-stream");
        header("Content-Disposition: attachment; filename=analysis_image_category.csv");
        echo $csv;
        exit;
    }
}

?>
