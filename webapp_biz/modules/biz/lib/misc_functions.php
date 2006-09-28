<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//bizモジュール用 雑多関数ライブラリ

//予期しない多重定義を避けるため、必ず関数名にはbiz_というprefixをつける

//CONST-------------------------------------------


//GET---------------------------------------------


//SET---------------------------------------------

//連番の配列を作る
function biz_makeSerialArray($count, $begin=0, $increase = 1)
{
    $tmp = array();
    
    for($i = $begin; $i <= $count; $i += $increase)
        array_push($tmp, $i);

    return $tmp;
}

?>
