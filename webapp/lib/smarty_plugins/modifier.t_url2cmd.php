<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_modifier_t_url2cmd($string, $type = '')
{
    // "(&quot;) 、 '(&#039;) 、 <(&lt;) 、 >(&gt;) を元に戻す
    $search = array('&quot;', '&#039;', '&lt;', '&gt;');
    $replace = array('"', "'", "<", ">");
    $string = str_replace($search, $replace, $string);

    $url_pattern = "/https?:\/\/([a-zA-Z0-9-.]+)\/?[\w\-.,:;\~\^\/?\@&=+\$%#!()]*/";
    $GLOBALS['_CMD']['type'] = $type;

    return preg_replace_callback($url_pattern, '_smarty_modifier_t_cmd_make_url_js', $string);
}

function _smarty_modifier_t_cmd_make_url_js($matches)
{
    $url = $matches[0];
    $file = $matches[1] . '.js';
    $path = './cmd/' . $file;

    if (!OPENPNE_USE_CMD_TAG || !db_is_use_cmd($matches[1], $GLOBALS['_CMD']['type']) || !is_readable($path)) {
        // t_url2a
        return pne_url2a($url);
    }

    $result = <<<EOD
<script type="text/javascript" src="cmd/{$file}"></script>
<script type="text/javascript">
<!--
url2cmd('{$url}');
//-->
</script>
EOD;
    return $result;
}

?>
