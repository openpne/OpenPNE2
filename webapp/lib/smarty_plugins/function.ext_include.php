<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * Smarty {ext_include} function plugin
 * 組み込み関数 include のextディレクトリ対応版
 *
 *   {include file="**"}
 *  なる部分を
 *   {ext_include file="**"}
 *  とすればOK
 */
function smarty_function_ext_include($params, &$smarty)
{
    $place = '';
    $template = $smarty->templates_dir . '/' . $params['file'];

    // 拡張ファイルチェック
    if (!$tpl = $smarty->ext_search($template, $place)) {
        $smarty->trigger_error('ext_include: tpl file not found. '.$tpl);
        return;
    }
    $tpl = 'file:' . $tpl;

    $params['smarty_include_tpl_file'] = $tpl;
    $params['smarty_include_vars'] = array();
    $smarty->_smarty_include($params);
    return;
}

?>
