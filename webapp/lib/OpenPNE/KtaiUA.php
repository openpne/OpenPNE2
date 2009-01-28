<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class OpenPNE_KtaiUA
{
    var $is_ktai = false;

    var $is_docomo   = false;
    var $is_vodafone = false;
    var $is_au       = false;
    var $is_willcom  = false;
    var $is_emobile  = false;

    /**
     * constructor
     */
    function OpenPNE_KtaiUA($server = null)
    {
        if (is_null($server)) {
            $server = $_SERVER;
        }
        $this->classify($server);
    }

    /**
     * User-Agent の値からキャリア情報を判別する
     */
    function classify($server)
    {
        $ua = $server['HTTP_USER_AGENT'];

        // DoCoMo
        if (!strncmp($ua, 'DoCoMo', 6)) {
            $this->is_docomo = true;
            $this->is_ktai = true;
        }

        // Vodafone(PDC)
        elseif (!strncmp($ua, 'J-PHONE', 7)) {
            $this->is_vodafone = true;
            $this->is_ktai = true;
        }
        // Vodafone(3G)
        //* Up.Browser を搭載しているものがある(auより先に評価)
        elseif (!strncmp($ua, 'Vodafone', 8)
             || !strncmp($ua, 'MOT', 3)) {
            $this->is_vodafone = true;
            $this->is_ktai = true;
        }
        // SoftBank
        elseif (!strncmp($ua, 'SoftBank', 8)) {
            $this->is_vodafone = true;
            $this->is_ktai = true;
        }

        // au
        elseif (!strncmp($ua, 'KDDI', 4)
             || !strncasecmp($ua, 'up.browser', 10)) {
            $this->is_au = true;
            $this->is_ktai = true;
        }

        // WILLCOM / DDIPOCKET
        elseif (strpos($ua, 'WILLCOM') !== false
             || strpos($ua, 'SHARP/WS') !== false
             || strpos($ua, 'DDIPOCKET') !== false) {
            $this->is_ktai = true;
            $this->is_willcom = true;
        }
        //emobile
        elseif (strpos($ua, 'emobile') !== false
             || stristr($this->_ua, 'Huawei') != false) {
            $this->is_emobile = true;
            $this->is_ktai = true;
        }
        elseif (isset($_SERVER['HTTP_X_EM_UID'])) {
            $this->is_emobile = true;
            $this->is_ktai = true;
        }

        else {
            $this->is_ktai = false;
        }
    }

    function is_ktai() { return $this->is_ktai; }
    function is_docomo() { return $this->is_docomo; }
    function is_vodafone() { return $this->is_vodafone; }
    function is_au() { return $this->is_au; }
    function is_willcom() { return $this->is_willcom; }
    function is_emobile() { return $this->is_emobile; }
}

?>
