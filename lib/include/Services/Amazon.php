<?php
/* vim: set expandtab tabstop=4 shiftwidth=4: */
/**
 * PHP interface to Amazon Product Advertising API
 *
 * PHP versions 4 and 5
 *
 * LICENSE: Copyright 2004-2009 John Downey. All rights reserved.
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
 * @author    Tatsuya Tsuruoka <tatsuya.tsuruoka@gmail.com>
 * @copyright 2004-2009 John Downey
 * @license   http://www.freebsd.org/copyright/freebsd-license.html 2 Clause BSD License
 * @version   CVS: $Id: Amazon.php,v 1.4 2007/12/16 17:27:44 ttsuruoka Exp $
 * @link      http://pear.php.net/package/Services_Amazon/
 * @filesource
 */

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
 * A default base URL that is specific to the locale
 *
 * Locale    Endpoint
 * ----------------------------------------------
 * CA        http://ecs.amazonaws.ca/onca/xml
 *           https://aws.amazonaws.ca/onca/xml
 * DE        http://ecs.amazonaws.de/onca/xml
 *           https://aws.amazonaws.de/onca/xml
 * FR        http://ecs.amazonaws.fr/onca/xml
 *           https://aws.amazonaws.fr/onca/xml
 * JP        http://ecs.amazonaws.jp/onca/xml
 *           https://aws.amazonaws.jp/onca/xml
 * UK        http://ecs.amazonaws.co.uk/onca/xml
 *           https://aws.amazonaws.co.uk/onca/xml
 * US        http://ecs.amazonaws.com/onca/xml
 *           https://aws.amazonaws.com/onca/xml
 */
if (!defined('SERVICES_AMAZON_BASEURL')) {
    define('SERVICES_AMAZON_BASEURL', 'http://ecs.amazonaws.com/onca/xml');
}

/**
 * An API version
 *
 * Use this to retrieve a particular version of the Product Advertising API.
 */
if (!defined('SERVICES_AMAZON_ECSVERSION')) {
    define('SERVICES_AMAZON_ECSVERSION', '2009-03-31');
}

/**
 * Class for accessing and retrieving information from Amazon's Web Services
 *
 * @package Services_Amazon
 * @author  John Downey <jdowney@gmail.com>
 * @author  Tatsuya Tsuruoka <tatsuya.tsuruoka@gmail.com>
 * @access  public
 * @version Release: 0.8.0
 * @uses    PEAR
 * @uses    HTTP_Request
 * @uses    XML_Unserializer
 */
class Services_Amazon
{
    /**
     * An Amazon Access Key ID used when quering Amazon servers
     *
     * @access private
     * @var    string
     */
    var $_access_key_id = null;

    /**
     * An Amazon Secret Access Key used when quering Amazon servers
     *
     * @access private
     * @var    string
     */
    var $_secret_access_key = null;

    /**
     * An Amazon Associate Tag used in the URL's so a commision may be payed
     *
     * @access private
     * @var    string
     */
    var $_associate_tag = null;

    /**
     * A base URL used to build the query for the Amazon servers
     *
     * @access private
     * @var    string
     */
    var $_baseurl = SERVICES_AMAZON_BASEURL;

    /**
     * A service version
     *
     * @access private
     * @var    string
     */
    var $_version = SERVICES_AMAZON_ECSVERSION;

    /**
     * The time that the Amazon took to process the request
     * 
     * @access private
     * @var    string
     */
    var $_processing_time = null;

    /**
     * The last URL accessed to the Amazon (for debugging)
     *
     * @access private
     * @var    string
     */
    var $_lasturl = null;

    /**
     * The raw result returned from the request
     *
     * @access private
     * @var    string
     */
    var $_raw_result = null;

    /**
     * The cache object
     *
     * @access private
     * @var    object
     */
    var $_cache = null;

    /**
     * The cache expire time
     *
     * Defaults to one hour.
     *
     * @access private
     * @var    integer
     */
    var $_cache_expire = 3600;

    /**
     * Proxy server
     *
     * @access private
     * @var    string
     */
    var $_proxy_host = null;

    /**
     * Proxy port
     *
     * @access private
     * @var    integer
     */
    var $_proxy_port = null;

    /**
     * Proxy username
     *
     * @access private
     * @var    string
     */
    var $_proxy_user = null;

