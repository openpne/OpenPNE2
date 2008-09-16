<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

if (OPENPNE_UNDER_MAINTENANCE) {
    exit;
}

$c_review_list = db_review_get_c_review_all();
foreach ($c_review_list as $c_review) {
    $asin = $c_review['asin'];
    $product = db_review_write_product4asin($asin);
    if (!$product) {
        continue;
    }

    $data = array(
        'title'        => $product['ItemAttributes']['Title'],
        'release_date' => $product['ItemAttributes']['PublicationDate'],
        'manufacturer' => $product['ItemAttributes']['Manufacturer'],
        'author'       => $product['author'],
        'image_small'  => $product['SmallImage']['URL'],
        'image_medium' => $product['MediumImage']['URL'],
        'image_large'  => $product['LargeImage']['URL'],
        'url'          => $product['DetailPageURL'],
        'asin'         => $product['ASIN'],
        'list_price'   => $product['ListPrice']['FormattedPrice'],
        'retail_price' => $product['OfferSummary']['LowestUsedPrice']['FormattedPrice'],
    );

    foreach ($data as $key => $value) {
        if (is_null($value)) {
            $data[$key] = '';
        }

        if ($c_review[$key] != $value) {
            _db_c_review_update($c_review['c_review_id'], $data); 
            break;
        }
    }
}

function _db_c_review_update($c_review_id, $data)
{
    $where = array('c_review_id' => intval($c_review_id));
    return db_update('c_review', $data, $where);
}
?>
