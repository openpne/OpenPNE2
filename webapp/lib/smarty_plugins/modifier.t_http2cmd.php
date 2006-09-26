<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_modifier_t_http2cmd($string)
{
    if (!OPENPNE_USE_CMD_TAG) {
        return $string;
    }

    $regexp_url = "/http:\/\/www.([.a-zA-Z0-9]+)\/[-_.!~*'()a-zA-Z0-9;\/?:\@&=+\$,%#]+/i";
    
    $string = preg_replace_callback($regexp_url, '_smarty_modifier_t_cmd_make_url_js', $string);

    return $string;

}

function _smarty_modifier_t_cmd_make_url_js($matches)
{
    $url  = "'".$matches[0]."'";
    $src  = $matches[1];

    //該当ファイルがない
    if ( !is_file('./http2cmd/'.$src.'.js') ) {
        return $matches[0];
    }

    $result = <<<EOD
<script type="text/javascript" src="http2cmd/{$src}.js"></script>
<script type="text/javascript">
<!--
http2cmd({$url});
//-->
</script>
EOD;
    return $result;
}

?>