    /**
     * Proxy password
     *
     * @access private
     * @var    string
     */
    var $_proxy_pass = null;

    /**
     * Timestamp (for debugging)
     *
     * @access private
     * @var    integer
     */
    var $_timestamp = null;

    /**
     * Errors
     *
     * @access private
     * @var    array
     */
    var $_errors = array();

    /**
     * Constructor
     *
     * @access public
     * @param  string $access_key_id An Amazon Access Key ID used when quering Amazon servers
     * @param  string $secret_access_key An Amazon Secret Access Key used when quering Amazon servers
     * @param  string $associate_tag An Amazon Associate Tag used in the URL's so a commision may be payed
     * @see    setAccessKeyID
     * @see    setSecretAccessKey
     * @see    setAssociateTag
     * @see    setBaseUrl
     * @see    setVersion
     */
    function Services_Amazon($access_key_id, $secret_access_key, $associate_tag = null)
    {
        $this->setAccessKeyID($access_key_id);
        $this->setSecretAccessKey($secret_access_key);
        $this->setAssociateTag($associate_tag);
    }

    /**
     * Retrieves the current version of this classes API
     *
     * @access public
     * @static
     * @return string The API version
     */
    function getApiVersion()
    {
        return '0.8.0';
    }

    /**
     * Sets an Access Key ID
     *
     * @access public
     * @param  string $access_key_id An Access Key ID
     * @return void
     */
    function setAccessKeyID($access_key_id)
    {
        $this->_access_key_id = $access_key_id;
    }

    /**
     * Sets a Subscription ID (for backward compatibility)
     *
     * @access public
     * @param  string $subid A Subscription ID
     * @return void
     */
    function setSubscriptionID($subid)
    {
        $this->setAccessKeyID($subid);
    }

    /**
     * Sets a Secret Access Key
     *
     * @access public
     * @param  string $subid A Secret Access Key
     * @return void
     */
    function setSecretAccessKey($secret_access_key)
    {
        $this->_secret_access_key = $secret_access_key;
    }

    /**
     * Sets an Associate Tag
     *
     * @access public
     * @param  string $associate_tag An Associate Tag
     * @return void
     */
    function setAssociateTag($associate_tag)
    {
        $this->_associate_tag = $associate_tag;
    }
    /**
     * Sets an Associate ID
     *
     * @access public
     * @param  string $associd An Associate ID
     * @return void
     */
    function setAssociateID($associd)
    {
        $this->setAssociateTag($associd);
    }

    /**
     * Sets the base URL
     *
     * @access public
     * @param  string $url The base url
     * @return void
     */
    function setBaseUrl($url)
    {
        $this->_baseurl = $url;
    }

    /**
     * Sets the locale passed when making a query to Amazon
     *
     * Currently US, UK, DE, JP, FR, and CA are supported
     *
     * @access public
     * @param  string $locale The new locale to use
     * @return mixed A PEAR_Error on error, a true on success
     */
    function setLocale($locale)
    {
        $urls = array(
            'US' => 'http://ecs.amazonaws.com/onca/xml',
            'UK' => 'http://ecs.amazonaws.co.uk/onca/xml',
            'DE' => 'http://ecs.amazonaws.de/onca/xml',
            'JP' => 'http://ecs.amazonaws.jp/onca/xml',
            'FR' => 'http://ecs.amazonaws.fr/onca/xml',
            'CA' => 'http://ecs.amazonaws.ca/onca/xml',
        );
        $locale = strtoupper($locale);
        if (empty($urls[$locale])) {
            return PEAR::raiseError('Invalid locale');
        }
        $this->setBaseUrl($urls[$locale]);
        return true;
    }

    /**
     * Sets a version
     *
     * @access public
     * @param  string $version A service version
     * @return void
     */
    function setVersion($version)
    {
        $this->_version = $version;
    }

