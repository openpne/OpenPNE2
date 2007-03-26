<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'PNE/SimplePie.php';

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

    function fetch($rss_url)
    {
        $feed = new PNE_SimplePie();

        /*フィードURLの設定*/
        $feed->feed_url($rss_url);
        /*キャッシュディレクトリの設定*/
        $feed->cache_location(OPENPNE_RSS_CACHE_DIR);

        /*フィード開始*/
        if (!$feed->init()) {
            return false;
        }

        $result = array();
        foreach ($feed->get_items() as $item) {
            $title = $item->get_title();
            $links = $item->get_links();
            $description = $item->get_description();
            $date = @$item->get_date('Y-m-d H:i:s');

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

            $f_item = array(
                'title' => $this->convert_encoding($title),
                'body'  => $this->convert_encoding($description),
                'link'  => $link,
                'date'  => $date,
            );
            $result[] = $f_item;
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
        $feed = new PNE_SimplePie();
        $data = @$feed->get_file($url);

        // htmlを取得できたか調べる
        if (!$data) {
            return false;
        }

        $feed->feed_url($url);
        if (!$feed->init()) {
            return false;
        }

        return $feed->subscribe_url();
    }
}

?>
