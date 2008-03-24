<?php
/* vim: set expandtab tabstop=4 shiftwidth=4: */
/**
* Implementation of a developers backend for accessing Amazon.com's retail and
* assosciate services.
*
* PHP versions 4 and 5
*
* LICENSE: Copyright 2004 John Downey. All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*
* o Redistributions of source code must retain the above copyright notice, this
*   list of conditions and the following disclaimer.
* o Redistributions in binary form must reproduce the above copyright notice,
*   this list of conditions and the following disclaimer in the documentation
*   and/or other materials provided with the distribution.
*
* THIS SOFTWARE IS PROVIDED BY THE FREEBSD PROJECT "AS IS" AND ANY EXPRESS OR
* IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
* MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
* EVENT SHALL THE FREEBSD PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
* INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
* BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
* OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
* NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
* EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
* The views and conclusions contained in the software and documentation are
* those of the authors and should not be interpreted as representing official
* policies, either expressed or implied, of The PEAR Group.
*
* @category  Web Services
* @package   Services_Amazon
* @author    John Downey <jdowney@gmail.com>
* @author    Tatsuya Tsuruoka <ttsuruoka@p4life.jp>
* @copyright 2004 John Downey
* @license   http://www.freebsd.org/copyright/freebsd-license.html 2 Clause BSD License
* @version   CVS: $Id: Amazon.php,v 1.2 2006/01/27 16:29:20 ttsuruoka Exp $
* @link      http://pear.php.net/package/Services_Amazon/
* @filesource
*/

// This class is for backward compatibility and should be considered obsolete.
// You may as well use Services_AmazonECS4 when you create a new application.

/**
* Uses PEAR class for error management.
*/
require_once 'PEAR.php';

/**
* Uses HTTP_Request class to send and receive data from Amazon web servers.
*/
require_once 'HTTP/Request.php';

/**
* Uses XML_Unserializer class to parse data received from Amazon.
*/
require_once 'XML/Unserializer.php';

/**
* Class for accessing and retrieving information from Amazon's Web Services.
*
* @package Services_Amazon
* @author  John Downey <jdowney@gmail.com>
* @author  Tatsuya Tsuruoka <ttsuruoka@p4life.jp>
* @access  public
* @version Release: 0.7.1
* @uses    PEAR
* @uses    HTTP_Request
* @uses    XML_Unserializer
*/
class Services_Amazon
{
    /**
    * The developers token used when quering Amazon servers.
    *
    * @access private
    * @var    string $_token
    */
    var $_token = null;
    
    /**
    * An Amazon Associate ID used in the URL's so a commision may be payed.
    *
    * @access private
    * @var    string $_affid
    */
    var $_affid = null;
    
    /**
    * The locale to pass to Amazon.com's servers.
    *
    * @access private
    * @var    string $_locale
    */    
    var $_locale = null;
    
    /**
    * The base url used to build the query for the Amazon servers.
    *
    * @access private
    * @var    string $_baseurl
    */
    var $_baseurl = null;

    /**
    * Constructor
    *
    * @access public
    * @param  string $token The developers token used when quering Amazon servers.
    * @param  string $affid An Amazon Associate ID used in the URL's so a commision may be payed.
    * @see    setToken
    * @see    setAssociateID
    * @see    setBaseUrl
    * @see    setLocale
    */
    function Services_Amazon($token = null, $affid = null, $locale = 'us', $baseurl = 'http://webservices.amazon.com/onca/xml2') {
        if (!is_null($token)) {
            $this->_token = $token;
        }

        if (!is_null($affid)) {
            $this->_affid = $affid;
        }
        
        $this->_baseurl = $baseurl;
        $this->setLocale($locale);
    }

    /**
    * Retrieves the current version of this classes API.
    *
    * All major versions are backwards compatible with older version of the same
    * version number. Such as 1.5 would work for a script written to use 1.0.
    * However on the filp side a script that needs 1.5 would not work with
    * API version 1.0.
    *
    * @access public
    * @static
    * @return string the API version
    */
    function getApiVersion() {
        return '1.0';
    }

    /**
    * Retrieves the currently set Developer token.
    * 
    * To use Amazon's Web Services you need a developer's token. Visit
    * {@link http://www.amazon.com/webservices} and read their license
    * agreement to recieve a free token.
    *
    * @access public
    * @return string the currently set Developer token
    * @see    setToken()
    */
    function getToken() {
        return $this->_token;
    }