    /**
     * Enables caching the data
     *
     * Requires Cache to be installed.
     * Example:
     * <code>
     * <?php
     * $amazon = new Services_Amazon('[your Access Key ID here]', '[your Secret Access key here]');
     * $amazon->setCache('file', array('cache_dir' => 'cache/'));
     * $amazon->setCacheExpire(86400); // 86400 seconds = 24 hours
     * $result = $amazon->BrowseNodeLookup('283155');
     * ?>
     * </code>
     *
     * @access public
     * @param  string $container Name of container class
     * @param  array $container_options Array with container class options
     * @return mixed A PEAR_Error on error, a true on success
     * @see    setCacheExpire()
     */
    function setCache($container = 'file', $container_options = array())
    {
        if(!class_exists('Cache')){
            @include_once 'Cache.php';
        }
        
        @$cache = new Cache($container, $container_options);
        
        if (is_object($cache)) {
            $this->_cache = $cache;
        } else {
            $this->_cache = null;
            return PEAR::raiseError('Cache init failed');
        }

        return true;
    }
    
    /**
     * Sets cache expire time
     * 
     * Amazon dictates that any prices that are displayed that may be over an
     * hour old should be accompanied by some sort of timestamp. You can get
     * around that by expiring any queries that use the time in an hour (3600
     * seconds).
     *
     * @access public
     * @param  integer $secs Expire time in seconds
     * @return void
     * @see    setCache()
     */
    function setCacheExpire($secs)
    {
        $this->_cache_expire = $secs;
    }

    /**
     * Sets a proxy
     *
     * @access public
     * @param string $host Proxy host
     * @param int $port Proxy port
     * @param string $user Proxy username
     * @param string $pass Proxy password
     */
    function setProxy($host, $port = 8080, $user = null, $pass = null)
    {
        $this->_proxy_host = $host;
        $this->_proxy_port = $port;
        $this->_proxy_user = $user;
        $this->_proxy_pass = $pass;
    }

    /**
     * Sets a timestamp (for debugging)
     *
     * @access public
     * @param integer $time A timestamp
     */
    function setTimestamp($time)
    {
        $this->_timestamp = $time;
    }

    /**
     * Retrieves all error codes and messages
     *
     * <code>
     * if (PEAR::isError($result)) {
     *     foreach ($amazon->getErrors() as $error) {
     *         echo $error['Code'];
     *         echo $error['Message'];
     *     }
     * }
     * </code>
     *
     * @access public
     * @return array All errors
     */
    function getErrors()
    {
        return $this->_errors;
    }
    
    /**
     * Retrieves the error code and message
     *
     * <code>
     * if (PEAR::isError($result)) {
     *     $error = $amazon->getError();
     *     echo $error['Code'];
     *     echo $error['Message'];
     * }
     * </code>
     *
     * @access public
     * @return array All errors
     */
    function getError()
    {
        return current($this->_errors);
    }

    /**
     * Retrieves the processing time
     *
     * @access public
     * @return string Processing time
     */
    function getProcessingTime()
    {
        return $this->_processing_time;
    }

    /**
     * Retrieves the last URL accessed to the Amazon (for debugging)
     *
     * @access public
     * @return string The Last URL
     */
    function getLastUrl()
    {
        return $this->_lasturl;
    }

    /**
      * Retrieves the raw result
      *
      * @access public
      * @return string The raw result
      */
    function getRawResult()
    {
        return $this->_raw_result;
    }

    /**
     * Retrieves information about a browse node
     *
     * Example:
     * <code>
     * <?php
     * $amazon = new Services_Amazon('[your Access Key ID here]', '[your Secret Access key here]');
     * $result = $amazon->BrowseNodeLookup('283155'); // 283155='Books'
     * ?>
     * </code>
     *
     * @access public
     * @param  string $browsenode_id The browse node ID
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     */
    function BrowseNodeLookup($browsenode_id, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'BrowseNodeLookup';
        $params['BrowseNodeId'] = $browsenode_id;
        return $this->_sendRequest($params);
    }

    /**
     * Adds items to an existing remote shopping cart
     *
     * Example:
     * <code>
     * <?php
     * $amazon = new Services_Amazon('[your Access Key ID here]', '[your Secret Access key here]');
     * $item = array('ASIN' => 'aaaaaaaaaa', 'Quantity' => 1);
     * // $item = array(array('ASIN' => 'aaaaaaaaaa', 'Quantity' => 1),
     * //               array('OfferListingId' => 'bbbbbbbbbb', 'Quantity' => 10),
     * //               array('ASIN' => 'cccccccccc', 'Quantity' => 20));
     * $result = $amazon->CartAdd('[Cart ID]', '[HMAC]', $item);
     * ?>
     * </code>
     *
     * @access public
     * @param  string $cart_id A unique identifier for a cart
     * @param  string $hmac A unique security token
     * @param  array $item Products and the quantities
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     * @see    CartClear(), CartCreate(), CartModify()
     */
    function CartAdd($cart_id, $hmac, $item, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'CartAdd';
        $params['CartId'] = $cart_id;
        $params['HMAC'] = $hmac;
        $params += $this->_assembleItemParameter($item);
        return $this->_sendRequest($params);
    }

