<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

$carrier = $argv[1];
$input_path = $argv[2];
$output_path = $argv[3];

if (empty($carrier) || empty($input_path)) {
	exit('carrier and input_path are must paramater');
} elseif (is_dir($input_path) === false) {
	exit('input_path is not directory');
}

if (empty($output_path)) {
	$output_path = OPENPNE_PUBLIC_HTML_DIR .  '/skin/default/img/emoji/' . $carrier . '/';
} elseif (is_dir($output_path) === false) {
	exit('output_path is not directory');
}

switch ($carrier) {
case 'i':
    convert_i_emoji_img($input_path, $output_path);
    break;
case 'a':
    break;
case 's':
    break;
default:
    exit('carrier is not valid');
    break;
}

function convert_i_emoji_img($input_path, $output_path)
{
    $input_dir = opendir($input_path);

    if ($input_dir !== false && $output_dir !== false) {
    	while (($file = readdir($input_dir)) !== false) {
    		if (array_pop(explode('.', $file)) == 'gif') {
    			$code = hexdec('0x' . basename($file, '.gif'));
                if ((0xF89F <= $code) && ($code <= 0xF8FC) ||
                    (0xF940 <= $code) && ($code <= 0xF949) ||
                    (0xF950 <= $code) && ($code <= 0xF952) ||
                    (0xF955 <= $code) && ($code <= 0xF957) ||
                    (0xF95B <= $code) && ($code <= 0xF95E) ||
                    (0xF972 <= $code) && ($code <= 0xF97E) ||
                    (0xF980 <= $code) && ($code <= 0xF9B0)) {
                    $emoji_bin = pack("C*", $code >> 8, $code % 256);
                } else {
                    $emoji_bin = pack("C*", 0xF9, $code);
                }
                $emoji_num = str_replace('%', '', emoji_escape_i($emoji_bin));
                if (!empty($emoji_num)) {
                    $input_emoji = $input_path . $file;
                    $output_emoji = $output_path .  $emoji_num . '.gif';
                    copy($input_emoji, $output_emoji);
                }
    		}
    	}
    }

    return false;
}
?>
