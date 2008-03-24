<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'Services/AmazonECS4.php';

/**
 * OpenPNEでAmazonECSを利用するためのクラス
 * 
 * @package OpenPNE
 * @author Kousuke Ebihara <ebihara@tejimaya.com>
 */
class OpenPNE_Amazon extends Services_AmazonECS4
{
    /**
     * Category(AmazonECS3)とSearchIndexの変換テーブル
     *
     * @var array
     */
    var $_categoryToSearchIndex = array(
        'books-jp' => 'Books', 
        'books-us' => 'ForeignBooks', 
        'music-jp' => 'Music', 
        'classical-jp' => 'Classical', 
        'dvd-jp' => 'DVD', 
        'videogames-jp' => 'VideoGames', 
        'software-jp' => 'Software', 
        'electronics-jp' => 'Electronics', 
        'kitchen-jp' => 'Kitchen', 
        'toys-jp' => 'Toys', 
        'sporting-goods-jp' => 'SportingGoods', 
        'hpc-jp' => 'HealthPersonalCare', 
    );

    /**
     * SearchIndexとローカライズされた表示名の変換テーブル
     * 
     * @var array
     */
    var $_searchIndexToDisplayName = array(
        'ja' => array(
            'Books', '和書',
            'ForeignBooks' => '洋書', 
            'Music' => 'CDポピュラー', 
            'Classical' => 'CDクラシック', 
            'DVD' => 'DVD', 
            'VideoGames' => 'ゲーム', 
            'Software' => 'ソフトウェア', 
            'Electronics' => 'エレクトロニクス', 
            'Kitchen' => 'キッチン', 
            'Toys' => 'おもちゃ＆ホビー', 
            'SportingGoods' => 'スポーツ', 
            'HealthPersonalCare' => 'ヘルス＆ビューティー',
            'Watches' => '時計',
            'Baby' => 'ベビー＆マタニティ',
            'Apparel' => 'アパレル＆シューズ',
        ),
    );

    function ItemSearch($search_index, $options = array())
    {
        // SearchIndex ではなく Category が渡された
        if (array_key_exists($search_index, $this->_categoryToSearchIndex)) {
            $search_index = $this->categoryToSearchIndex[$search_index];
        }

        $result =  parent::ItemSearch($search_index, $options);
        return $result;
    }

    function getSearchIndexDisplayName()
    {
        $locale = $this->getLocale();
        return $_searchIndexToDisplayName[$locale];
    }
}

?>