    /**
     * Removes all the contents of a remote shopping cart
     *
     * @access public
     * @param  string $cart_id A unique identifier for a cart
     * @param  string $hmac A unique security token
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     * @see    CartAdd(), CartCreate(), CartGet(), CartModify()
     */
    function CartClear($cart_id, $hmac, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'CartClear';
        $params['CartId'] = $cart_id;
        $params['HMAC'] = $hmac;
        return $this->_sendRequest($params);
    }

    /**
     * Creates a new remote shopping cart
     *
     * Example:
     * <code>
     * <?php
     * $amazon = new Services_Amazon('[your Access Key ID here]', '[your Secret Access key here]');
     * $item = array('ASIN' => 'aaaaaaaaaa', 'Quantity' => 1);
     * // $item = array(array('ASIN' => 'aaaaaaaaaa', 'Quantity' => 1),
     * //               array('ASIN' => 'cccccccccc', 'Quantity' => 20));
     * $result = $amazon->CartCreate($item);
     * ?>
     * </code>
     *
     * @access public
     * @param  array $item Products and the quantities
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     * @see    CartAdd(), CartClear(), CartGet(), CartModify()
     */
    function CartCreate($item, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'CartCreate';
        $params += $this->_assembleItemParameter($item);
        return $this->_sendRequest($params);
    }

    /**
     * Retrieves the contents of a remote shopping cart
     *
     * @access public
     * @param  string $cart_id A unique identifier for a cart
     * @param  string $hmac A unique security token
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     * @see    CartAdd(), CartClear(), CartCreate(), CartModify()
     */
    function CartGet($cart_id, $hmac, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'CartGet';
        $params['CartId'] = $cart_id;
        $params['HMAC'] = $hmac;
        return $this->_sendRequest($params);
    }

    /**
     * Modifies the quantity of items in a cart and changes cart items to saved items
     *
     * Example:
     * <code>
     * <?php
     * $amazon = new Services_Amazon('[your Access Key ID here]', '[your Secret Access key here]');
     * $item = array('CartItemId' => 'aaaaaaaaaa', 'Quantity' => 1);
     * // $item = array('CartItemId' => 'aaaaaaaaaa', 'Action' => 'SaveForLater');
     * // $item = array(array('CartItemId' => 'aaaaaaaaaa', 'Quantity' => 1),
     * //               array('CartItemId' => 'cccccccccc', 'Quantity' => 20));
     * $result = $amazon->CartModify('[Cart ID]', '[HMAC]', $item);
     * ?>
     * </code>
     *
     * @access public
     * @param  string $cart_id A unique identifier for a cart
     * @param  string $hmac A unique security token
     * @param  array $item The CartItemId and the quantities or the Action
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     * @see    CartAdd(), CartClear(), CartCreate(), CartGet()
     */
    function CartModify($cart_id, $hmac, $item, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'CartModify';
        $params['CartId'] = $cart_id;
        $params['HMAC'] = $hmac;
        $params += $this->_assembleItemParameter($item);
        return $this->_sendRequest($params);
    }

    /**
     * Retrieves publicly available content written by specific Amazon customers
     *
     * @access public
     * @param  string $customer_id A customer ID
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     * @see    CustomerContentSearch()
     */
    function CustomerContentLookup($customer_id, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'CustomerContentLookup';
        $params['CustomerId'] = $customer_id;
        return $this->_sendRequest($params);
    }

    /**
     * Searches for Amazon customers by name or email address
     *
     * @access public
     * @param  array $customer A customer's name or its email
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     * @see    CustomerContentLookup()
     */
    function CustomerContentSearch($customer = null, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'CustomerContentSearch';
        $params += $customer;
        return $this->_sendRequest($params);
    }

