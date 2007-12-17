<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_img_url_skin($params, &$smarty)
{
    $p = _smarty_function_t_img_url_skin($params);

    if (OPENPNE_IMG_URL) {
        $url = OPENPNE_IMG_URL;
    } else {
        if (OPENPNE_USE_PARTIAL_SSL && is_ssl()) {
            $url = OPENPNE_SSL_URL;
        } else {
            $url = OPENPNE_URL;
        }
    }

    if (!$filename = db_get_c_skin_filename4skinname($p['filename'])) {
        if (strpos($p['filename'], 'skin_') === 0) {
            $ext = 'jpg';
        } else {
            $ext = 'gif';
        }
        $url .= sprintf('skin/%s.%s', $p['filename'], $ext);
    } else {
        

        if (!OPENPNE_IMG_CACHE_PUBLIC) {
            $url .= 'img_skin.php';
            $p['image_filename'] = $filename;
            if ($q = http_build_query($p)) {
                $url .= '?' . htmlspecialchars($q);
            }
        } else {
            $p['filename'] = $filename;
            include_once 'OpenPNE/Img.php';
            if (!$p['f']) {
                $parts = explode('.', $p['filename']);
                $f = array_pop($parts);
                switch ($f) {
                case 'jpg':
                case 'gif':
                case 'png':
                    $p['f'] = $f;
                    break;
                default:
                    $p['f'] = 'jpg';
                    break;
                }
            }
            $path = OpenPNE_Img::get_cache_path($p['filename'], $p['w'], $p['h'], $p['f']);
            $url .= 'img/' . $path;
        }
    }

    return $url;
}

/**
 * validate params
 * @param  array $params
 * @return array
 */
function _smarty_function_t_img_url_skin($params)
{
    $result = array();

    if (!empty($params['filename']) && preg_match('/^\w+(?:\.((?:jpe?g)|(?:gif)|(?:png)))?$/', $params['filename'])) {
        $filename = $params['filename'];
    } else {
        if (!empty($params['noimg'])) {
            $filename = $params['noimg'];
        } else {
            $filename = 'no_image.gif';
        }
    }
    $result['filename'] = $filename;

    if (!empty($params['w']) && (intval($params['w']) > 0)) {
        $result['w'] = intval($params['w']);
    }
    if (!empty($params['h']) && (intval($params['h']) > 0)) {
        $result['h'] = intval($params['h']);
    }

    if (!empty($params['f'])) {
        switch ($params['f']) {
        case 'jpg':
        case 'gif':
        case 'png':
            $result['f'] = $params['f'];
            break;
        }
    }

    return $result;
}

?>
