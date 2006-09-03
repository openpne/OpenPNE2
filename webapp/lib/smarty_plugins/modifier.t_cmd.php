<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_modifier_t_cmd($string)
{
    if (!OPENPNE_USE_CMD_TAG) {
        return $string;
    }
    $regexp = '/&lt;cmd\s+src="(\w+)"\s+args="([\w-\+%]+(,[\w-\+%]+)*)"\s*&gt;/i';
    return preg_replace_callback($regexp, '_smarty_modifier_t_cmd_make_js', $string);
}

function _smarty_modifier_t_cmd_make_js($matches)
{
    $src  = $matches[1];
    $args = $matches[2];

    $_args = explode(',', $args);
    $arg_str = "'" . implode("','", $_args) . "'";

    $result = <<<EOD
<script type="text/javascript" src="js/{$src}.js"></script>
<script type="text/javascript">
<!--
main({$arg_str});
//-->
</script>
EOD;
    return $result;
}

?>