    /**
     * Retrieves information about operations and response groups
     *
     * Example:
     * <code>
     * <?php
     * $amazon = new Services_Amazon('[your Access Key ID here]', '[your Secret Access key here]');
     * $result = $amazon->Help('Operation', 'ItemLookup');
     * ?>
     * </code>
     *
     * @access public
     * @param  string $help_type The type of information
     * @param  string $about The name of an operation or a response group
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     */
    function Help($help_type, $about, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'Help';
        $params['HelpType'] = $help_type;
        $params['About'] = $about;
        return $this->_sendRequest($params);
    }
        
    /**
     * Retrieves information for products
     *
     * Example:
     * <code>
     * <?php
     * $amazon = new Services_Amazon('[your Access Key ID here]', '[your Secret Access key here]');
     * $options = array();
     * $options['ResponseGroup'] = 'Large';
     * $result = $amazon->ItemLookup('[ASIN(s)]', $options);
     * ?>
     * </code>
     *
     * @access public
     * @param  string $item_id Product IDs
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     * @see    ItemSearch()
     */
    function ItemLookup($item_id, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'ItemLookup';
        if (is_array($item_id)) {
            $item_id = implode(',', $item_id);
        }
        $params['ItemId'] = $item_id;
        return $this->_sendRequest($params);
    }

    /**
     * Searches for products
     *
     * Example:
     * <code>
     * <?php
     * $amazon = new Services_Amazon('[your Access Key ID here]', '[your Secret Access key here]');
     * $options = array();
     * $options['Keywords'] = 'sushi';
     * $options['Sort'] = 'salesrank';
     * $options['ResponseGroup'] = 'ItemIds,ItemAttributes,Images';
     * $result = $amazon->ItemSearch('Books', $options);
     * ?>
     * </code>
     *
     * @access public
     * @param  string $search_index A search index
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     * @see    ItemLookup()
     */
    function ItemSearch($search_index, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'ItemSearch';
        $params['SearchIndex'] = $search_index;
        return $this->_sendRequest($params);
    }

    /**
     * Retrieves products in a specific list
     *
     * @access public
     * @param  string $list_type The type of list
     * @param  string $list_id A list ID
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     * @see    ListSearch()
     */
    function ListLookup($list_type, $list_id, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'ListLookup';
        $params['ListType'] = $list_type;
        $params['ListId'] = $list_id;
        return $this->_sendRequest($params);
    }

    /**
     * Searches for a wish list, baby registry, or wedding registry
     *
     * Example:
     * <code>
     * <?php
     * $amazon = new Services_Amazon('[your Access Key ID here]', '[your Secret Access key here]');
     * $keywords = array('Name' => 'hoge');
     * $result = $amazon->ListSearch('WishList', $keywords);
     * ?>
     * </code>
     *
     * @access public
     * @param  string $list_type The type of list
     * @param  array $keywords Parameters to search for
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     * @see    ListLookup()
     */
    function ListSearch($list_type, $keywords, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'ListSearch';
        $params['ListType'] = $list_type;
        $params += $keywords;
        return $this->_sendRequest($params);
    }

    /**
     * Retrieves information about Amazon zShops and Marketplace products
     *
     * @access public
     * @param  string $id_type The type of ID
     * @param  string $id The exchange ID or the listing ID
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     * @see    SellerListingSearch()
     */
    function SellerListingLookup($id_type, $id, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'SellerListingLookup';
        $params['IdType'] = $id_type;
        $params['Id'] = $id;
        return $this->_sendRequest($params);
    }

    /**
     * Searches for Amazon zShops and Marketplace products
     *
     * Example:
     * <code>
     * <?php
     * $amazon = new Services_Amazon('[your Access Key ID here]', '[your Secret Access key here]');
     * $keywords = array('Keywords' => 'pizza');
     * $result = $amazon->SellerListingSearch('zShops', $keywords);
     * ?>
     * </code>
     *
     * @access public
     * @param  string $search_index The type of seller listings
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     * @see    SellerListingLookup()
     */
    function SellerListingSearch($search_index, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'SellerListingSearch';
        $params['SearchIndex'] = $search_index;
        return $this->_sendRequest($params);
    }

    /**
     * Retrieves information about specific sellers
     *
     * @access public
     * @param  string $seller_id IDs for Amazon sellers
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     */
    function SellerLookup($seller_id, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'SellerLookup';
        $params['SellerId'] = $seller_id;
        return $this->_sendRequest($params);
    }

