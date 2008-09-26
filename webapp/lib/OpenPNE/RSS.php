<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'simplepie.inc';

/**
 * OpenPNE_RSS
 * RSS/Atom取得ライブラリ
 */
class OpenPNE_RSS
{
    /** @var string 出力文字エンコーディング */
    var $charset;

    function OpenPNE_RSS($charset = '')
    {
        $this->charset = $charset;
    }

    function create_simplepie_object($rss_url)
    {
        $feed =& new SimplePie();
        if (OPENPNE_USE_HTTP_PROXY) {
            $proxy = OPENPNE_HTTP_PROXY_HOST . ":" . OPENPNE_HTTP_PROXY_PORT;
            $feed->set_proxy($proxy);
        }

        $feed->set_feed_url($rss_url);
        $feed->set_cache_location(OPENPNE_RSS_CACHE_DIR);
        if (!(@$feed->init())) {
            return false;
        }

        return $feed;
    }

    function get_feed_title($rss_url)
    {
        if (!$feed =& $this->create_simplepie_object($rss_url)) {
            return false;
        }

        return @$feed->get_title();
    }

    function get_feed_description($rss_url)
    {
        if (!$feed =& $this->create_simplepie_object($rss_url)) {
            return false;
        }

        return @$feed->get_description();
    }

    function fetch($rss_url, $is_get_feed_title = false)
    {
        if (!$feed =& $this->create_simplepie_object($rss_url)) {
            return false;
        }

        if (!($items = $feed->get_items())) {
            return false;
        }

        if ($is_get_feed_title) {
            $feed_title = @$feed->get_title();
        } else {
            $feed_title = '';
        }

        $result = array();
        foreach ($items as $item) {
            $title = $item->get_title();
            $links = $item->get_links();
            $description = $item->get_description();
            $date = @$item->get_date('Y-m-d H:i:s');
            $enclosure = $item->get_enclosure();

            if (!$title) {
                $title = '';
            }

            if (!$description) {
                $description = '';
            }

            if (!$links) {
                $link = '';
            } else {
                $link = $links[0];
            }

            if (!$date) {
                $date = '';
            }

            if (!$enclosure) {
                $enclosure = '';
            }

            // エスケープされた文字列を元に戻す
            $trans_table = array_flip(get_html_translation_table(HTML_SPECIALCHARS, ENT_QUOTES));
            $trans_table['&#039;'] = "'";
            $title = strtr($title, $trans_table);
            $description = strtr($description, $trans_table);
            $link = strtr($link, $trans_table);

            $f_item = array(
                'title' => $this->convert_encoding($title),
                'body'  => $this->convert_encoding($description),
                'link'  => $link,
                'date'  => $date,
                'enclosure' => $enclosure,
            );
            $result[] = $f_item;
        }

        if ($is_get_feed_title && $feed_title) {
            return array($feed_title, $result);
        }

        return $result;
    }

    function convert_encoding($string)
    {
        if (!$this->charset) {
            return $string;
        }
        return mb_convert_encoding($string, $this->charset, 'UTF-8');
    }

    /**
     * RSS/Atom Auto-Discovery に対応したlinkタグからURLを抽出する(static)
     */
    function auto_discovery($url)
    {
        // path 未指定の場合は「/」に設定する
        $parts = parse_url($url);
        if (empty($parts['path'])) {
            $url .= '/';
        }

        $result = '';
        if (OPENPNE_USE_HTTP_PROXY) {
            $proxy = OPENPNE_HTTP_PROXY_HOST . ":" . OPENPNE_HTTP_PROXY_PORT;
        }
        $file = @new SimplePie_File($url, 10, 5, null, null, false, $proxy);
        $locator = new SimplePie_Locator($file, 10, null, 'SimplePie_File', 10, $proxy);
        $feed_url = $locator->find();
        if (SimplePie_Misc::is_a($feed_url, 'SimplePie_File')) {
            $result = $feed_url->url;
        }

        return $result;
    }
}

?>