    /**
    * Sets the Developer token to use when quering Amazon's Web Services.
    *
    * @access public
    * @param  string $token your Developer token
    * @return void
    * @see    getToken()
    */
    function setToken($token) {
        $this->_token = $token;
    }

    /**
    * Retrieves the currently set Associate ID.
    *
    * Your Associate ID is used to built the links to amazon which will give
    * you credit for the sale. Visit {@link http://associates.amazon.com} to
    * sign up for an Associate ID.
    *
    * @access public
    * @return string the currently set Associate ID.
    * @see    setAssociateID()
    */
    function getAssociateID() {
        return $this->_affid;
    }

    /**
    * Sets the Associate ID to use when building links to Amazon.com.
    *
    * @access public
    * @param  string $affid your Associate ID
    * @return void
    * @see    getAssociateID()
    */
    function setAssociateID($affid) {
        $this->_affid = $affid;
    }
    
    /**
    * Retrieves the currently set base url.
    *
    * @access public
    * @return string the currently set base url
    * @see    setBaseUrl()
    */
    function getBaseUrl() {
        return $this->_baseurl;
    }

    /**
    * Sets the base url used when making a query to Amazon.com.
    *
    * @access public
    * @param  string $baseurl the base url to use
    * @return void
    * @see    getBaseUrl()
    */
    function setBaseUrl($baseurl) {
        $this->_baseurl = $baseurl;
    }
    
    /**
    * Retrieves the locale passed when making a query to Amazon.com.
    *
    * @access public
    * @return string the currently set locale
    * @see    setLocale()
    */    
    function getLocale() {
        return $this->_locale;
    }
    
    /**
    * Sets the locale passed when making a query to Amazon.
    *
    * Currently only us, uk, de, jp, fr and ca are supported by Amazon.
    *
    * @access public
    * @param  string $locale the new locale to use
    * @return void
    * @see    getLocale()
    */    
    function setLocale($locale) {
        $urls = array(
            'us' => 'http://webservices.amazon.com/onca/xml2',
            'uk' => 'http://webservices.amazon.co.uk/onca/xml2',
            'de' => 'http://webservices.amazon.de/onca/xml2',
            'jp' => 'http://webservices.amazon.co.jp/onca/xml2',
            'fr' => 'http://webservices.amazon.fr/onca/xml2',
            'ca' => 'http://webservices.amazon.ca/onca/xml2',
        );
        $this->_locale = strtolower($locale);
        if (empty($urls[$locale])) {
            return;
        }
        $this->setBaseUrl($urls[$locale]);
    }
    
    /**
    * Retrieves an array of modes supported by Amazon.
    *
    * The array is arranged with the shorthand version as the key and the human
    * readable version as its value. Below are the current modes in the list.
    * <pre>
    * baby        - Baby
    * books       - Books
    * classical   - Classical Music
    * dvd         - DVD
    * electronics - Electronics
    * garden      - Outdoor Living
    * kitchen     - Kitchen & Housewares
    * magazines   - Magazines
    * music       - Popular Music
    * pc-hardware - Computers
    * photo       - Camera & Photo
    * software    - Software
    * toys        - Toys & Games
    * universal   - Tools & Hardware
    * vhs         - VHS
    * videogames  - Computer & Video Games
    * </pre>
    *
    * @access public
    * @static
    * @return array An array of modes with the short hand modename to pass to
    *               Amazon as the key and the longer human readable form as the
    *               key's value.
    */
    function getModes() {
        return array('baby'        => 'Baby',
                     'books'       => 'Books',
                     'classical'   => 'Classical Music',
                     'dvd'         => 'DVD',
                     'electronics' => 'Electronics',
                     'garden'      => 'Outdoor Living',
                     'kitchen'     => 'Kitchen & Housewares',
                     'magazines'   => 'Magazines',
                     'music'       => 'Popular Music',
                     'pc-hardware' => 'Computers',
                     'photo'       => 'Camera & Photo',
                     'software'    => 'Software',
                     'toys'        => 'Toys & Games',
                     'universal'   => 'Tools & Hardware',
                     'vhs'         => 'VHS',
                     'videogames'  => 'Computer & Video Games');
    }

