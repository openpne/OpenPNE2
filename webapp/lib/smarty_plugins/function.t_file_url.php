<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_file_url($params, &$smarty)
{
    $p = _smarty_function_t_file_url($params);

    if (OPENPNE_USE_PARTIAL_SSL && is_ssl()) {
        $url = OPENPNE_SSL_URL;
    } else {
        $url = OPENPNE_URL;
    }

    $url .= 'download.php';
    if ($q = http_build_query($p)) {
        $url .= '?' . htmlspecialchars($q);
    }

    return $url;
}

/**
 * validate params
 * @param  array $params
 * @return array
 */
function _smarty_function_t_file_url($params)
{
    $result = array();

    if (!empty($params['filename'])) {
        $filename = $params['filename'];
    }
    $result['filename'] = $filename;

    if ($GLOBALS['__Framework']['current_module'] === 'admin' && ADMIN_MODULE_NAME) {
        $result['m'] = ADMIN_MODULE_NAME;
    } else {
        $result['m'] = $GLOBALS['__Framework']['current_module'];
    }

    if ($GLOBALS['KTAI_URL_TAIL']) {
        $result['ksid'] = session_id();
    }

    return $result;
}

?>
