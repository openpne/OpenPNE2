<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_modifier_t_cmd($string, $type = '')
{
    if (!OPENPNE_USE_CMD_TAG) {
        return $string;
    }

    $regexp = '/(&lt;|<)cmd\s+src=(&quot;|"|\')(\w+)(&quot;|"|\')(?:\s+args=(&quot;|"|\')([a-zA-Z0-9_\-+%]+(,[a-zA-Z0-9_\-+%]+)*)(&quot;|"|\'))?\s*(&gt;|>)/i';
    $GLOBALS['_CMD']['type'] = $type;

    return preg_replace_callback($regexp, '_smarty_modifier_t_cmd_make_js', $string);
}

function _smarty_modifier_t_cmd_make_js($matches)
{
    if (!db_is_use_cmd($matches[3], $GLOBALS['_CMD']['type'])) {
        return $matches[0];
    }

    $src  = $matches[3];
    $args = $matches[6];

    $_args = explode(',', $args);
    $arg_str = "'" . implode("','", $_args) . "'";

    $result = <<<EOD
<script type="text/javascript" src="cmd/{$src}.js"></script>
<script type="text/javascript">
<!--
main({$arg_str});
//-->
</script>
EOD;
    return $result;
}


?>