    /**
    * Retrives the information of a product given its unique ASIN code.
    *
    * Amazon Standard Identification Numbers (ASINs) are unique blocks of 10
    * letters and/or numbers that identify items. You can find the ASIN on the
    * item's product information page at Amazon.com.
    *
    * Example:
    * <code>
    * <?php
    * require_once 'PEAR.php';
    * require_once 'Services/Amazon.php';
    *
    * $amazon = &new Services_Amazon('XXXXXXXXXXXXXX', 'myassociateid');
    * $products = $amazon->searchAsin('0672325616');
    *
    * if(!PEAR::isError($products)) {
    *     var_dump($products);
    * } else {
    *     echo $products->message;
    * }
    * ?>
    * </code>
    * If you were to fill in the Developer token in the constructor this would
    * return the results for George Schlossnagle's book Advanced PHP
    * Programming.
    *
    * @access public
    * @param  string $asin The Amazon Standard Identification Number (ASIN)
    *                      of the product your searching for
    * @return array The array of products retrieved by the query.
    */
    function searchAsin($asin) {
        return $this->_sendRequest(array('AsinSearch' => $asin), 1);
    }

    /**
    * Retrives the information of a book given its unique ISBN number.
    *
    * International Standard Book Numbers (ISBNs) are unique numbers that
    * identify every book that is published. It is generally located below a
    * barcode on the back of the book. Note: ISBN numbers are synonymous with
    * ASIN numbers as Amazon uses the ISBN for a books ASIN.
    *
    * @access public
    * @param  string $isbn The International Standard Book Number (ISBN) of the
    *                      book you are searching for.
    * @return array The array of products retrieved by the query.
    * @see    searchAsin()
    */
    function searchIsbn($isbn) {
        return $this->searchAsin($isbn, 1);
    }
    
    /**
    * Retrives the information of a product given its unique UPC number.
    *
    * Since Amazon usually carries the latest version of a product it may not
    * be possible to find a product given its UPC even though a later version
    * appears on Amazon.com.
    *
    * @access public
    * @param  string $upc Universal Product Code (UPC) for the product you are
    *                     searching for.
    * @return array The array of products retrieved by the query.
    */
    function searchUpc($upc) {
        return $this->_sendRequest(array('UpcSearch' => $upc), 1);
    }
    
    /**
    * Searches Amazon.com for a specific keyword.
    *
    * To limit your search to just a specific category such as books then set
    * the $mode param to something other then null. See {@link getModes()} for a list of
    * modes.
    *
    * Example:
    * <code>
    * <?php
    * require_once 'PEAR.php';
    * require_once 'Services/Amazon.php';
    * 
    * $amazon = &new Services_Amazon('XXXXXXXXXXXXXX', 'myassociateid');
    * $products = $amazon->searchKeyword('PHP');
    *
    * if(!PEAR::isError($products)) {
    *    var_dump($products);
    * } else {
    *    echo $products->message;
    * }
    * ?>
    * </code>
    * If you were to fill in the Developer token in the constructor this would
    * search Amazon.com for all books about PHP and return the first 10 results.
    * To retrieve more results you would pass a page number.
    *
    * @access public
    * @param  string $keyword The keyword to search for.
    * @param  string $mode The section of the site you wish to search in.
    *                      Defaults to music.
    * @param  interger $page Which page of products to retrieve. Defaults to
    *                        the first.
    * @return array The array of products retrieved by the query.
    * @see    getModes()
    */
    function searchKeyword($keyword, $mode = null, $page = 1) {
        return $this->_sendRequest(array('KeywordSearch' => $keyword, 'mode' => $mode), $page);
    }

    /**
    * Searches Amazon for products similer to the Asin passed to it.
    *
    * To limit your search to just a specific category such as books then set
    * the $mode param to something other then null. See {@link getModes()} for a list of
    * modes. If the $mode param is null it will search all modes.
    *
    * Example:
    * <code>
    * <?php
    * require_once 'PEAR.php';
    * require_once 'Services/Amazon.php';
    * 
    * $amazon = &new Services_Amazon('XXXXXXXXXXXXXX', 'myassociateid');
    * $products = $amazon->searchSimilar('0672325616', 'books');
    *
    * if(!PEAR::isError($products)) {
    *    var_dump($products);
    * } else {
    *    echo $products->message;
    * }
    * ?>
    * </code>
    * If you were to fill in the Developer token in the constructor this would
    * search Amazon.com for all books related to George Schlossnagle's book
    * Advanced PHP Programming. To retrieve more results you would pass a page
    * number.
    *
    * @access public
    * @param  string $asin The Asin of the product that is similer to what you
    *                      are searching for.
    * @param  string $mode The section of the site you wish to search in 
    * @param  interger $page Which page of products to retrieve. Defaults to
    *                        the first.
    * @return array The array of products retrieved by the query.
    * @see    getModes()
    */
    function searchSimilar($asin, $mode = null, $page = 1) {
        return $this->_sendRequest(array('SimilaritySearch' => $asin, 'mode' => $mode), $page);
    }