    /**
     * Retrieves products that are similar to Amazon products
     *
     * @access public
     * @param  string $item_id Product IDs
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     */
    function SimilarityLookup($item_id, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'SimilarityLookup';
        if (is_array($item_id)) {
            $item_id = implode(',', $item_id);
        }
        $params['ItemId'] = $item_id;
        return $this->_sendRequest($params);
    }

    /**
     * Retrieves information about tags
     *
     * @access public
     * @param  string $tag_name List of tag names
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     */
    function TagLookup($tag_name, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'TagLookup';
        if (is_array($tag_name)) {
            $tag_name = implode(',', $tag_name);
        }
        $params['TagName'] = $tag_name;
        return $this->_sendRequest($params);
    }

    /**
     * Retrieves information about the status of financial transactions
     *
     * @access public
     * @param  string $transaction_id Transaction IDs
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     */
    function TransactionLookup($transaction_id, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'TransactionLookup';
        $params['TransactionId'] = $transaction_id;
        return $this->_sendRequest($params);
    }

    /**
     * Retrieves information about a car part
     *
     * @access public
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     */
    function VehiclePartLookup($options = array())
    {
        $params = $options;
        $params['Operation'] = 'VehiclePartLookup';
        return $this->_sendRequest($params);
    }

    /**
     * Searches the parts that work in the car
     *
     * @access public
     * @param  string $make_id 
     * @param  string $model_id
     * @param  string $year
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     */
    function VehiclePartSearch($make_id, $model_id, $year, $options = array())
    {
        $params = $options;
        $params['Operation'] = 'VehiclePartSearch';
        $params['MakeId'] = $make_id;
        $params['ModelId'] = $model_id;
        $params['Year'] = $year;
        return $this->_sendRequest($params);
    }

    /**
     * Searches all vehicles
     *
     * @access public
     * @param  array $options The optional parameters
     * @return array The array of information returned by the query
     */
    function VehicleSearch($options = array())
    {
        $params = $options;
        $params['Operation'] = 'VehicleSearch';
        return $this->_sendRequest($params);
    }

    /**
     * Combines requests for the same operation into a single request
     *
     * Example:
     * <code>
     * <?php
     * $amazon = new Services_Amazon('[your Access Key ID here]', '[your Secret Access key here]');
     * $shared = array('SearchIndex' => 'Books',
     *                 'Keywords' => 'php');
     * $params1 = array('ItemPage' => '1');
     * $params2 = array('ItemPage' => '2');
     * $result = $amazon->doBatch('ItemSearch', $shared, $params1, $params2);
     * ?>
     * </code>
     *
     * @access public
     * @param  string $operation The operation
     * @param  array $shared Shared parameters
     * @param  array $params1 The parameters specific to the first request
     * @param  array $params2 The parameters specific to the second request
     * @return array The array of information returned by the query
     */
    function doBatch($operation, $shared, $params1 = array(), $params2 = array())
    {
        $params = array();
        $params['Operation'] = $operation;
        foreach ($shared as $k => $v) {
            $params[$operation . '.Shared.' . $k] = $v;
        }
        foreach ($params1 as $k => $v) {
            $params[$operation . '.1.' . $k] = $v;
        }
        foreach ($params2 as $k => $v) {
            $params[$operation . '.2.' . $k] = $v;
        }
        return $this->_sendRequest($params);
    }

    /**
     * Combines the different operations into a single request
     *
     * Example:
     * <code>
     * <?php
     * $amazon = new Services_Amazon('[your Access Key ID here]', '[your Secret Access key here]');
     * $params1 = array('SearchIndex' => 'Books',
     *                  'Title' => 'sushi');
     * $params2 = array('Keywords' => 'tempura');
     * $result = $amazon->doMultiOperation('ItemSearch', $params1,
     *                                     'SellerListingSearch', $params2);
     * ?>
     * </code>
     *
     * @access public
     * @param  string $operation1 The first operation
     * @param  array $params1 The parameters specific to the first request
     * @param  string $operation2 The second operation
     * @param  array $params2 The parameters specific to the second request
     * @return array The array of information returned by the query
     */
    function doMultiOperation($operation1, $params1, $operation2, $params2)
    {
        $params = array();
        $params['Operation'] = $operation1 . ',' . $operation2;
        foreach ($params1 as $k => $v) {
            $params[$operation1 . '.1.' . $k] = $v;
        }
        foreach ($params2 as $k => $v) {
            $params[$operation2 . '.1.' . $k] = $v;
        }
        return $this->_sendRequest($params);
    }

