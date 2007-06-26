<?php

/** 
 * Etag class
 *
 * @author  Ryosuke Hosoi <hosoi ryo.com>
 * @package Etag
 * @access  public
 * @version 1.0
 */
class Etag
{
    /**
     * the http etag string
     * @var string
     */
    var $etag;

    /**
     * the last modified timestamp
     * @var integer
     */
    var $upd_time;

    /**
     * the apache httpd request headers
     * @var array
     */
    var $request_headers;

    /**
     * Constructor
     *
     * @access publice
     * @param string $key the etag md5 key
     * @param mixed $time the document last modified timestamp
     * @return void
     */
    function Etag($key = '', $time = '')
    {
        if (strlen($key))
            $this->etag = md5($key);
        else
            $this->etag = null;

        if (is_array($time)) {
            $this->upd_time = 0;
            foreach ($time as $t) {
                if (ereg("^[0-9]{10}$", $t)) {
                    $tmp = $t;
                } else {
                    $tmp = $this->parse_http_date($t);
                    $tmp = $tmp['timestamp'];
                }
                if ($this->upd_time < $tmp)
                    $this->upd_time = $tmp;
            }
            if ($this->upd_time === 0)
                $this->upd_time = null;

        } elseif (strlen($time)) {
            if (ereg("^[0-9]{10}$", $time)) {
                $this->upd_time = $time;
            } else {
                $tmp = $this->parse_http_date($time);
                if ($tmp['timestamp'])
                    $this->upd_time = $tmp['timestamp'];
                else
                    $this->upd_time = null;
            }
        } else {
            $this->upd_time = null;
        }

        if (is_callable('apache_request_headers')) {
            $this->request_headers = apache_request_headers();
        } else {
            $this->request_headers = $_SERVER;
        }
    }

    /**
     * http date parser
     *
     * @access private
     * @param string $string_date the date string
     * @return array
     */
    function parse_http_date( $string_date )
    {
        // 月の名前と数字を定義
        $define_month = array(
                              "01"=> "Jan", "02" => "Feb", "03" => "Mar",
                              "04" => "Apr", "05" => "May", "06" => "Jun",
                              "07" => "Jul", "08" => "Aug", "09" => "Sep",
                              "10" => "Oct", "11" => "Nov", "12" => "Dec"
                              );

        $temp_date = array();
        if( preg_match( "/^(Mon|Tue|Wed|Thu|Fri|Sat|Sun), ([0-3][0-9]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) ([0-9]{4}) ([0-2][0-9]):([0-5][0-9]):([0-5][0-9]) GMT$/", $string_date, $temp_date ) ) {
            $date["hour"] = $temp_date[5];
            $date["minute"] = $temp_date[6];
            $date["second"] = $temp_date[7];
            // 定義済みの月の名前を数字に変換する
            $date["month"] = array_search( $temp_date[3], $define_month );
            $date["day"] = $temp_date[2];
            $date["year"] = $temp_date[4];
        } elseif( preg_match( "/^(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday), ([0-3][0-9])-(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)-([0-9]{2}) ([0-2][0-9]):([0-5][0-9]):([0-5][0-9]) GMT$/", $string_date, $temp_date ) ) {
            $date["hour"] = $temp_date[5];
            $date["minute"] = $temp_date[6];
            $date["second"] = $temp_date[7];
            // 定義済みの月の名前を数字に変換する
            $date["month"] = array_search( $temp_date[3], $define_month );
            // 年が2桁しかないので1900を足して4桁に
            $date["day"] = $temp_date[2];
            $date["year"] = 1900 + $temp_date[4];
        } elseif( preg_match( "/^(Mon|Tue|Wed|Thu|Fri|Sat|Sun) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) ([0-3 ][0-9]) ([0-2][0-9]):([0-5][0-9]):([0-5][0-9]) ([0-9]{4})$/", $string_date, $temp_date ) ) {
            $date["hour"] = $temp_date[4];
            $date["minute"] = $temp_date[5];
            $date["second"] = $temp_date[6];
            $date["month"] = array_search( $temp_date[2], $define_month );
            // 日が1桁の場合先、半角スペースを0に置換
            $date["day"] = str_replace( " ", 0, $temp_date[3] );
            // 定義済みの月の名前を数字に変換する
            $date["year"] = $temp_date[7];
        } elseif (@strtotime($string_date) > 0) {
            $date["timestamp"] = strtotime($string_date);
            $date["year"] = gmdate("Y", $date["timestamp"]);
            $date["month"] = gmdate("m", $date["timestamp"]);
            $date["day"] = gmdate("d", $date["timestamp"]);
            $date["hour"] = gmdate("H", $date["timestamp"]);
            $date["minute"] = gmdate("i", $date["timestamp"]);
            $date["second"] = gmdate("s", $date["timestamp"]);
        } else {
            return FALSE;
        }

        // UNIXタイムスタンプを生成(GMT)
        $date["timestamp"] = gmmktime( $date["hour"], $date["minute"], $date["second"], $date["month"], $date["day"], $date["year"] );

        return $date;
    }

    /**
     * etag checker
     *
     * @access public
     * @return boolean
     */
    function etagCheck()
    {
        if (!@isset($this->etag)) {
            return false;
        }
        if (!@isset($this->upd_time)) {
            return false;
        }

        if ($this->request_headers['If-None-Match']) {
            // Etagによる確認
            $match = $this->request_headers['If-None-Match'];
            $match = trim(str_replace('"', '', $match));
            if ($match == $this->etag) {
                header('HTTP/1.1 304 Not Modified');
                header('Etag: "'.$this->etag.'"');
                return true;
            }
        } elseif ($this->request_headers['If-Modified-Since']) {
            // 最終更新日時による確認
            $since = $this->parse_http_date($this->request_headers['If-Modified-Since']);
            if($since['timestamp'] >= $this->upd_time ) {
                header('HTTP/1.1 304 Not Modified');
                header('Etag: "'.$this->etag.'"');
                return true;
            }
        }

        @header('Etag: "'.$this->etag.'"');
        @header('Last-Modified: '.@gmdate('D, d M Y H:i:s', $this->upd_time).' GMT');
        return false;
    }
}

?>