    /**
    * Searches Amazon.com for a specific author.
    *
    * Example:
    * <code>
    * <?php
    * require_once 'PEAR.php';
    * require_once 'Services/Amazon.php';
    * 
    * $amazon = &new Services_Amazon('XXXXXXXXXXXXXX', 'myassociateid');
    * $products = $amazon->searchAuthor('Frank Herbert');
    *
    * if(!PEAR::isError($products)) {
    *    var_dump($products);
    * } else {
    *    echo $products->message;
    * }
    * ?>
    * </code>
    * If you were to fill in the Developer token in the constructor this would
    * search Amazon.com for all books written by the great American author
    * Frank Herbert.
    *
    * @access public
    * @param  string $author The author you are searching for.
    * @param  interger $page Which page of products to retrieve. Defaults to
    *                        the first.
    * @return array The array of products retrieved by the query.
    */
    function searchAuthor($author, $page = 1) {
        return $this->_sendRequest(array('AuthorSearch' => $author, 'mode' => 'books'), $page);
    }

    /**
    * Searches Amazon for music by a specified artist.
    *
    * Example:
    * <code>
    * <?php
    * require_once 'PEAR.php';
    * require_once 'Services/Amazon.php';
    * 
    * $amazon = &new Services_Amazon('XXXXXXXXXXXXXX', 'myassociateid');
    * $products = $amazon->searchArtist('Dream Theater');
    *
    * if(!PEAR::isError($products)) {
    *    var_dump($products);
    * } else {
    *    echo $products->message;
    * }
    * ?>
    * </code>
    * If you were to fill in the Developer token in the constructor this would
    * search Amazon.com for music by American Progressive Metal band Dream
    * Theater.
    *
    * @access public
    * @param  string $artist The artist you are searching for.
    * @param  interger $page Which page of products to retrieve. Defaults to
    *                        the first.
    * @return array The array of products retrieved by the query.
    */
    function searchArtist($artist, $page = 1) {
        return $this->_sendRequest(array('ArtistSearch' => $artist, 'mode' => 'music'), $page);
    }

    /**
    * Searches Amazon for movies that portrays a specific actor.
    *
    * Example:
    * <code>
    * <?php
    * require_once 'PEAR.php';
    * require_once 'Services/Amazon.php';
    * 
    * $amazon = &new Services_Amazon('XXXXXXXXXXXXXX', 'myassociateid');
    * $products = $amazon->searchActor('Samuel L. Jackson');
    *
    * if(!PEAR::isError($products)) {
    *    var_dump($products);
    * } else {
    *    echo $products->message;
    * }
    * ?>
    * </code>
    * If you were to fill in the Developer token in the constructor this would
    * search Amazon.com for DVD movies portraying the American Actor Samuel L.
    * Jackson.
    *
    * @access public
    * @param  string $actor The actor you are searching for.
    * @param  string $mode The section of the site you wish to search in.
    *                      Defaults to DVDs.
    * @param  interger $page Which page of products to retrieve. Defaults to
    *                        the first.
    * @return array The array of products retrieved by the query.
    * @see    getModes()
    */
    function searchActor($actor, $mode = 'dvd', $page = 1) {
        return $this->_sendRequest(array('ActorSearch' => $actor, 'mode' => $mode), $page);
    }