    /**
     * Assembles the Item parameters
     *
     * @access private
     * @param  array $items The items
     * @return array The item parameters
     */
    function _assembleItemParameter($items)
    {
        $params = array();
        if (!is_array(current($items))) {
            $items = array(0 => $items);
        }
        $i = 1;
        foreach ($items as $item) {
            foreach ($item as $k => $v) {
                $params['Item.' . $i . '.' . $k] = $v;
            }
            $i++;
        }
        return $params;
    }

    /**
     * Ignores the caching of specific operations
     *
     * @access private
     * @param  string $operation The operation
     * @return bool Returns true if the operation isn't cached, false otherwise
     */
    function _ignoreCache($operation)
    {
        $ignore = array('CartAdd', 'CartClear', 'CartGet', 'CartModify', 'TransactionLookup');
        if (!strchr($operation, ',')) {
            return in_array($operation, $ignore);
        }
        $operations = explode(',', $operation);
        foreach ($operations as $v) {
            if (in_array($v, $ignore)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Generates ID used as cache identifier
     *
     * @access private
     * @param  array $params
     * @return string Cache ID
     */
    function _generateCacheId($params)
    {
        unset($params['AWSAccessKeyId']);
        unset($params['AssociateTag']);
        $str = '';
        foreach ($params as $k => $v) {
            $str .= $k . $v;
        }
        return md5($str);
    }

    /**
     * Encode URL according to RFC 3986
     *
     * @access private
     * @param string $str UTF-8 string
     * @return string Encoded string
     */
    function _urlencode($str)
    {
        return str_replace('%7E', '~', rawurlencode($str));
    }

    /**
     * Create an HMAC-SHA256
     *
     * @access private
     * @param string $string_to_sign
     * @param string $secret_access_key
     * @return string hash
     */
    function _hash($string_to_sign, $secret_access_key)
    {
        if (function_exists('hash_hmac')) {
            return hash_hmac('sha256', $string_to_sign, $secret_access_key, true);
        } elseif (function_exists('mhash')) {
            return mhash(MHASH_SHA256, $string_to_sign, $secret_access_key);
        }

        return PEAR::raiseError('hash_hmac/mhash is required');
    }

    /**
     * Builds a URL
     *
     * @access private
     * @param array $params
     * @return string URL
     */
    function _buildUrl($params)
    {
        $params['Service'] = 'AWSECommerceService';
        $params['AWSAccessKeyId'] = $this->_access_key_id;
        if (!empty($this->_associate_tag)) {
            $params['AssociateTag'] = $this->_associate_tag;
        }
        $params['Version'] = $this->_version;
        $params['Timestamp'] = gmdate('Y-m-d\TH:i:s\Z', is_null($this->_timestamp) ? time() : $this->_timestamp);

        // sort parameters by byte value
        ksort($params);

        // create a canonical string
        $canonical_string = '';
        foreach ($params as $k => $v) {
            $canonical_string .= '&' . $this->_urlencode($k) . '=' . $this->_urlencode($v);
        }
        $canonical_string = substr($canonical_string, 1);

        // create a signature for request
        $parsed_url = parse_url($this->_baseurl);
        $string_to_sign = "GET\n{$parsed_url['host']}\n{$parsed_url['path']}\n{$canonical_string}";
        $signature = $this->_hash($string_to_sign, $this->_secret_access_key);
        if (PEAR::isError($signature)) {
            return $signature;
        }
        $signature = base64_encode($signature);

        // create a signed url
        $url = $this->_baseurl . '?' . $canonical_string . '&Signature=' . $this->_urlencode($signature);

        return $url;
    }

    /**
     * Sends a request
     *
     * @access private
     * @param string $url
     * @return string The response
     */
    function _sendHttpRequest($url)
    {
        $http = &new HTTP_Request($url);
        $http->setHttpVer('1.0');
        $http->addHeader('User-Agent', 'Services_Amazon/' . $this->getApiVersion());
        if ($this->_proxy_host) {
            $http->setProxy($this->_proxy_host, $this->_proxy_port, $this->_proxy_user, $this->_proxy_pass);
        }

        $result = $http->sendRequest();
        if (PEAR::isError($result)) {
            return PEAR::raiseError('HTTP_Request::sendRequest failed: ' . $result->message);
        }

        if ($http->getResponseCode() != 200){
            return PEAR::raiseError('Amazon returned invalid HTTP response code ' . $http->getResponseCode());
        }
        return $http->getResponseBody();
    }

    /**
     * Parses raw XML result
     *
     * @access private
     * @param string $raw_result
     * @return string The contents
     */
    function _parseRawResult($raw_result)
    {
        $xml = &new XML_Unserializer();
        $xml->setOption(XML_UNSERIALIZER_OPTION_ATTRIBUTES_PARSE, true);
        $xml->setOption(XML_UNSERIALIZER_OPTION_FORCE_ENUM,
                        array('Item', 'Review', 'EditorialReview',
                              'Parameter', 'Author', 'Creator', 'ResponseGroup', 'Error'));
        $xml->unserialize($raw_result, false);
        $data = $xml->getUnserializedData();
        if (PEAR::isError($data)) {
            return $data;
        }

        if (isset($data['Error'])) {
            $this->_errors = $data['Error'];
            return PEAR::raiseError(implode(':', $this->getError()));
        }

        if (isset($data['OperationRequest']['RequestProcessingTime'])) {
            $this->_processing_time = $data['OperationRequest']['RequestProcessingTime'];
        }

        if (isset($data['OperationRequest']['Errors'])) {
            $this->_errors = $data['OperationRequest']['Errors']['Error'];
            return PEAR::raiseError(implode(':', $this->getError()));
        }

        // Get values of the second level content elements
        unset($data['xmlns']);
        unset($data['OperationRequest']);
        $contents = array();
        $keys = array_keys($data);
        foreach ($keys as $v) {
            if (strstr($v, 'Response')) {
                $data[$v] = current($data[$v]);
                $contents[$v] = $data[$v];
            } else {
                $contents = $data[$v];
            }
            $result = $this->_checkContentError($data[$v]);
            if (PEAR::isError($result)) {
                return $result;
            }
        }
        return $contents;
    }

    /**
     * Checks error codes at the content elements
     *
     * @access private
     * @param  array $content Values of the content elements
     * @return array mixed A PEAR_Error on error, a true on success
     * @see    _parseRawResult
     */
    function _checkContentError($content)
    {
        if (isset($content['Request']['Errors'])) {
            $this->_errors = $content['Request']['Errors']['Error'];
            return PEAR::raiseError(implode(':', $this->getError()));
        } else if (isset($content[0])) {
            $errors = array();
            foreach ($content as $v) {
                if (isset($v['Request']['Errors']['Error'])) {
                    $errors = array_merge($errors, $v['Request']['Errors']['Error']);
                }
            }
            if (!empty($errors)) {
                $this->_errors = $errors;
                return PEAR::raiseError(implode(':', $this->getError()));
            }
        }
        return true;
    }

    /**
     * Sends the request to Amazon
     *
     * @access private
     * @param  array $params The array of request parameters
     * @return array The array of information returned by the query
     */
    function _sendRequest($params)
    {
        $this->_errors = array();

        if (is_null($this->_access_key_id)) {
            return PEAR::raiseError('Access Key ID have not been set');
        }

        $url = $this->_buildUrl($params);
        $this->_lasturl = $url;
        if (PEAR::isError($url)) {
            return $url;
        }

        // Return cached data if available
        $cache_id = false;
        if (isset($this->_cache) && !$this->_ignoreCache($params['Operation'])) {
            $cache_id = $this->_generateCacheId($params);
            $cache = $this->_cache->get($cache_id);
            if (!is_null($cache)) {
                $this->_processing_time = 0;
                return $cache;
            }
        }

        $result = $this->_sendHttpRequest($url);
        $this->_raw_result = $result;
        if (PEAR::isError($result)) {
            return $result;
        }

        $contents = $this->_parseRawResult($result);
        if (PEAR::isError($contents)) {
            return $contents;
        }

        if ($cache_id) {
            $this->_cache->save($cache_id, $contents, $this->_cache_expire);
        }

        return $contents;
    }

}
?>
