<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_prefilter_pne_nodefaults($tpl_source, &$smarty)
{
    $tpl_source = preg_replace_callback('/\(\{if .*?\}\)/', '_smarty_prefilter_pne_nodefaults_callback', $tpl_source);
    $tpl_source = preg_replace_callback('/\(\{elseif .*?\}\)/', '_smarty_prefilter_pne_nodefaults_callback', $tpl_source);
    $tpl_source = preg_replace_callback('/\(\{foreach .*?\}\)/', '_smarty_prefilter_pne_nodefaults_callback', $tpl_source);
    $tpl_source = preg_replace_callback('/\(\{t_loop .*?\}\)/', '_smarty_prefilter_pne_nodefaults_callback', $tpl_source);
    return $tpl_source;
}

function _smarty_prefilter_pne_nodefaults_callback($matches)
{
    return preg_replace('/\$[a-zA-Z0-9_\.\[\]\$]+/', '\0|smarty:nodefaults', $matches[0]);
}

?>