    /**
    * Searches Amazon for movies by their given director.
    *
    * Example:
    * <code>
    * <?php
    * require_once 'PEAR.php';
    * require_once 'Services/Amazon.php';
    * 
    * $amazon = &new Services_Amazon('XXXXXXXXXXXXXX', 'myassociateid');
    * $products = $amazon->searchDirector('George Lucas');
    *
    * if(!PEAR::isError($products)) {
    *    var_dump($products);
    * } else {
    *    echo $products->message;
    * }
    * ?>
    * </code>
    * If you were to fill in the Developer token in the constructor this would
    * search Amazon.com for DVD movies directed by American film Director
    * George Lucas.
    *
    * @access public
    * @param  string $director The director you are searching for.
    * @param  string $mode The section of the site you wish to search in 
    * @param  interger $page Which page of products to retrieve. Defaults to
    *                        the first.
    * @return array The array of products retrieved by the query.
    * @see    getModes()
    */
    function searchDirector($director, $mode = 'dvd', $page = 1) {
        return $this->_sendRequest(array('DirectorSearch' => $director, 'mode' => $mode), $page);
    }

    /**
    * Search Amazon for products from a specific manufacturer.
    *
    * This search is synonymous with searching for a book publisher.
    *
    * Example:
    * <code>
    * <?php
    * require_once 'PEAR.php';
    * require_once 'Services/Amazon.php';
    * 
    * $amazon = &new Services_Amazon('XXXXXXXXXXXXXX', 'myassociateid');
    * $products = $amazon->searchManufacturer('New Line', 'dvd');
    *
    * if(!PEAR::isError($products)) {
    *    var_dump($products);
    * } else {
    *    echo $products->message;
    * }
    * ?>
    * </code>
    * If you were to fill in the Developer token in the constructor this would
    * search Amazon.com for DVD movies put out by American film company New
    * Line Cinemas.
    *
    * @access public
    * @param  string $manufacturer The manufacturer you are searching for.
    * @param  string $mode The section of the site you wish to search in.
    * @param  interger $page Which page of products to retrieve. Defaults to
    *                        the first.
    * @return array The array of products retrieved by the query.
    * @see    getModes()
    */
    function searchManufacturer($manufacturer, $mode = 'books', $page = 1) {
        return $this->_sendRequest(array('ManufacturerSearch' => $manufacturer, 'mode' => $mode), $page);
    }
    
    /**
    * Search Amazon for products from a specific book publisher.
    *
    * Example:
    * <code>
    * <?php
    * require_once 'PEAR.php';
    * require_once 'Services/Amazon.php';
    * 
    * $amazon = &new Services_Amazon('XXXXXXXXXXXXXX', 'myassociateid');
    * $products = $amazon->searchPublisher('Coriolis', 'books');
    *
    * if(!PEAR::isError($products)) {
    *    var_dump($products);
    * } else {
    *    echo $products->message;
    * }
    * ?>
    * </code>
    * If you were to fill in the Developer token in the constructor this would
    * search Amazon.com for books published by Coriolis Group Books which
    * publish the "Black Book" series of programming books, some of my
    * favorites.
    *
    * @access public
    * @param  string $manufacturer The manufacturer or book publisher you are
    *                              searching for.
    * @param  string $mode The section of the site you wish to search in.
    * @param  interger $page Which page of products to retrieve. Defaults to
    *                        the first.
    * @return array The array of products retrieved by the query.
    */
    function searchPublisher($publisher, $page = 1) {
        return $this->searchManufacturer($publisher, 'books', $page);
    }

    /**
    * Retrieves a persons wishlist items given their unique ID.
    *
    * To find a specific wish list ID number, simply travel to the page that
    * contains the list that you are interested in, and look for the list's 13
    * character ID in web page's URL. (It appears after the "/obidos/registry/"
    * string). As an example, the following URL contains the list ID
    * 1QKCTUTWKI1AZ: {@link http://www.amazon.com/exec/obidos/registry/1QKCTUTWKI1AZ}.
    *
    * Example:
    * <code>
    * <?php
    * require_once 'PEAR.php';
    * require_once 'Services/Amazon.php';
    * 
    * $amazon = &new Services_Amazon('XXXXXXXXXXXXXX', 'myassociateid');
    * $products = $amazon->searchWishlist('1QKCTUTWKI1AZ');
    *
    * if(!PEAR::isError($products)) {
    *    var_dump($products);
    * } else {
    *    echo $products->message;
    * }
    * ?>
    * </code>
    * If you were to fill in the Developer token in the constructor this would
    * search Amazon.com for my wishlist and return all the products currently
    * on it.
    *
    * @access public
    * @param  string $wishlist The ID of the wishlist you wish to retrieve.
    * @return array The array of products retrieved by the query.
    */
    function searchWishlist($wishlist) {
        return $this->_sendRequest(array('WishlistSearch' => $wishlist), 1);
    }

