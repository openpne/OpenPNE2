<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_img_album_url($params, &$smarty)
{
    $p = _smarty_function_t_img_album_url($params);
    $html = true;
    if (isset($params['_html'])) {
        $html = (bool)$params['_html'];
        unset($params['_html']);
    }
    $urlencode = false;
    if (isset($params['_urlencode'])) {
        $urlencode = (bool)$params['_urlencode'];
        unset($params['_urlencode']);
    }

    if (OPENPNE_IMG_URL) {
        $url = OPENPNE_IMG_URL;
    } else {
        if (OPENPNE_USE_PARTIAL_SSL && is_ssl()) {
            $url = OPENPNE_SSL_URL;
        } else {
            $url = OPENPNE_URL;
        }
    }

    if (!OPENPNE_IMG_CACHE_PUBLIC||true) {
        $url .= 'img_album.php';
        if ($q = http_build_query($p)) {
            if ($html) {
                $url .= '?' . htmlspecialchars($q);
            } else {
                $url .= '?' . $q;
            }
        }
    } else {
        include_once 'OpenPNE/Img_album.php';
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

    if ($urlencode) {
        $url = urlencode($url);
    }

    return $url;
}

/**
 * validate params
 * @param  array $params
 * @return array
 */
function _smarty_function_t_img_album_url($params)
{
    $result = array();

    if (!empty($params['filename']) && preg_match('/^\w+(?:\.((?:jpe?g)|(?:gif)|(?:png)))?$/', $params['filename'])) {
        $filename = $params['filename'];
    } else {
        if (!empty($params['noimg'])) {
            $filename = db_get_c_skin_filename4skinname($params['noimg']);
        } else {
            $filename = db_get_c_skin_filename4skinname('no_image');
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
    
    $result['m'] = $GLOBALS['__Framework']['current_module'];
    
    if ($GLOBALS['KTAI_URL_TAIL']) {
    	$result['ksid'] = session_id();
    }

    return $result;
}

?>
