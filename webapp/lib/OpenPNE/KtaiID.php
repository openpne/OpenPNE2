<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * OpenPNE_KtaiID
 *
 * 個体識別番号を取得する
 *
 * @package OpenPNE
 * @author OGAWA Rinpei <ogawa@tejimaya.com>
 * @author KUNIHARU Tsujioka
 */
class OpenPNE_KtaiID
{
    /**
     * constructor
     *
     * @access public
     */
    function OpenPNE_KtaiID()
    {
    }

    /**
     * 個体識別番号を取得する (static)
     *
     * @access public
     * @return string 個体識別番号(取得できなかった場合は空文字列)
     */
    function getID()
    {
        $id = '';
        $ua = $_SERVER['HTTP_USER_AGENT'];

        // DoCoMo
        if (!strncmp($ua, 'DoCoMo', 6)) {
            // mova
            if (substr($ua, 7, 3) === '1.0') {
                // 『/』区切りで最後のものを取る
                $pieces = explode('/', $ua);
                $ser = array_pop($pieces);

                if (!strncmp($ser, 'ser', 3)) {
                    $id = $ser;
                }
            }
            // FOMA
            elseif (substr($ua, 7, 3) === '2.0') {
                $icc = substr($ua, -24, -1);

                if (!strncmp($icc, 'icc', 3)) {
                    $id = $icc;
                }
            }
            // iモードID
            elseif (isset($_SERVER['HTTP_X_DCMGUID'])) {
                $id = $_SERVER['HTTP_X_DCMGUID'];
            }
        }

        // Vodafone(PDC)
        elseif (!strncmp($ua, 'J-PHONE', 7)) {
            $pieces = explode('/', $ua);
            $piece_sn = explode(' ', $pieces[3]);
            $sn = array_shift($piece_sn);

            if (!strncmp($sn, 'SN', 2)) {
                $id = $sn;
            }
        }
        // Vodafone(3G)
        //* Up.Browser を搭載しているものがある(auより先に評価)
        //* MOTは製造番号を取得できない
        elseif (!strncmp($ua, 'Vodafone', 8)) {
            $pieces = explode('/', $ua);
            $piece_sn = explode(' ', $pieces[4]);
            $sn = array_shift($piece_sn);

            if (!strncmp($sn, 'SN', 2)) {
                $id = $sn;
            } elseif (isset($_SERVER['HTTP_X_JPHONE_UID'])) { // UID を取得
                $id = $_SERVER['HTTP_X_JPHONE_UID'];
            }
        }
        // SoftBank
        elseif (!strncmp($ua, 'SoftBank', 8)) {
            $pieces = explode('/', $ua);
            $piece_sn = explode(' ', $pieces[4]);
            $sn = array_shift($piece_sn);

            if (!strncmp($sn, 'SN', 2)) {
                $id = $sn;
            } elseif (isset($_SERVER['HTTP_X_JPHONE_UID'])) { // UID を取得
                $id = $_SERVER['HTTP_X_JPHONE_UID'];
            }
        }

        // au
        elseif (!strncmp($ua, 'KDDI', 4)
              || !strncasecmp($ua, 'up.browser', 10)
            ) {
            //サブスクラバID(au)
            if ($_SERVER['HTTP_X_UP_SUBNO']) {
                $id = $_SERVER['HTTP_X_UP_SUBNO'];
            }
        }

        // emobile
        elseif (strpos($ua, 'emobile') !== false
              || stristr($this->_ua, 'Huawei') != false
              || isset($_SERVER['HTTP_X_EM_UID'])
            ) {
            $id = $_SERVER['HTTP_X_EM_UID'];
        }

        return $id;
    }
}

?>