    /**
    * Reformats the results returned from Amazon into something more standardized.
    *
    * @access private
    * @param  array $products The array of products returned from Amazon's web services
    * @return array An array of items that include all basic information about an item.
    */
    function &_processPage($products) {
        $items = array();

        foreach($products as $url => $product) {
            $item         = array();
            $item['url']  = $url;
            $item['asin'] = $product->Asin;
            $item['name'] = $product->ProductName;
            $item['type'] = $product->Catalog;
            if (isset($product->Authors)) {
                if (is_array($product->Authors->Author)) {
                    foreach ($product->Authors->Author as $author) {
                        $item['authors'][] = $author;
                    }
                } else {
                    $item['authors'][] = $product->Authors->Author;
                }
            }
            if (isset($product->Artists)) {
                if (is_array($product->Artists->Artist)) {
                    foreach ($product->Artists->Artist as $artist) {
                        $item['artists'][] = $artist;
                    }
                } else {
                    $item['artists'][] = $product->Artists->Artist;
                }
            }
            $item['release']      = isset($product->ReleaseDate) ? $product->ReleaseDate : null;
            $item['manufacturer'] = isset($product->Manufacturer) ? $product->Manufacturer : null;
            $item['imagesmall']   = $product->ImageUrlSmall;
            $item['imagemedium']  = $product->ImageUrlMedium;
            $item['imagelarge']   = $product->ImageUrlLarge;
            $item['listprice']    = isset($product->ListPrice) ? $product->ListPrice : null;
            $item['ourprice']     = isset($product->ListPrice) ? $product->ListPrice : null;

            $items[] = $item;
        }

        return $items;
    }

    /**
    * Sends the request to Amazons Web Services.
    *
    * @access private
    * @param  array   $params An array of url parameters to pass. With the key being the variable for the value.
    * @param  integer $page   Which page of products to retrieve. Defaults to the first.
    * @return mixed Returns a PEAR_Error on error and an array of products on success.
    */
    function &_sendRequest($params = array(), $page = 1) {
        if (is_null($this->_token) || is_null($this->_affid)) {
            return PEAR::raiseError('Developers token or Affiliate ID have not been set.');
        }

        // Get base url and append all params after url encoding them
        $url = $this->_baseurl . '?locale=' . $this->_locale . '&type=lite&f=xml&t=' . $this->_affid . '&dev-t=' . $this->_token . '&page=' . $page;
        foreach ($params as $key => $value) {
            if(!is_null($value)) {
                $url .= '&' . $key . '=' . urlencode($value);
            }
        }

        // Open up our HTTP_Request and set our User-Agent field then send the
        // request for the URL.
        $http = &new HTTP_Request($url);
        $http->addHeader('User-Agent', 'Services_Amazon/' . $this->getApiVersion());
        $http->sendRequest();
        
        // Retrieve the result and check that its HTTP 200 Ok. Otherwise raise
        // an error.
        if ($http->getResponseCode() != 200) {
            return PEAR::raiseError('Amazon return HTTP ' . $http->getResponseCode());
        }
        $result = $http->getResponseBody();
        
        // Start up the XML_Unserializer and feed it the data received from
        // Amazon.com
        $xml = &new XML_Unserializer(array('complexType' => 'object', 'keyAttribute' => 'url'));
        $xml->unserialize($result, false);
        $data = $xml->getUnserializedData();
        
        // Check to make sure Amazon didn't give us an error. If so raise it.
        if (isset($data->ErrorMsg)) {
            return PEAR::raiseError($data->ErrorMsg);
        }
        
        // Prepare the data to be sent to _processPage
        $data  = get_object_vars($data);
        $pages = isset($data['TotalPages']) ? (int) $data['TotalPages'] : 1;
        unset($data['TotalPages']);
        $totalresults = isset($data['TotalResults']) ? $data['TotalResults'] : count($data);
        unset($data['TotalResults']);

        $products = $this->_processPage($data);
        $products['page']  = $page;
        $products['pages'] = $pages;
        $products['totalresults'] = $totalresults;

        return $products;
    }
}
?>
