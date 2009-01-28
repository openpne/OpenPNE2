<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_url($params, &$smarty)
{
    $urlencode = false;
    if (isset($params['_urlencode'])) {
        $urlencode = (bool)$params['_urlencode'];
        unset($params['_urlencode']);
    }

    $absolute = false;
    if (isset($params['_absolute'])) {
        $absolute = (bool)$params['_absolute'];
        unset($params['_absolute']);
    }

    $html = true;
    if (isset($params['_html'])) {
        $html = (bool)$params['_html'];
        unset($params['_html']);
    }

    $module = $params['m'];
    $action = $params['a'];

    $url = openpne_gen_url($module, $action, $params, $absolute);
    if ($html) {
        $url = htmlspecialchars($url, ENT_QUOTES, 'UTF-8');
    }

    if ($urlencode) {
        $url = urlencode($url);
    }

    return $url;
}

?>
