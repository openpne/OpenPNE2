<?php
/**
 * SimplePie
 *
 * A PHP-Based RSS and Atom Feed Framework.
 * Takes the hard work out of managing a complete RSS/Atom solution.
 *
 * Copyright (c) 2004-2007, Ryan Parman and Geoffrey Sneddon
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, are
 * permitted provided that the following conditions are met:
 *
 * 	* Redistributions of source code must retain the above copyright notice, this list of
 * 	  conditions and the following disclaimer.
 *
 * 	* Redistributions in binary form must reproduce the above copyright notice, this list
 * 	  of conditions and the following disclaimer in the documentation and/or other materials
 * 	  provided with the distribution.
 *
 * 	* Neither the name of the SimplePie Team nor the names of its contributors may be used
 * 	  to endorse or promote products derived from this software without specific prior
 * 	  written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS
 * AND CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * @package SimplePie
 * @version "Razzleberry"
 * @copyright 2004-2007 Ryan Parman, Geoffrey Sneddon
 * @author Ryan Parman
 * @author Geoffrey Sneddon
 * @link http://simplepie.org/ SimplePie
 * @link http://simplepie.org/support/ Please submit all bug reports and feature requests to the SimplePie forums
 * @license http://www.opensource.org/licenses/bsd-license.php BSD License
 * @todo phpDoc comments
 */

/**
 * SimplePie Name
 */
define('SIMPLEPIE_NAME', 'SimplePie');

/**
 * SimplePie Version
 */
define('SIMPLEPIE_VERSION', '1.0.1');

/**
 * SimplePie Build
 * @todo Hardcode for release (there's no need to have to call SimplePie_Misc::parse_date() only every load of simplepie.inc)
 */
define('SIMPLEPIE_BUILD', 20070719221955);

/**
 * SimplePie Website URL
 */
define('SIMPLEPIE_URL', 'http://simplepie.org/');

/**
 * SimplePie Useragent
 * @see SimplePie::set_useragent()
 */
define('SIMPLEPIE_USERAGENT', SIMPLEPIE_NAME . '/' . SIMPLEPIE_VERSION . ' (Feed Parser; ' . SIMPLEPIE_URL . '; Allow like Gecko) Build/' . SIMPLEPIE_BUILD);

/**
 * SimplePie Linkback
 */
define('SIMPLEPIE_LINKBACK', '<a href="' . SIMPLEPIE_URL . '" title="' . SIMPLEPIE_NAME . ' ' . SIMPLEPIE_VERSION . '">' . SIMPLEPIE_NAME . '</a>');

/**
 * No Autodiscovery
 * @see SimplePie::set_autodiscovery_level()
 */
define('SIMPLEPIE_LOCATOR_NONE', 0);

/**
 * Feed Link Element Autodiscovery
 * @see SimplePie::set_autodiscovery_level()
 */
define('SIMPLEPIE_LOCATOR_AUTODISCOVERY', 1);

/**
 * Local Feed Extension Autodiscovery
 * @see SimplePie::set_autodiscovery_level()
 */
define('SIMPLEPIE_LOCATOR_LOCAL_EXTENSION', 2);

/**
 * Local Feed Body Autodiscovery
 * @see SimplePie::set_autodiscovery_level()
 */
define('SIMPLEPIE_LOCATOR_LOCAL_BODY', 4);

/**
 * Remote Feed Extension Autodiscovery
 * @see SimplePie::set_autodiscovery_level()
 */
define('SIMPLEPIE_LOCATOR_REMOTE_EXTENSION', 8);

/**
 * Remote Feed Body Autodiscovery
 * @see SimplePie::set_autodiscovery_level()
 */
define('SIMPLEPIE_LOCATOR_REMOTE_BODY', 16);

/**
 * All Feed Autodiscovery
 * @see SimplePie::set_autodiscovery_level()
 */
define('SIMPLEPIE_LOCATOR_ALL', 31);

/**
 * No known feed type
 */
define('SIMPLEPIE_TYPE_NONE', 0);

/**
 * RSS 0.90
 */
define('SIMPLEPIE_TYPE_RSS_090', 1);

/**
 * RSS 0.91 (Netscape)
 */
define('SIMPLEPIE_TYPE_RSS_091_NETSCAPE', 2);

/**
 * RSS 0.91 (Userland)
 */
define('SIMPLEPIE_TYPE_RSS_091_USERLAND', 4);

/**
 * RSS 0.91 (both Netscape and Userland)
 */
define('SIMPLEPIE_TYPE_RSS_091', 6);

/**
 * RSS 0.92
 */
define('SIMPLEPIE_TYPE_RSS_092', 8);

/**
 * RSS 0.93
 */
define('SIMPLEPIE_TYPE_RSS_093', 16);

/**
 * RSS 0.94
 */
define('SIMPLEPIE_TYPE_RSS_094', 32);

/**
 * RSS 1.0
 */
define('SIMPLEPIE_TYPE_RSS_10', 64);

/**
 * RSS 2.0
 */
define('SIMPLEPIE_TYPE_RSS_20', 128);

/**
 * RDF-based RSS
 */
define('SIMPLEPIE_TYPE_RSS_RDF', 65);

/**
 * Non-RDF-based RSS (truly intended as syndication format)
 */
define('SIMPLEPIE_TYPE_RSS_SYNDICATION', 190);

/**
 * All RSS
 */
define('SIMPLEPIE_TYPE_RSS_ALL', 255);

/**
 * Atom 0.3
 */
define('SIMPLEPIE_TYPE_ATOM_03', 256);

/**
 * Atom 1.0
 */
define('SIMPLEPIE_TYPE_ATOM_10', 512);

/**
 * All Atom
 */
define('SIMPLEPIE_TYPE_ATOM_ALL', 768);

/**
 * All feed types
 */
define('SIMPLEPIE_TYPE_ALL', 1023);

/**
 * No construct
 */
define('SIMPLEPIE_CONSTRUCT_NONE', 0);

/**
 * Text construct
 */
define('SIMPLEPIE_CONSTRUCT_TEXT', 1);

/**
 * HTML construct
 */
define('SIMPLEPIE_CONSTRUCT_HTML', 2);

/**
 * XHTML construct
 */
define('SIMPLEPIE_CONSTRUCT_XHTML', 4);

/**
 * base64-encoded construct
 */
define('SIMPLEPIE_CONSTRUCT_BASE64', 8);

/**
 * IRI construct
 */
define('SIMPLEPIE_CONSTRUCT_IRI', 16);

/**
 * A construct that might be HTML
 */
define('SIMPLEPIE_CONSTRUCT_MAYBE_HTML', 32);

/**
 * All constructs
 */
define('SIMPLEPIE_CONSTRUCT_ALL', 63);

/**
 * PCRE for HTML attributes
 */
define('SIMPLEPIE_PCRE_HTML_ATTRIBUTE', '((?:\s+(?:(?:[^\s:]+:)?[^\s:]+)(?:\s*=\s*(?:"(?:[^"]*)"|\'(?:[^\']*)\'|(?:[a-z0-9\-._:]*)))?)*)\s*');

/**
 * PCRE for XML attributes
 */
define('SIMPLEPIE_PCRE_XML_ATTRIBUTE', '((?:\s+(?:(?:[^\s:]+:)?[^\s:]+)\s*=\s*(?:"(?:[^"]*)"|\'(?:[^\']*)\'))*)\s*');

/**
 * XML Namespace
 */
define('SIMPLEPIE_NAMESPACE_XML', 'http://www.w3.org/XML/1998/namespace');

/**
 * Atom 1.0 Namespace
 */
define('SIMPLEPIE_NAMESPACE_ATOM_10', 'http://www.w3.org/2005/Atom');

/**
 * Atom 0.3 Namespace
 */
define('SIMPLEPIE_NAMESPACE_ATOM_03', 'http://purl.org/atom/ns#');

/**
 * RDF Namespace
 */
define('SIMPLEPIE_NAMESPACE_RDF', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#');

/**
 * RSS 0.90 Namespace
 */
define('SIMPLEPIE_NAMESPACE_RSS_090', 'http://my.netscape.com/rdf/simple/0.9/');

/**
 * RSS 1.0 Namespace
 */
define('SIMPLEPIE_NAMESPACE_RSS_10', 'http://purl.org/rss/1.0/');

/**
 * RSS 1.0 Content Module Namespace
 */
define('SIMPLEPIE_NAMESPACE_RSS_10_MODULES_CONTENT', 'http://purl.org/rss/1.0/modules/content/');

/**
 * DC 1.0 Namespace
 */
define('SIMPLEPIE_NAMESPACE_DC_10', 'http://purl.org/dc/elements/1.0/');

/**
 * DC 1.1 Namespace
 */
define('SIMPLEPIE_NAMESPACE_DC_11', 'http://purl.org/dc/elements/1.1/');

/**
 * W3C Basic Geo (WGS84 lat/long) Vocabulary Namespace
 */
define('SIMPLEPIE_NAMESPACE_W3C_BASIC_GEO', 'http://www.w3.org/2003/01/geo/wgs84_pos#');

/**
 * GeoRSS Namespace
 */
define('SIMPLEPIE_NAMESPACE_GEORSS', 'http://www.georss.org/georss');

/**
 * Media RSS Namespace
 */
define('SIMPLEPIE_NAMESPACE_MEDIARSS', 'http://search.yahoo.com/mrss/');

/**
 * iTunes RSS Namespace
 */
define('SIMPLEPIE_NAMESPACE_ITUNES', 'http://www.itunes.com/dtds/podcast-1.0.dtd');

/**
 * XHTML Namespace
 */
define('SIMPLEPIE_NAMESPACE_XHTML', 'http://www.w3.org/1999/xhtml');

/**
 * IANA Link Relations Registry
 */
define('SIMPLEPIE_IANA_LINK_RELATIONS_REGISTRY', 'http://www.iana.org/assignments/relation/');

/**
 * Whether we're running on PHP5
 */
define('SIMPLEPIE_PHP5', version_compare(PHP_VERSION, '5.0.0', '>='));

require_once 'SimplePie/Author.php';
require_once 'SimplePie/Cache.php';
require_once 'SimplePie/Caption.php';
require_once 'SimplePie/Category.php';
require_once 'SimplePie/Copyright.php';
require_once 'SimplePie/Credit.php';
require_once 'SimplePie/Decode_HTML_Entities.php';
require_once 'SimplePie/Enclosure.php';
require_once 'SimplePie/File.php';
require_once 'SimplePie/HTTP_Parser.php';
require_once 'SimplePie/Item.php';
require_once 'SimplePie/Locator.php';
require_once 'SimplePie/Misc.php';
require_once 'SimplePie/Parser.php';
require_once 'SimplePie/Rating.php';
require_once 'SimplePie/Restriction.php';
require_once 'SimplePie/Sanitize.php';

/**
 * SimplePie
 *
 * @package SimplePie
 * @version "Razzleberry"
 * @copyright 2004-2007 Ryan Parman, Geoffrey Sneddon
 * @author Ryan Parman
 * @author Geoffrey Sneddon
 * @todo Option for type of fetching (cache, not modified header, fetch, etc.)
 */
class SimplePie
{
	/**
	 * @var array Raw data
	 * @access private
	 */
	var $data = array();

	/**
	 * @var mixed Error string
	 * @access private
	 */
	var $error;

	/**
	 * @var object Instance of SimplePie_Sanitize (or other class)
	 * @see SimplePie::set_sanitize_class()
	 * @access private
	 */
	var $sanitize;

	/**
	 * @var string SimplePie Useragent
	 * @see SimplePie::set_useragent()
	 * @access private
	 */
	var $useragent = SIMPLEPIE_USERAGENT;

	/**
	 * @var string Feed URL
	 * @see SimplePie::set_feed_url()
	 * @access private
	 */
	var $feed_url;

	/**
	 * @var object Instance of SimplePie_File to use as a feed
	 * @see SimplePie::set_file()
	 * @access private
	 */
	var $file;

	/**
	 * @var string Raw feed data
	 * @see SimplePie::set_raw_data()
	 * @access private
	 */
	var $raw_data;

	/**
	 * @var int Timeout for fetching remote files
	 * @see SimplePie::set_timeout()
	 * @access private
	 */
	var $timeout = 10;

	/**
	 * @var bool Forces fsockopen() to be used for remote files instead
	 * of cURL, even if a new enough version is installed
	 * @see SimplePie::force_fsockopen()
	 * @access private
	 */
	var $force_fsockopen = false;

	/**
	 * @var bool Enable/Disable XML dump
	 * @see SimplePie::enable_xml_dump()
	 * @access private
	 */
	var $xml_dump = false;

	/**
	 * @var bool Enable/Disable Caching
	 * @see SimplePie::enable_cache()
	 * @access private
	 */
	var $cache = true;

	/**
	 * @var int Cache duration (in seconds)
	 * @see SimplePie::set_cache_duration()
	 * @access private
	 */
	var $cache_duration = 3600;

	/**
	 * @var int Auto-discovery cache duration (in seconds)
	 * @see SimplePie::set_autodiscovery_cache_duration()
	 * @access private
	 */
	var $autodiscovery_cache_duration = 604800; // 7 Days.

	/**
	 * @var string Cache location (relative to executing script)
	 * @see SimplePie::set_cache_location()
	 * @access private
	 */
	var $cache_location = './cache';

	/**
	 * @var string Function that creates the cache filename
	 * @see SimplePie::set_cache_name_function()
	 * @access private
	 */
	var $cache_name_function = 'md5';

	/**
	 * @var bool Reorder feed by date descending
	 * @see SimplePie::enable_order_by_date()
	 * @access private
	 */
	var $order_by_date = true;

	/**
	 * @var mixed Force input encoding to be set to the follow value
	 * (false, or anything type-cast to false, disables this feature)
	 * @see SimplePie::set_input_encoding()
	 * @access private
	 */
	var $input_encoding = false;

	/**
	 * @var int Feed Autodiscovery Level
	 * @see SimplePie::set_autodiscovery_level()
	 * @access private
	 */
	var $autodiscovery = SIMPLEPIE_LOCATOR_ALL;

	/**
	 * @var string Class used for caching feeds
	 * @see SimplePie::set_cache_class()
	 * @access private
	 */
	var $cache_class = 'SimplePie_Cache';

	/**
	 * @var string Class used for locating feeds
	 * @see SimplePie::set_locator_class()
	 * @access private
	 */
	var $locator_class = 'SimplePie_Locator';

	/**
	 * @var string Class used for parsing feeds
	 * @see SimplePie::set_parser_class()
	 * @access private
	 */
	var $parser_class = 'SimplePie_Parser';

	/**
	 * @var string Class used for fetching feeds
	 * @see SimplePie::set_file_class()
	 * @access private
	 */
	var $file_class = 'SimplePie_File';

	/**
	 * @var string Class used for items
	 * @see SimplePie::set_item_class()
	 * @access private
	 */
	var $item_class = 'SimplePie_Item';

	/**
	 * @var string Class used for authors
	 * @see SimplePie::set_author_class()
	 * @access private
	 */
	var $author_class = 'SimplePie_Author';

	/**
	 * @var string Class used for categories
	 * @see SimplePie::set_category_class()
	 * @access private
	 */
	var $category_class = 'SimplePie_Category';

	/**
	 * @var string Class used for enclosures
	 * @see SimplePie::set_enclosures_class()
	 * @access private
	 */
	var $enclosure_class = 'SimplePie_Enclosure';

	/**
	 * @var string Class used for Media RSS <media:text> captions
	 * @see SimplePie::set_caption_class()
	 * @access private
	 */
	var $caption_class = 'SimplePie_Caption';

	/**
	 * @var string Class used for Media RSS <media:copyright>
	 * @see SimplePie::set_copyright_class()
	 * @access private
	 */
	var $copyright_class = 'SimplePie_Copyright';

	/**
	 * @var string Class used for Media RSS <media:credit>
	 * @see SimplePie::set_credit_class()
	 * @access private
	 */
	var $credit_class = 'SimplePie_Credit';

	/**
	 * @var string Class used for Media RSS <media:rating>
	 * @see SimplePie::set_rating_class()
	 * @access private
	 */
	var $rating_class = 'SimplePie_Rating';

	/**
	 * @var string Class used for Media RSS <media:restriction>
	 * @see SimplePie::set_restriction_class()
	 * @access private
	 */
	var $restriction_class = 'SimplePie_Restriction';

	/**
	 * @var mixed Set javascript query string parameter (false, or
	 * anything type-cast to false, disables this feature)
	 * @see SimplePie::set_javascript()
	 * @access private
	 */
	var $javascript = 'js';

	/**
	 * @var int Maximum number of feeds to check with autodiscovery
	 * @see SimplePie::set_max_checked_feeds()
	 * @access private
	 */
	var $max_checked_feeds = 10;

	/**
	 * @var string Web-accessible path to the handler_favicon.php file.
	 * @see SimplePie::set_favicon_handler()
	 * @access private
	 */
	var $favicon_handler = '';

	/**
	 * @var string Web-accessible path to the handler_image.php file.
	 * @see SimplePie::set_image_handler()
	 * @access private
	 */
	var $image_handler = '';

	/**
	 * @var array Stores the URLs when multiple feeds are being initialized.
	 * @see SimplePie::set_feed_url()
	 * @access private
	 */
	var $multifeed_url = array();

	/**
	 * @var array Stores SimplePie objects when multiple feeds initialized.
	 * @access private
	 */
	var $multifeed_objects = array();

	/**
	 * @var array Stores the get_object_vars() array for use with multifeeds.
	 * @see SimplePie::set_feed_url()
	 * @access private
	 */
	var $config_settings = null;

	/**
	 * @var array Stores the default attributes to be stripped by strip_attributes().
	 * @see SimplePie::strip_attributes()
	 * @access private
	 */
	var $strip_attributes = array('bgsound', 'class', 'expr', 'id', 'style', 'onclick', 'onerror', 'onfinish', 'onmouseover', 'onmouseout', 'onfocus', 'onblur', 'lowsrc', 'dynsrc');

	/**
	 * @var array Stores the default tags to be stripped by strip_htmltags().
	 * @see SimplePie::strip_htmltags()
	 * @access private
	 */
	var $strip_htmltags = array('base', 'blink', 'body', 'doctype', 'embed', 'font', 'form', 'frame', 'frameset', 'html', 'iframe', 'input', 'marquee', 'meta', 'noscript', 'object', 'param', 'script', 'style');

	/**
	 * @var string proxy used to fetch feeds
	 * @see SimplePie::set_proxy()
	 * @access private
	 */
	var $proxy = "";

	/**
	 * The SimplePie class contains feed level data and options
	 *
	 * There are two ways that you can create a new SimplePie object. The first
	 * is by passing a feed URL as a parameter to the SimplePie constructor
	 * (as well as optionally setting the cache location and cache expiry). This
	 * will initialise the whole feed with all of the default settings, and you
	 * can begin accessing methods and properties immediately.
	 *
	 * The second way is to create the SimplePie object with no parameters
	 * at all. This will enable you to set configuration options. After setting
	 * them, you must initialise the feed using $feed->init(). At that point the
	 * object's methods and properties will be available to you. This format is
	 * what is used throughout this documentation.
	 *
	 * @access public
	 * @since 1.0 Preview Release
	 * @param string $feed_url This is the URL you want to parse.
	 * @param string $cache_location This is where you want the cache to be stored.
	 * @param int $cache_duration This is the number of seconds that you want to store the cache file for.
	 * @param string $proxy This is the proxy "host:port" used to fetch feeds
	 */
	function SimplePie($feed_url = null, $cache_location = null, $cache_duration = null, $proxy = null)
	{
		// Other objects, instances created here so we can set options on them
		$this->sanitize =& new SimplePie_Sanitize;

		// Set options if they're passed to the constructor
		if ($cache_location !== null)
		{
			$this->set_cache_location($cache_location);
		}

		if ($cache_duration !== null)
		{
			$this->set_cache_duration($cache_duration);
		}

		if ($proxy !== null)
		{
			$this->set_proxy($proxy);
		}

		// Only init the script if we're passed a feed URL
		if ($feed_url !== null)
		{
			$this->set_feed_url($feed_url);
			$this->init();
		}
	}

	/**
	 * Used for converting object to a string
	 */
	function __toString()
	{
		return md5(serialize($this->data));
	}

	/**
	 * This is the URL of the feed you want to parse.
	 *
	 * This allows you to enter the URL of the feed you want to parse, or the
	 * website you want to try to use auto-discovery on. This takes priority
	 * over any set raw data.
	 *
	 * You can set multiple feeds to mash together by passing an array instead
	 * of a string for the $url. Remember that with each additional feed comes
	 * additional processing and resources.
	 *
	 * @access public
	 * @since 1.0 Preview Release
	 * @param mixed $url This is the URL (or array of URLs) that you want to parse.
	 * @see SimplePie::set_raw_data()
	 */
	function set_feed_url($url)
	{
		if (is_array($url))
		{
			$this->multifeed_url = array();
			foreach ($url as $value)
			{
				$this->multifeed_url[] = SimplePie_Misc::fix_protocol($value, 1);
			}
		}
		else
		{
			$this->feed_url = SimplePie_Misc::fix_protocol($url, 1);
		}
	}

	/**
	 * This is the proxy used to fetch feeds
	 *
	 * @access public
	 * @param string $proxy This is the URL of the proxy "host:port"
	 */
	function set_proxy($proxy)
	{
		$this->proxy = $proxy;
		$this->sanitize->proxy = $proxy;
	}

	/**
	 * Provides an instance of SimplePie_File to use as a feed
	 *
	 * @access public
	 * @param object &$file Instance of SimplePie_File (or subclass)
	 * @return bool True on success, false on failure
	 */
	function set_file(&$file)
	{
		if (SimplePie_Misc::is_a($file, 'SimplePie_File'))
		{
			$this->feed_url = $file->url;
			$this->file =& $file;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to use a string of RSS/Atom data instead of a remote feed.
	 *
	 * If you have a feed available as a string in PHP, you can tell SimplePie
	 * to parse that data string instead of a remote feed. Any set feed URL
	 * takes precedence.
	 *
	 * @access public
	 * @since 1.0 Beta 3
	 * @param string $data RSS or Atom data as a string.
	 * @see SimplePie::set_feed_url()
	 */
	function set_raw_data($data)
	{
		$this->raw_data = trim($data);
	}

	/**
	 * Allows you to override the default timeout for fetching remote feeds.
	 *
	 * This allows you to change the maximum time the feed's server to respond
	 * and send the feed back.
	 *
	 * @access public
	 * @since 1.0 Beta 3
	 * @param int $timeout The maximum number of seconds to spend waiting to retrieve a feed.
	 */
	function set_timeout($timeout = 10)
	{
		$this->timeout = (int) $timeout;
	}

	/**
	 * Forces SimplePie to use fsockopen() instead of the preferred cURL
	 * functions.
	 *
	 * @access public
	 * @since 1.0 Beta 3
	 * @param bool $enable Force fsockopen() to be used
	 */
	function force_fsockopen($enable = false)
	{
		$this->force_fsockopen = (bool) $enable;
	}

	/**
	 * Outputs the raw XML content of the feed, after it has gone through
	 * SimplePie's filters.
	 *
	 * Used only for debugging, this function will output the XML content as
	 * text/xml. When SimplePie reads in a feed, it does a bit of cleaning up
	 * before trying to parse it. Many parts of the feed are re-written in
	 * memory, and in the end, you have a parsable feed. XML dump shows you the
	 * actual XML that SimplePie tries to parse, which may or may not be very
	 * different from the original feed.
	 *
	 * @access public
	 * @since 1.0 Preview Release
	 * @param bool $enable Enable XML dump
	 */
	function enable_xml_dump($enable = false)
	{
		$this->xml_dump = (bool) $enable;
	}

	/**
	 * Enables/disables caching in SimplePie.
	 *
	 * This option allows you to disable caching all-together in SimplePie.
	 * However, disabling the cache can lead to longer load times.
	 *
	 * @access public
	 * @since 1.0 Preview Release
	 * @param bool $enable Enable caching
	 */
	function enable_cache($enable = true)
	{
		$this->cache = (bool) $enable;
	}

	/**
	 * Set the length of time (in seconds) that the contents of a feed
	 * will be cached.
	 *
	 * @access public
	 * @param int $seconds The feed content cache duration.
	 */
	function set_cache_duration($seconds = 3600)
	{
		$this->cache_duration = (int) $seconds;
	}

	/**
	 * Set the length of time (in seconds) that the autodiscovered feed
	 * URL will be cached.
	 *
	 * @access public
	 * @param int $seconds The autodiscovered feed URL cache duration.
	 */
	function set_autodiscovery_cache_duration($seconds = 604800)
	{
		$this->autodiscovery_cache_duration = (int) $seconds;
	}

	/**
	 * Set the file system location where the cached files should be stored.
	 *
	 * @access public
	 * @param string $location The file system location.
	 */
	function set_cache_location($location = './cache')
	{
		$this->cache_location = (string) $location;
	}

	/**
	 * Determines whether feed items should be sorted into reverse chronological order.
	 *
	 * @access public
	 * @param bool $enable Sort as reverse chronological order.
	 */
	function enable_order_by_date($enable = true)
	{
		$this->order_by_date = (bool) $enable;
	}

	/**
	 * Allows you to override the character encoding reported by the feed.
	 *
	 * @access public
	 * @param string $encoding Character encoding.
	 */
	function set_input_encoding($encoding = false)
	{
		if ($encoding)
		{
			$this->input_encoding = (string) $encoding;
		}
		else
		{
			$this->input_encoding = false;
		}
	}

	/**
	 * Set how much feed autodiscovery to do
	 *
	 * @access public
	 * @see SIMPLEPIE_LOCATOR_NONE
	 * @see SIMPLEPIE_LOCATOR_AUTODISCOVERY
	 * @see SIMPLEPIE_LOCATOR_LOCAL_EXTENSION
	 * @see SIMPLEPIE_LOCATOR_LOCAL_BODY
	 * @see SIMPLEPIE_LOCATOR_REMOTE_EXTENSION
	 * @see SIMPLEPIE_LOCATOR_REMOTE_BODY
	 * @see SIMPLEPIE_LOCATOR_ALL
	 * @param int $level Feed Autodiscovery Level (level can be a
	 * combination of the above constants, see bitwise OR operator)
	 */
	function set_autodiscovery_level($level = SIMPLEPIE_LOCATOR_ALL)
	{
		$this->autodiscovery = (int) $level;
	}

	/**
	 * Allows you to change which class SimplePie uses for caching.
	 * Useful when you are overloading or extending SimplePie's default classes.
	 *
	 * @access public
	 * @param string $class Name of custom class.
	 * @link http://php.net/manual/en/keyword.extends.php PHP4 extends documentation
	 * @link http://php.net/manual/en/language.oop5.basic.php#language.oop5.basic.extends PHP5 extends documentation
	 */
	function set_cache_class($class = 'SimplePie_Cache')
	{
		if (SimplePie_Misc::is_subclass_of($class, 'SimplePie_Cache'))
		{
			$this->cache_class = $class;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to change which class SimplePie uses for auto-discovery.
	 * Useful when you are overloading or extending SimplePie's default classes.
	 *
	 * @access public
	 * @param string $class Name of custom class.
	 * @link http://php.net/manual/en/keyword.extends.php PHP4 extends documentation
	 * @link http://php.net/manual/en/language.oop5.basic.php#language.oop5.basic.extends PHP5 extends documentation
	 */
	function set_locator_class($class = 'SimplePie_Locator')
	{
		if (SimplePie_Misc::is_subclass_of($class, 'SimplePie_Locator'))
		{
			$this->locator_class = $class;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to change which class SimplePie uses for XML parsing.
	 * Useful when you are overloading or extending SimplePie's default classes.
	 *
	 * @access public
	 * @param string $class Name of custom class.
	 * @link http://php.net/manual/en/keyword.extends.php PHP4 extends documentation
	 * @link http://php.net/manual/en/language.oop5.basic.php#language.oop5.basic.extends PHP5 extends documentation
	 */
	function set_parser_class($class = 'SimplePie_Parser')
	{
		if (SimplePie_Misc::is_subclass_of($class, 'SimplePie_Parser'))
		{
			$this->parser_class = $class;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to change which class SimplePie uses for remote file fetching.
	 * Useful when you are overloading or extending SimplePie's default classes.
	 *
	 * @access public
	 * @param string $class Name of custom class.
	 * @link http://php.net/manual/en/keyword.extends.php PHP4 extends documentation
	 * @link http://php.net/manual/en/language.oop5.basic.php#language.oop5.basic.extends PHP5 extends documentation
	 */
	function set_file_class($class = 'SimplePie_File')
	{
		if (SimplePie_Misc::is_subclass_of($class, 'SimplePie_File'))
		{
			$this->file_class = $class;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to change which class SimplePie uses for data sanitization.
	 * Useful when you are overloading or extending SimplePie's default classes.
	 *
	 * @access public
	 * @param string $class Name of custom class.
	 * @link http://php.net/manual/en/keyword.extends.php PHP4 extends documentation
	 * @link http://php.net/manual/en/language.oop5.basic.php#language.oop5.basic.extends PHP5 extends documentation
	 */
	function set_sanitize_class($class = 'SimplePie_Sanitize')
	{
		if (SimplePie_Misc::is_subclass_of($class, 'SimplePie_Sanitize'))
		{
			$this->sanitize =& new $class;
			$this->sanitize->proxy = $this->proxy;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to change which class SimplePie uses for handling feed items.
	 * Useful when you are overloading or extending SimplePie's default classes.
	 *
	 * @access public
	 * @param string $class Name of custom class.
	 * @link http://php.net/manual/en/keyword.extends.php PHP4 extends documentation
	 * @link http://php.net/manual/en/language.oop5.basic.php#language.oop5.basic.extends PHP5 extends documentation
	 */
	function set_item_class($class = 'SimplePie_Item')
	{
		if (SimplePie_Misc::is_subclass_of($class, 'SimplePie_Item'))
		{
			$this->item_class = $class;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to change which class SimplePie uses for handling author data.
	 * Useful when you are overloading or extending SimplePie's default classes.
	 *
	 * @access public
	 * @param string $class Name of custom class.
	 * @link http://php.net/manual/en/keyword.extends.php PHP4 extends documentation
	 * @link http://php.net/manual/en/language.oop5.basic.php#language.oop5.basic.extends PHP5 extends documentation
	 */
	function set_author_class($class = 'SimplePie_Author')
	{
		if (SimplePie_Misc::is_subclass_of($class, 'SimplePie_Author'))
		{
			$this->author_class = $class;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to change which class SimplePie uses for handling category data.
	 * Useful when you are overloading or extending SimplePie's default classes.
	 *
	 * @access public
	 * @param string $class Name of custom class.
	 * @link http://php.net/manual/en/keyword.extends.php PHP4 extends documentation
	 * @link http://php.net/manual/en/language.oop5.basic.php#language.oop5.basic.extends PHP5 extends documentation
	 */
	function set_category_class($class = 'SimplePie_Category')
	{
		if (SimplePie_Misc::is_subclass_of($class, 'SimplePie_Category'))
		{
			$this->category_class = $class;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to change which class SimplePie uses for feed enclosures.
	 * Useful when you are overloading or extending SimplePie's default classes.
	 *
	 * @access public
	 * @param string $class Name of custom class.
	 * @link http://php.net/manual/en/keyword.extends.php PHP4 extends documentation
	 * @link http://php.net/manual/en/language.oop5.basic.php#language.oop5.basic.extends PHP5 extends documentation
	 */
	function set_enclosure_class($class = 'SimplePie_Enclosure')
	{
		if (SimplePie_Misc::is_subclass_of($class, 'SimplePie_Enclosure'))
		{
			$this->enclosure_class = $class;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to change which class SimplePie uses for <media:text> captions
	 * Useful when you are overloading or extending SimplePie's default classes.
	 *
	 * @access public
	 * @param string $class Name of custom class.
	 * @link http://php.net/manual/en/keyword.extends.php PHP4 extends documentation
	 * @link http://php.net/manual/en/language.oop5.basic.php#language.oop5.basic.extends PHP5 extends documentation
	 */
	function set_caption_class($class = 'SimplePie_Caption')
	{
		if (SimplePie_Misc::is_subclass_of($class, 'SimplePie_Caption'))
		{
			$this->caption_class = $class;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to change which class SimplePie uses for <media:copyright>
	 * Useful when you are overloading or extending SimplePie's default classes.
	 *
	 * @access public
	 * @param string $class Name of custom class.
	 * @link http://php.net/manual/en/keyword.extends.php PHP4 extends documentation
	 * @link http://php.net/manual/en/language.oop5.basic.php#language.oop5.basic.extends PHP5 extends documentation
	 */
	function set_copyright_class($class = 'SimplePie_Copyright')
	{
		if (SimplePie_Misc::is_subclass_of($class, 'SimplePie_Copyright'))
		{
			$this->copyright_class = $class;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to change which class SimplePie uses for <media:credit>
	 * Useful when you are overloading or extending SimplePie's default classes.
	 *
	 * @access public
	 * @param string $class Name of custom class.
	 * @link http://php.net/manual/en/keyword.extends.php PHP4 extends documentation
	 * @link http://php.net/manual/en/language.oop5.basic.php#language.oop5.basic.extends PHP5 extends documentation
	 */
	function set_credit_class($class = 'SimplePie_Credit')
	{
		if (SimplePie_Misc::is_subclass_of($class, 'SimplePie_Credit'))
		{
			$this->credit_class = $class;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to change which class SimplePie uses for <media:rating>
	 * Useful when you are overloading or extending SimplePie's default classes.
	 *
	 * @access public
	 * @param string $class Name of custom class.
	 * @link http://php.net/manual/en/keyword.extends.php PHP4 extends documentation
	 * @link http://php.net/manual/en/language.oop5.basic.php#language.oop5.basic.extends PHP5 extends documentation
	 */
	function set_rating_class($class = 'SimplePie_Rating')
	{
		if (SimplePie_Misc::is_subclass_of($class, 'SimplePie_Rating'))
		{
			$this->rating_class = $class;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to change which class SimplePie uses for <media:restriction>
	 * Useful when you are overloading or extending SimplePie's default classes.
	 *
	 * @access public
	 * @param string $class Name of custom class.
	 * @link http://php.net/manual/en/keyword.extends.php PHP4 extends documentation
	 * @link http://php.net/manual/en/language.oop5.basic.php#language.oop5.basic.extends PHP5 extends documentation
	 */
	function set_restriction_class($class = 'SimplePie_Restriction')
	{
		if (SimplePie_Misc::is_subclass_of($class, 'SimplePie_Restriction'))
		{
			$this->restriction_class = $class;
			return true;
		}
		return false;
	}

	/**
	 * Allows you to override the default user agent string.
	 *
	 * @access public
	 * @param string $ua New user agent string.
	 */
	function set_useragent($ua = SIMPLEPIE_USERAGENT)
	{
		$this->useragent = (string) $ua;
	}

	/**
	 * Set callback function to create cache filename with
	 *
	 * @access public
	 * @param mixed $function Callback function
	 */
	function set_cache_name_function($function = 'md5')
	{
		if (is_callable($function))
		{
			$this->cache_name_function = $function;
		}
	}

	/**
	 * Set javascript query string parameter
	 *
	 * @access public
	 * @param mixed $get Javascript query string parameter
	 */
	function set_javascript($get = 'js')
	{
		if ($get)
		{
			$this->javascript = (string) $get;
		}
		else
		{
			$this->javascript = false;
		}
	}

	/**
	 * Set options to make SP as fast as possible.  Forgoes a
	 * substantial amount of data sanitization in favor of speed.
	 *
	 * @access public
	 * @param bool $set Whether to set them or not
	 */
	function set_stupidly_fast($set = false)
	{
		if ($set)
		{
			$this->enable_order_by_date(false);
			$this->remove_div(false);
			$this->strip_comments(false);
			$this->strip_htmltags(false);
			$this->strip_attributes(false);
			$this->set_image_handler(false);
		}
	}

	/**
	 * Set maximum number of feeds to check with autodiscovery
	 *
	 * @access public
	 * @param int $max Maximum number of feeds to check
	 */
	function set_max_checked_feeds($max = 10)
	{
		$this->max_checked_feeds = (int) $max;
	}

	function remove_div($enable = true)
	{
		$this->sanitize->remove_div($enable);
	}

	function strip_htmltags($tags = '', $encode = null)
	{
		if ($tags === '')
		{
			$tags = $this->strip_htmltags;
		}
		$this->sanitize->strip_htmltags($tags);
		if ($encode !== null)
		{
			$this->sanitize->encode_instead_of_strip($tags);
		}
	}

	function encode_instead_of_strip($enable = true)
	{
		$this->sanitize->encode_instead_of_strip($enable);
	}

	function strip_attributes($attribs = '')
	{
		if ($attribs === '')
		{
			$attribs = $this->strip_attributes;
		}
		$this->sanitize->strip_attributes($attribs);
	}

	function set_output_encoding($encoding = 'UTF-8')
	{
		$this->sanitize->set_output_encoding($encoding);
	}

	function strip_comments($strip = false)
	{
		$this->sanitize->strip_comments($strip);
	}

	/**
	 * Set element/attribute key/value pairs of HTML attributes
	 * containing URLs that need to be resolved relative to the feed
	 *
	 * @access public
	 * @since 1.0
	 * @param array $element_attribute Element/attribute key/value pairs
	 */
	function set_url_replacements($element_attribute = array('a' => 'href', 'area' => 'href', 'blockquote' => 'cite', 'del' => 'cite', 'form' => 'action', 'img' => array('longdesc', 'src'), 'input' => 'src', 'ins' => 'cite', 'q' => 'cite'))
	{
		$this->sanitize->set_url_replacements($element_attribute);
	}

	/**
	 * Set the handler to enable the display of cached favicons.
	 *
	 * @access public
	 * @param str $page Web-accessible path to the handler_favicon.php file.
	 * @param str $qs The query string that the value should be passed to.
	 */
	function set_favicon_handler($page = false, $qs = 'i')
	{
		if ($page != false)
		{
			$this->favicon_handler = $page . '?' . $qs . '=';
		}
		else
		{
			$this->favicon_handler = '';
		}
	}

	/**
	 * Set the handler to enable the display of cached images.
	 *
	 * @access public
	 * @param str $page Web-accessible path to the handler_image.php file.
	 * @param str $qs The query string that the value should be passed to.
	 */
	function set_image_handler($page = false, $qs = 'i')
	{
		if ($page != false)
		{
			$this->sanitize->set_image_handler($page . '?' . $qs . '=');
		}
		else
		{
			$this->image_handler = '';
		}
	}

	function init()
	{
		if ((function_exists('version_compare') && version_compare(PHP_VERSION, '4.1.0', '<')) || !extension_loaded('xml') || !extension_loaded('pcre'))
		{
			return false;
		}
		if (isset($_GET[$this->javascript]))
		{
			if (function_exists('ob_gzhandler'))
			{
				ob_start('ob_gzhandler');
			}
			header('Content-type: text/javascript; charset: UTF-8');
			header('Cache-Control: must-revalidate');
			header('Expires: ' . gmdate('D, d M Y H:i:s', time() + 604800) . ' GMT'); // 7 days
			?>
function embed_odeo(link) {
	document.writeln('<embed src="http://odeo.com/flash/audio_player_fullsize.swf" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" quality="high" width="440" height="80" wmode="transparent" allowScriptAccess="any" flashvars="valid_sample_rate=true&external_url='+link+'"></embed>');
}

function embed_quicktime(type, bgcolor, width, height, link, placeholder, loop) {
	if (placeholder != '') {
		document.writeln('<embed type="'+type+'" style="cursor:hand; cursor:pointer;" href="'+link+'" src="'+placeholder+'" width="'+width+'" height="'+height+'" autoplay="false" target="myself" controller="false" loop="'+loop+'" scale="aspect" bgcolor="'+bgcolor+'" pluginspage="http://www.apple.com/quicktime/download/"></embed>');
	}
	else {
		document.writeln('<embed type="'+type+'" style="cursor:hand; cursor:pointer;" src="'+link+'" width="'+width+'" height="'+height+'" autoplay="false" target="myself" controller="true" loop="'+loop+'" scale="aspect" bgcolor="'+bgcolor+'" pluginspage="http://www.apple.com/quicktime/download/"></embed>');
	}
}

function embed_flash(bgcolor, width, height, link, loop, type) {
	document.writeln('<embed src="'+link+'" pluginspage="http://www.macromedia.com/go/getflashplayer" type="'+type+'" quality="high" width="'+width+'" height="'+height+'" bgcolor="'+bgcolor+'" loop="'+loop+'"></embed>');
}

function embed_flv(width, height, link, placeholder, loop, player) {
	document.writeln('<embed src="'+player+'" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" quality="high" width="'+width+'" height="'+height+'" wmode="transparent" flashvars="file='+link+'&autostart=false&repeat='+loop+'&showdigits=true&showfsbutton=false"></embed>');
}

function embed_wmedia(width, height, link) {
	document.writeln('<embed type="application/x-mplayer2" src="'+link+'" autosize="1" width="'+width+'" height="'+height+'" showcontrols="1" showstatusbar="0" showdisplay="0" autostart="0"></embed>');
}
			<?php
			exit;
		}

		// Pass whatever was set with config options over to the sanitizer.
		$this->sanitize->pass_cache_data($this->cache, $this->cache_location, $this->cache_name_function, $this->cache_class);
		$this->sanitize->pass_file_data($this->file_class, $this->timeout, $this->useragent, $this->force_fsockopen);

		if ($this->feed_url !== null || $this->raw_data !== null)
		{
			$this->data = array();
			$this->multifeed_objects = array();
			$cache = false;

			if ($this->feed_url !== null)
			{
				$parsed_feed_url = SimplePie_Misc::parse_url($this->feed_url);
				// Decide whether to enable caching
				if ($this->cache && $parsed_feed_url['scheme'] !== '')
				{
					$cache =& new $this->cache_class($this->cache_location, call_user_func($this->cache_name_function, $this->feed_url), 'spc');
				}
				// If it's enabled and we don't want an XML dump, use the cache
				if ($cache && !$this->xml_dump)
				{
					// Load the Cache
					$this->data = $cache->load();
					if (!empty($this->data))
					{
						// If the cache is for an outdated build of SimplePie
						if (!isset($this->data['build']) || $this->data['build'] != SIMPLEPIE_BUILD)
						{
							$cache->unlink();
							$this->data = array();
						}
						// If we've hit a collision just rerun it with caching disabled
						elseif (isset($this->data['url']) && $this->data['url'] != $this->feed_url)
						{
							$cache = false;
							$this->data = array();
						}
						// If we've got a non feed_url stored (if the page isn't actually a feed, or is a redirect) use that URL.
						elseif (isset($this->data['feed_url']))
						{
							// If the autodiscovery cache is still valid use it.
							if ($cache->mtime() + $this->autodiscovery_cache_duration > time())
							{
								// Do not need to do feed autodiscovery yet.
								if ($this->data['feed_url'] == $this->data['url'])
								{
									$cache->unlink();
									$this->data = array();
								}
								else
								{
									$this->set_feed_url($this->data['feed_url']);
									return $this->init();
								}
							}
						}
						// Check if the cache has been updated
						elseif ($cache->mtime() + $this->cache_duration < time())
						{
							// If we have last-modified and/or etag set
							if (isset($this->data['headers']['last-modified']) || isset($this->data['headers']['etag']))
							{
								$headers = array();
								if (isset($this->data['headers']['last-modified']))
								{
									$headers['if-modified-since'] = $this->data['headers']['last-modified'];
								}
								if (isset($this->data['headers']['etag']))
								{
									$headers['if-none-match'] = $this->data['headers']['etag'];
								}
								$file =& new $this->file_class($this->feed_url, $this->timeout/10, 5, $headers, $this->useragent, $this->force_fsockopen, $this->proxy);
								if ($file->success)
								{
									if ($file->status_code == 304)
									{
										$cache->touch();
										return true;
									}
									else
									{
										$headers = $file->headers;
									}
								}
								else
								{
									unset($file);
								}
							}
						}
						// If the cache is still valid, just return true
						else
						{
							return true;
						}
					}
					// If the cache is empty, delete it
					else
					{
						$cache->unlink();
						$this->data = array();
					}
				}
				// If we don't already have the file (it'll only exist if we've opened it to check if the cache has been modified), open it.
				if (!isset($file))
				{
					if (SimplePie_Misc::is_a($this->file, 'SimplePie_File') && $this->file->url == $this->feed_url)
					{
						$file =& $this->file;
					}
					else
					{
						$file =& new $this->file_class($this->feed_url, $this->timeout, 5, null, $this->useragent, $this->force_fsockopen, $this->proxy);
					}
				}
				// If the file connection has an error, set SimplePie::error to that and quit
				if (!$file->success)
				{
					$this->error = $file->error;
					if (!empty($this->data))
					{
						return true;
					}
					else
					{
						return false;
					}
				}

				// Check if the supplied URL is a feed, if it isn't, look for it.
				$locate =& new $this->locator_class($file, $this->timeout, $this->useragent, $this->file_class, $this->max_checked_feeds);
				if (!$locate->is_feed($file))
				{
					// We need to unset this so that if SimplePie::set_file() has been called that object is untouched
					unset($file);
					if ($file = $locate->find($this->autodiscovery))
					{
						if ($cache)
						{
							if (!$cache->save(array('url' => $this->feed_url, 'feed_url' => $file->url, 'build' => SIMPLEPIE_BUILD)))
							{
								trigger_error("$cache->name is not writeable", E_USER_WARNING);
							}
							$cache =& new $this->cache_class($this->cache_location, call_user_func($this->cache_name_function, $file->url), 'spc');
						}
						$this->feed_url = $file->url;
					}
					else
					{
						$this->error = "A feed could not be found at $this->feed_url";
						SimplePie_Misc::error($this->error, E_USER_NOTICE, __FILE__, __LINE__);
						return false;
					}
				}
				$locate = null;

				$headers = $file->headers;
				$data = trim($file->body);
				unset($file);
			}
			else
			{
				$data = $this->raw_data;
			}

			// First check to see if input has been overridden.
			if ($this->input_encoding !== false)
			{
				$encoding = $this->input_encoding;
			}
			// Second try HTTP headers
			elseif (isset($headers['content-type']) && preg_match('/;[\x09\x20]*charset=([^;]*)/i', $headers['content-type'], $charset))
			{
				$encoding = $charset[1];
			}
			// Then prolog, if at the very start of the document
			elseif (preg_match("/^<\?xml[\x20\x9\xD\xA]+version([\x20\x9\xD\xA]+)?=([\x20\x9\xD\xA]+)?(\"1.0\"|'1.0'|\"1.1\"|'1.1')[\x20\x9\xD\xA]+encoding([\x20\x9\xD\xA]+)?=([\x20\x9\xD\xA]+)?(\"[A-Za-z][A-Za-z0-9._\-]*\"|'[A-Za-z][A-Za-z0-9._\-]*')([\x20\x9\xD\xA]+standalone([\x20\x9\xD\xA]+)?=([\x20\x9\xD\xA]+)?(\"(yes|no)\"|'(yes|no)'))?([\x20\x9\xD\xA]+)?\?>/", $data, $prolog))
			{
				$encoding = substr($prolog[6], 1, -1);
			}
			// UTF-32 Big Endian BOM
			elseif (strpos($data, "\x0\x0\xFE\xFF") === 0)
			{
				$encoding = 'UTF-32be';
			}
			// UTF-32 Little Endian BOM
			elseif (strpos($data, "\xFF\xFE\x0\x0") === 0)
			{
				$encoding = 'UTF-32';
			}
			// UTF-16 Big Endian BOM
			elseif (strpos($data, "\xFE\xFF") === 0)
			{
				$encoding = 'UTF-16be';
			}
			// UTF-16 Little Endian BOM
			elseif (strpos($data, "\xFF\xFE") === 0)
			{
				$encoding = 'UTF-16le';
			}
			// UTF-8 BOM
			elseif (strpos($data, "\xEF\xBB\xBF") === 0)
			{
				$encoding = 'UTF-8';
			}
			// Fallback to the default (US-ASCII for text/xml, ISO-8859-1 for text/* MIME types, UTF-8 otherwise)
			elseif (isset($headers['content-type']) && strtolower(SimplePie_Misc::parse_mime($headers['content-type'])) == 'text/xml')
			{
				$encoding = 'US-ASCII';
			}
			elseif (isset($headers['content-type']) && SimplePie_Misc::stripos(SimplePie_Misc::parse_mime($headers['content-type']), 'text/') === 0)
			{
				$encoding = 'ISO-8859-1';
			}
			else
			{
				$encoding = 'UTF-8';
			}

			// Change the encoding to UTF-8 (as we always use UTF-8 internally)
			if ($encoding != 'UTF-8')
			{
				$data = SimplePie_Misc::change_encoding($data, $encoding, 'UTF-8');
			}

			// Strip illegal characters
			$data = SimplePie_Misc::utf8_bad_replace($data);

			$parser =& new $this->parser_class();
			$parser->pre_process($data, 'UTF-8');
			// If we want the XML, just output that and quit
			if ($this->xml_dump)
			{
				header('Content-type: text/xml; charset=UTF-8');
				echo $data;
				exit;
			}
			// If it's parsed fine
			elseif ($parser->parse($data))
			{
				unset($data);
				$this->data = $parser->get_data();
				if (isset($this->data['child']))
				{
					if (isset($headers))
					{
						$this->data['headers'] = $headers;
					}
					$this->data['build'] = SIMPLEPIE_BUILD;

					// Cache the file if caching is enabled
					if ($cache && !$cache->save($this->data))
					{
						trigger_error("$cache->name is not writeable", E_USER_WARNING);
					}
					return true;
				}
				else
				{
					$this->error = "A feed could not be found at $this->feed_url";
					SimplePie_Misc::error($this->error, E_USER_NOTICE, __FILE__, __LINE__);
					return false;
				}
			}
			// If we have an error, just set SimplePie::error to it and quit
			else
			{
				$this->error = sprintf('XML error: %s at line %d, column %d', $parser->get_error_string(), $parser->get_current_line(), $parser->get_current_column());
				SimplePie_Misc::error($this->error, E_USER_NOTICE, __FILE__, __LINE__);
				return false;
			}
		}
		elseif (!empty($this->multifeed_url))
		{
			$i = 0;
			$success = 0;
			$this->multifeed_objects = array();
			foreach ($this->multifeed_url as $url)
			{
				if (SIMPLEPIE_PHP5)
				{
					// This keyword needs to defy coding standards for PHP4 compatibility
					$this->multifeed_objects[$i] = clone($this);
				}
				else
				{
					$this->multifeed_objects[$i] = $this;
				}
				$this->multifeed_objects[$i]->set_feed_url($url);
				$success |= $this->multifeed_objects[$i]->init();
				$i++;
			}
			return (bool) $success;
		}
		else
		{
			return false;
		}
	}

	/**
	 * Return the error message for the occured error
	 *
	 * @access public
	 * @return string Error message
	 */
	function error()
	{
		return $this->error;
	}

	function get_encoding()
	{
		return $this->sanitize->output_encoding;
	}

	function handle_content_type($mime = 'text/html')
	{
		if (!headers_sent())
		{
			$header = "Content-type: $mime;";
			if ($this->get_encoding())
			{
				$header .= ' charset=' . $this->get_encoding();
			}
			else
			{
				$header .= ' charset=UTF-8';
			}
			header($header);
		}
	}

	function get_type()
	{
		if (!isset($this->data['type']))
		{
			$this->data['type'] = SIMPLEPIE_TYPE_ALL;
			if (isset($this->data['child'][SIMPLEPIE_NAMESPACE_ATOM_10]['feed']))
			{
				$this->data['type'] &= SIMPLEPIE_TYPE_ATOM_10;
			}
			elseif (isset($this->data['child'][SIMPLEPIE_NAMESPACE_ATOM_03]['feed']))
			{
				$this->data['type'] &= SIMPLEPIE_TYPE_ATOM_03;
			}
			elseif (isset($this->data['child'][SIMPLEPIE_NAMESPACE_RDF]['RDF']))
			{
				if (isset($this->data['child'][SIMPLEPIE_NAMESPACE_RDF]['RDF'][0]['child'][SIMPLEPIE_NAMESPACE_RSS_10]['channel'])
				|| isset($this->data['child'][SIMPLEPIE_NAMESPACE_RDF]['RDF'][0]['child'][SIMPLEPIE_NAMESPACE_RSS_10]['image'])
				|| isset($this->data['child'][SIMPLEPIE_NAMESPACE_RDF]['RDF'][0]['child'][SIMPLEPIE_NAMESPACE_RSS_10]['item'])
				|| isset($this->data['child'][SIMPLEPIE_NAMESPACE_RDF]['RDF'][0]['child'][SIMPLEPIE_NAMESPACE_RSS_10]['textinput']))
				{
					$this->data['type'] &= SIMPLEPIE_TYPE_RSS_10;
				}
				if (isset($this->data['child'][SIMPLEPIE_NAMESPACE_RDF]['RDF'][0]['child'][SIMPLEPIE_NAMESPACE_RSS_090]['channel'])
				|| isset($this->data['child'][SIMPLEPIE_NAMESPACE_RDF]['RDF'][0]['child'][SIMPLEPIE_NAMESPACE_RSS_090]['image'])
				|| isset($this->data['child'][SIMPLEPIE_NAMESPACE_RDF]['RDF'][0]['child'][SIMPLEPIE_NAMESPACE_RSS_090]['item'])
				|| isset($this->data['child'][SIMPLEPIE_NAMESPACE_RDF]['RDF'][0]['child'][SIMPLEPIE_NAMESPACE_RSS_090]['textinput']))
				{
					$this->data['type'] &= SIMPLEPIE_TYPE_RSS_090;
				}
			}
			elseif (isset($this->data['child']['']['rss']))
			{
				$this->data['type'] &= SIMPLEPIE_TYPE_RSS_ALL;
				if (isset($this->data['child']['']['rss'][0]['attribs']['']['version']))
				{
					switch (trim($this->data['child']['']['rss'][0]['attribs']['']['version']))
					{
						case '0.91':
							$this->data['type'] &= SIMPLEPIE_TYPE_RSS_091;
							if (isset($this->data['child']['']['rss'][0]['child']['']['skiphours']['hour'][0]['data']))
							{
								switch (trim($this->data['child']['']['rss'][0]['child']['']['skiphours']['hour'][0]['data']))
								{
									case '0':
										$this->data['type'] &= SIMPLEPIE_TYPE_RSS_091_NETSCAPE;
										break;

									case '24':
										$this->data['type'] &= SIMPLEPIE_TYPE_RSS_091_USERLAND;
										break;
								}
							}
							break;

						case '0.92':
							$this->data['type'] &= SIMPLEPIE_TYPE_RSS_092;
							break;

						case '0.93':
							$this->data['type'] &= SIMPLEPIE_TYPE_RSS_093;
							break;

						case '0.94':
							$this->data['type'] &= SIMPLEPIE_TYPE_RSS_094;
							break;

						case '2.0':
							$this->data['type'] &= SIMPLEPIE_TYPE_RSS_20;
							break;
					}
				}
			}
			else
			{
				$this->data['type'] = SIMPLEPIE_TYPE_NONE;
			}
		}
		return $this->data['type'];
	}

	/**
	 * Returns the URL for the favicon of the feed's website.
	 *
	 * @access public
	 * @since 1.0
	 */
	function get_favicon()
	{
		if ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_ATOM_10, 'icon'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_IRI, $this->get_base($return[0]));
		}
		elseif (($url = $this->get_link()) !== null && preg_match('/^http(s)?:\/\//i', $url))
		{
			$favicon = SimplePie_Misc::absolutize_url('/favicon.ico', $url);

			if ($this->cache && $this->favicon_handler)
			{
				$cache =& new $this->cache_class($this->cache_location, call_user_func($this->cache_name_function, $favicon), 'spi');

				if ($cache->load())
				{
					return $this->sanitize($this->favicon_handler . rawurlencode($favicon), SIMPLEPIE_CONSTRUCT_IRI);
				}
				else
				{
					$file =& new $this->file_class($favicon, $this->timeout / 10, 5, array('X-FORWARDED-FOR' => $_SERVER['REMOTE_ADDR']), $this->useragent, $this->force_fsockopen, $this->proxy);

					if ($file->success && ($file->status_code == 200 || ($file->status_code > 206 && $file->status_code < 300)) && strlen($file->body) > 0)
					{
						if ($cache->save(array('headers' => $file->headers, 'body' => $file->body)))
						{
							return $this->sanitize($this->favicon_handler . rawurlencode($favicon), SIMPLEPIE_CONSTRUCT_IRI);
						}
						else
						{
							trigger_error("$cache->name is not writeable", E_USER_WARNING);
							return $this->sanitize($favicon, SIMPLEPIE_CONSTRUCT_IRI);
						}
					}
				}
			}
			else
			{
				return $this->sanitize($favicon, SIMPLEPIE_CONSTRUCT_IRI);
			}
		}
		return false;
	}

	/**
	 * @todo If we have a perm redirect we should return the new URL
	 * @todo When we make the above change, let's support <itunes:new-feed-url> as well
	 * @todo Also, |atom:link|@rel=self
	 */
	function subscribe_url()
	{
		if ($this->feed_url !== null)
		{
			return $this->sanitize($this->feed_url, SIMPLEPIE_CONSTRUCT_IRI);
		}
		else
		{
			return null;
		}
	}

	function subscribe_feed()
	{
		if ($this->feed_url !== null)
		{
			return $this->sanitize(SimplePie_Misc::fix_protocol($this->feed_url, 2), SIMPLEPIE_CONSTRUCT_IRI);
		}
		else
		{
			return null;
		}
	}

	function subscribe_outlook()
	{
		if ($this->feed_url !== null)
		{
			return 'outlook' . $this->sanitize(SimplePie_Misc::fix_protocol($this->feed_url, 2), SIMPLEPIE_CONSTRUCT_IRI);
		}
		else
		{
			return null;
		}
	}

	function subscribe_podcast()
	{
		if ($this->feed_url !== null)
		{
			return $this->sanitize(SimplePie_Misc::fix_protocol($this->feed_url, 3), SIMPLEPIE_CONSTRUCT_IRI);
		}
		else
		{
			return null;
		}
	}

	function subscribe_itunes()
	{
		if ($this->feed_url !== null)
		{
			return $this->sanitize(SimplePie_Misc::fix_protocol($this->feed_url, 4), SIMPLEPIE_CONSTRUCT_IRI);
		}
		else
		{
			return null;
		}
	}

	/**
	 * Creates the subscribe_* methods' return data
	 *
	 * @access private
	 * @param string $feed_url String to prefix to the feed URL
	 * @param string $site_url String to prefix to the site URL (and
	 * suffix to the feed URL)
	 * @return mixed URL if feed exists, false otherwise
	 */
	function subscribe_service($feed_url, $site_url = null)
	{
		if ($this->subscribe_url())
		{
			$return = $this->sanitize($feed_url, SIMPLEPIE_CONSTRUCT_IRI) . rawurlencode($this->subscribe_url());
			if ($site_url !== null && $this->get_link() !== null)
			{
				$return .= $this->sanitize($site_url, SIMPLEPIE_CONSTRUCT_IRI) . rawurlencode($this->get_link());
			}
			return $return;
		}
		else
		{
			return null;
		}
	}

	function subscribe_aol()
	{
		return $this->subscribe_service('http://feeds.my.aol.com/add.jsp?url=');
	}

	function subscribe_bloglines()
	{
		return urldecode($this->subscribe_service('http://www.bloglines.com/sub/'));
	}

	function subscribe_eskobo()
	{
		return $this->subscribe_service('http://www.eskobo.com/?AddToMyPage=');
	}

	function subscribe_feedfeeds()
	{
		return $this->subscribe_service('http://www.feedfeeds.com/add?feed=');
	}

	function subscribe_feedster()
	{
		return $this->subscribe_service('http://www.feedster.com/myfeedster.php?action=addrss&confirm=no&rssurl=');
	}

	function subscribe_google()
	{
		return $this->subscribe_service('http://fusion.google.com/add?feedurl=');
	}

	function subscribe_gritwire()
	{
		return $this->subscribe_service('http://my.gritwire.com/feeds/addExternalFeed.aspx?FeedUrl=');
	}

	function subscribe_msn()
	{
		return $this->subscribe_service('http://my.msn.com/addtomymsn.armx?id=rss&ut=', '&ru=');
	}

	function subscribe_netvibes()
	{
		return $this->subscribe_service('http://www.netvibes.com/subscribe.php?url=');
	}

	function subscribe_newsburst()
	{
		return $this->subscribe_service('http://www.newsburst.com/Source/?add=');
	}

	function subscribe_newsgator()
	{
		return $this->subscribe_service('http://www.newsgator.com/ngs/subscriber/subext.aspx?url=');
	}

	function subscribe_odeo()
	{
		return $this->subscribe_service('http://www.odeo.com/listen/subscribe?feed=');
	}

	function subscribe_podnova()
	{
		return $this->subscribe_service('http://www.podnova.com/index_your_podcasts.srf?action=add&url=');
	}

	function subscribe_rojo()
	{
		return $this->subscribe_service('http://www.rojo.com/add-subscription?resource=');
	}

	function subscribe_yahoo()
	{
		return $this->subscribe_service('http://add.my.yahoo.com/rss?url=');
	}

	function get_feed_tags($namespace, $tag)
	{
		$type = $this->get_type();
		if ($type & SIMPLEPIE_TYPE_ATOM_10)
		{
			if (isset($this->data['child'][SIMPLEPIE_NAMESPACE_ATOM_10]['feed'][0]['child'][$namespace][$tag]))
			{
				return $this->data['child'][SIMPLEPIE_NAMESPACE_ATOM_10]['feed'][0]['child'][$namespace][$tag];
			}
		}
		if ($type & SIMPLEPIE_TYPE_ATOM_03)
		{
			if (isset($this->data['child'][SIMPLEPIE_NAMESPACE_ATOM_03]['feed'][0]['child'][$namespace][$tag]))
			{
				return $this->data['child'][SIMPLEPIE_NAMESPACE_ATOM_03]['feed'][0]['child'][$namespace][$tag];
			}
		}
		if ($type & SIMPLEPIE_TYPE_RSS_RDF)
		{
			if (isset($this->data['child'][SIMPLEPIE_NAMESPACE_RDF]['RDF'][0]['child'][$namespace][$tag]))
			{
				return $this->data['child'][SIMPLEPIE_NAMESPACE_RDF]['RDF'][0]['child'][$namespace][$tag];
			}
		}
		if ($type & SIMPLEPIE_TYPE_RSS_SYNDICATION)
		{
			if (isset($this->data['child']['']['rss'][0]['child'][$namespace][$tag]))
			{
				return $this->data['child']['']['rss'][0]['child'][$namespace][$tag];
			}
		}
		return null;
	}

	function get_channel_tags($namespace, $tag)
	{
		$type = $this->get_type();
		if ($type & SIMPLEPIE_TYPE_ATOM_ALL)
		{
			if ($return = $this->get_feed_tags($namespace, $tag))
			{
				return $return;
			}
		}
		if ($type & SIMPLEPIE_TYPE_RSS_10)
		{
			if ($channel = $this->get_feed_tags(SIMPLEPIE_NAMESPACE_RSS_10, 'channel'))
			{
				if (isset($channel[0]['child'][$namespace][$tag]))
				{
					return $channel[0]['child'][$namespace][$tag];
				}
			}
		}
		if ($type & SIMPLEPIE_TYPE_RSS_090)
		{
			if ($channel = $this->get_feed_tags(SIMPLEPIE_NAMESPACE_RSS_090, 'channel'))
			{
				if (isset($channel[0]['child'][$namespace][$tag]))
				{
					return $channel[0]['child'][$namespace][$tag];
				}
			}
		}
		if ($type & SIMPLEPIE_TYPE_RSS_SYNDICATION)
		{
			if ($channel = $this->get_feed_tags('', 'channel'))
			{
				if (isset($channel[0]['child'][$namespace][$tag]))
				{
					return $channel[0]['child'][$namespace][$tag];
				}
			}
		}
		return null;
	}

	function get_image_tags($namespace, $tag)
	{
		$type = $this->get_type();
		if ($type & SIMPLEPIE_TYPE_RSS_10)
		{
			if ($image = $this->get_feed_tags(SIMPLEPIE_NAMESPACE_RSS_10, 'image'))
			{
				if (isset($image[0]['child'][$namespace][$tag]))
				{
					return $image[0]['child'][$namespace][$tag];
				}
			}
		}
		if ($type & SIMPLEPIE_TYPE_RSS_090)
		{
			if ($image = $this->get_feed_tags(SIMPLEPIE_NAMESPACE_RSS_090, 'image'))
			{
				if (isset($image[0]['child'][$namespace][$tag]))
				{
					return $image[0]['child'][$namespace][$tag];
				}
			}
		}
		if ($type & SIMPLEPIE_TYPE_RSS_SYNDICATION)
		{
			if ($image = $this->get_channel_tags('', 'image'))
			{
				if (isset($image[0]['child'][$namespace][$tag]))
				{
					return $image[0]['child'][$namespace][$tag];
				}
			}
		}
		return null;
	}

	function get_base($element = array())
	{
		if (!($this->get_type() & SIMPLEPIE_TYPE_RSS_SYNDICATION) && !empty($element['xml_base_explicit']) && isset($element['xml_base']))
		{
			return $element['xml_base'];
		}
		elseif ($this->get_link() !== null)
		{
			return $this->get_link();
		}
		elseif (isset($this->data['headers']['content-location']))
		{
			return SimplePie_Misc::absolutize_url($this->data['headers']['content-location'], $this->subscribe_url());
		}
		else
		{
			return $this->subscribe_url();
		}
	}

	function sanitize($data, $type, $base = '')
	{
		return $this->sanitize->sanitize($data, $type, $base);
	}

	function get_title()
	{
		if ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_ATOM_10, 'title'))
		{
			return $this->sanitize($return[0]['data'], SimplePie_Misc::atom_10_construct_type($return[0]['attribs']), $this->get_base($return[0]));
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_ATOM_03, 'title'))
		{
			return $this->sanitize($return[0]['data'], SimplePie_Misc::atom_03_construct_type($return[0]['attribs']), $this->get_base($return[0]));
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_RSS_10, 'title'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_MAYBE_HTML, $this->get_base($return[0]));
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_RSS_090, 'title'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_MAYBE_HTML, $this->get_base($return[0]));
		}
		elseif ($return = $this->get_channel_tags('', 'title'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_MAYBE_HTML, $this->get_base($return[0]));
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_DC_11, 'title'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_DC_10, 'title'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		else
		{
			return null;
		}
	}

	function get_link($key = 0, $rel = 'alternate')
	{
		$links = $this->get_links($rel);
		if (isset($links[$key]))
		{
			return $links[$key];
		}
		else
		{
			return null;
		}
	}

	/**
	 * Added for parity between the parent-level and the item/entry-level.
	 */
	function get_permalink()
	{
		return $this->get_link(0);
	}

	function get_links($rel = 'alternate')
	{
		if (!isset($this->data['links']))
		{
			$this->data['links'] = array();
			if ($links = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_ATOM_10, 'link'))
			{
				foreach ($links as $link)
				{
					if (isset($link['attribs']['']['href']))
					{
						$link_rel = (isset($link['attribs']['']['rel'])) ? $link['attribs']['']['rel'] : 'alternate';
						$this->data['links'][$link_rel][] = $this->sanitize($link['attribs']['']['href'], SIMPLEPIE_CONSTRUCT_IRI, $this->get_base($link));
					}
				}
			}
			if ($links = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_ATOM_03, 'link'))
			{
				foreach ($links as $link)
				{
					if (isset($link['attribs']['']['href']))
					{
						$link_rel = (isset($link['attribs']['']['rel'])) ? $link['attribs']['']['rel'] : 'alternate';
						$this->data['links'][$link_rel][] = $this->sanitize($link['attribs']['']['href'], SIMPLEPIE_CONSTRUCT_IRI, $this->get_base($link));

					}
				}
			}
			if ($links = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_RSS_10, 'link'))
			{
				$this->data['links']['alternate'][] = $this->sanitize($links[0]['data'], SIMPLEPIE_CONSTRUCT_IRI, $this->get_base($links[0]));
			}
			if ($links = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_RSS_090, 'link'))
			{
				$this->data['links']['alternate'][] = $this->sanitize($links[0]['data'], SIMPLEPIE_CONSTRUCT_IRI, $this->get_base($links[0]));
			}
			if ($links = $this->get_channel_tags('', 'link'))
			{
				$this->data['links']['alternate'][] = $this->sanitize($links[0]['data'], SIMPLEPIE_CONSTRUCT_IRI, $this->get_base($links[0]));
			}

			$keys = array_keys($this->data['links']);
			foreach ($keys as $key)
			{
				if (SimplePie_Misc::is_isegment_nz_nc($key))
				{
					if (isset($this->data['links'][SIMPLEPIE_IANA_LINK_RELATIONS_REGISTRY . $key]))
					{
						$this->data['links'][SIMPLEPIE_IANA_LINK_RELATIONS_REGISTRY . $key] = array_merge($this->data['links'][$key], $this->data['links'][SIMPLEPIE_IANA_LINK_RELATIONS_REGISTRY . $key]);
						$this->data['links'][$key] =& $this->data['links'][SIMPLEPIE_IANA_LINK_RELATIONS_REGISTRY . $key];
					}
					else
					{
						$this->data['links'][SIMPLEPIE_IANA_LINK_RELATIONS_REGISTRY . $key] =& $this->data['links'][$key];
					}
				}
				elseif (substr($key, 0, 41) == SIMPLEPIE_IANA_LINK_RELATIONS_REGISTRY)
				{
					$this->data['links'][substr($key, 41)] =& $this->data['links'][$key];
				}
				$this->data['links'][$key] = array_unique($this->data['links'][$key]);
			}
		}

		if (isset($this->data['links'][$rel]))
		{
			return $this->data['links'][$rel];
		}
		else
		{
			return null;
		}
	}

	function get_description()
	{
		if ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_ATOM_10, 'subtitle'))
		{
			return $this->sanitize($return[0]['data'], SimplePie_Misc::atom_10_construct_type($return[0]['attribs']), $this->get_base($return[0]));
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_ATOM_03, 'tagline'))
		{
			return $this->sanitize($return[0]['data'], SimplePie_Misc::atom_03_construct_type($return[0]['attribs']), $this->get_base($return[0]));
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_RSS_10, 'description'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_MAYBE_HTML, $this->get_base($return[0]));
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_RSS_090, 'description'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_MAYBE_HTML, $this->get_base($return[0]));
		}
		elseif ($return = $this->get_channel_tags('', 'description'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_MAYBE_HTML, $this->get_base($return[0]));
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_DC_11, 'description'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_DC_10, 'description'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_ITUNES, 'summary'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_HTML, $this->get_base($return[0]));
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_ITUNES, 'subtitle'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_HTML, $this->get_base($return[0]));
		}
		else
		{
			return null;
		}
	}

	function get_copyright()
	{
		if ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_ATOM_10, 'rights'))
		{
			return $this->sanitize($return[0]['data'], SimplePie_Misc::atom_10_construct_type($return[0]['attribs']), $this->get_base($return[0]));
		}
		elseif ($return = $this->get_channel_tags('', 'copyright'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_DC_11, 'rights'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_DC_10, 'rights'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		else
		{
			return null;
		}
	}

	function get_language()
	{
		if ($return = $this->get_channel_tags('', 'language'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_DC_11, 'language'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_DC_10, 'language'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif (isset($this->data['child'][SIMPLEPIE_NAMESPACE_ATOM_10]['feed'][0]['xml_lang']))
		{
			return $this->sanitize($this->data['child'][SIMPLEPIE_NAMESPACE_ATOM_10]['feed'][0]['xml_lang'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif (isset($this->data['child'][SIMPLEPIE_NAMESPACE_ATOM_03]['feed'][0]['xml_lang']))
		{
			return $this->sanitize($this->data['child'][SIMPLEPIE_NAMESPACE_ATOM_03]['feed'][0]['xml_lang'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif (isset($this->data['child'][SIMPLEPIE_NAMESPACE_RDF]['RDF'][0]['xml_lang']))
		{
			return $this->sanitize($this->data['child'][SIMPLEPIE_NAMESPACE_RDF]['RDF'][0]['xml_lang'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif (isset($this->data['headers']['content-language']))
		{
			return $this->sanitize($this->data['headers']['content-language'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		else
		{
			return null;
		}
	}

	function get_latitude()
	{
		if ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_W3C_BASIC_GEO, 'lat'))
		{
			return (float) $return[0]['data'];
		}
		elseif (($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_GEORSS, 'point')) && preg_match('/^((?:-)?[0-9]+(?:\.[0-9]+)) ((?:-)?[0-9]+(?:\.[0-9]+))$/', $return[0]['data'], $match))
		{
			return (float) $match[1];
		}
		else
		{
			return null;
		}
	}

	function get_longitude()
	{
		if ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_W3C_BASIC_GEO, 'long'))
		{
			return (float) $return[0]['data'];
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_W3C_BASIC_GEO, 'lon'))
		{
			return (float) $return[0]['data'];
		}
		elseif (($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_GEORSS, 'point')) && preg_match('/^((?:-)?[0-9]+(?:\.[0-9]+)) ((?:-)?[0-9]+(?:\.[0-9]+))$/', $return[0]['data'], $match))
		{
			return (float) $match[2];
		}
		else
		{
			return null;
		}
	}

	function get_image_title()
	{
		if ($return = $this->get_image_tags(SIMPLEPIE_NAMESPACE_RSS_10, 'title'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif ($return = $this->get_image_tags(SIMPLEPIE_NAMESPACE_RSS_090, 'title'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif ($return = $this->get_image_tags('', 'title'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif ($return = $this->get_image_tags(SIMPLEPIE_NAMESPACE_DC_11, 'title'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		elseif ($return = $this->get_image_tags(SIMPLEPIE_NAMESPACE_DC_10, 'title'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_TEXT);
		}
		else
		{
			return null;
		}
	}

	function get_image_url()
	{
		if ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_ITUNES, 'image'))
		{
			return $this->sanitize($return[0]['attribs']['']['href'], SIMPLEPIE_CONSTRUCT_IRI);
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_ATOM_10, 'logo'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_IRI, $this->get_base($return[0]));
		}
		elseif ($return = $this->get_channel_tags(SIMPLEPIE_NAMESPACE_ATOM_10, 'icon'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_IRI, $this->get_base($return[0]));
		}
		elseif ($return = $this->get_image_tags(SIMPLEPIE_NAMESPACE_RSS_10, 'url'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_IRI, $this->get_base($return[0]));
		}
		elseif ($return = $this->get_image_tags(SIMPLEPIE_NAMESPACE_RSS_090, 'url'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_IRI, $this->get_base($return[0]));
		}
		elseif ($return = $this->get_image_tags('', 'url'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_IRI, $this->get_base($return[0]));
		}
		else
		{
			return null;
		}
	}

	function get_image_link()
	{
		if ($return = $this->get_image_tags(SIMPLEPIE_NAMESPACE_RSS_10, 'link'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_IRI, $this->get_base($return[0]));
		}
		elseif ($return = $this->get_image_tags(SIMPLEPIE_NAMESPACE_RSS_090, 'link'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_IRI, $this->get_base($return[0]));
		}
		elseif ($return = $this->get_image_tags('', 'link'))
		{
			return $this->sanitize($return[0]['data'], SIMPLEPIE_CONSTRUCT_IRI, $this->get_base($return[0]));
		}
		else
		{
			return null;
		}
	}

	function get_image_width()
	{
		if ($return = $this->get_image_tags('', 'width'))
		{
			return round($return[0]['data']);
		}
		elseif ($this->get_type() & SIMPLEPIE_TYPE_RSS_SYNDICATION && $this->get_image_tags('', 'url'))
		{
			return 88.0;
		}
		else
		{
			return null;
		}
	}

	function get_image_height()
	{
		if ($return = $this->get_image_tags('', 'height'))
		{
			return round($return[0]['data']);
		}
		elseif ($this->get_type() & SIMPLEPIE_TYPE_RSS_SYNDICATION && $this->get_image_tags('', 'url'))
		{
			return 31.0;
		}
		else
		{
			return null;
		}
	}

	function get_item_quantity($max = 0)
	{
		$qty = count($this->get_items());
		if ($max == 0)
		{
			return $qty;
		}
		else
		{
			return ($qty > $max) ? $max : $qty;
		}
	}

	function get_item($key = 0)
	{
		$items = $this->get_items();
		if (isset($items[$key]))
		{
			return $items[$key];
		}
		else
		{
			return null;
		}
	}

	function get_items($start = 0, $end = 0)
	{
		if (!empty($this->multifeed_objects))
		{
			return SimplePie::merge_items($this->multifeed_objects, $start, $end);
		}
		elseif (!isset($this->data['items']))
		{
			if ($items = $this->get_feed_tags(SIMPLEPIE_NAMESPACE_ATOM_10, 'entry'))
			{
				$keys = array_keys($items);
				foreach ($keys as $key)
				{
					$this->data['items'][] =& new $this->item_class($this, $items[$key]);
				}
			}
			if ($items = $this->get_feed_tags(SIMPLEPIE_NAMESPACE_ATOM_03, 'entry'))
			{
				$keys = array_keys($items);
				foreach ($keys as $key)
				{
					$this->data['items'][] =& new $this->item_class($this, $items[$key]);
				}
			}
			if ($items = $this->get_feed_tags(SIMPLEPIE_NAMESPACE_RSS_10, 'item'))
			{
				$keys = array_keys($items);
				foreach ($keys as $key)
				{
					$this->data['items'][] =& new $this->item_class($this, $items[$key]);
				}
			}
			if ($items = $this->get_feed_tags(SIMPLEPIE_NAMESPACE_RSS_090, 'item'))
			{
				$keys = array_keys($items);
				foreach ($keys as $key)
				{
					$this->data['items'][] =& new $this->item_class($this, $items[$key]);
				}
			}
			if ($items = $this->get_channel_tags('', 'item'))
			{
				$keys = array_keys($items);
				foreach ($keys as $key)
				{
					$this->data['items'][] =& new $this->item_class($this, $items[$key]);
				}
			}
		}

		if (!empty($this->data['items']))
		{
			// If we want to order it by date, check if all items have a date, and then sort it
			if ($this->order_by_date)
			{
				if (!isset($this->data['ordered_items']))
				{
					$do_sort = true;
					foreach ($this->data['items'] as $item)
					{
						if (!$item->get_date('U'))
						{
							$do_sort = false;
							break;
						}
					}
					$item = null;
					$this->data['ordered_items'] = $this->data['items'];
					if ($do_sort)
					{
						usort($this->data['ordered_items'], array(&$this, 'sort_items'));
					}
				}
				$items = $this->data['ordered_items'];
			}
			else
			{
				$items = $this->data['items'];
			}

			// Slice the data as desired
			if ($end == 0)
			{
				return array_slice($items, $start);
			}
			else
			{
				return array_slice($items, $start, $end);
			}
		}
		else
		{
			return array();
		}
	}

	function sort_items($a, $b)
	{
		return $a->get_date('U') <= $b->get_date('U');
	}

	function merge_items($urls, $start = 0, $end = 0)
	{
		if (is_array($urls) && sizeof($urls) > 0)
		{
			$items = array();
			foreach ($urls as $arg)
			{
				if (SimplePie_Misc::is_a($arg, 'SimplePie'))
				{
					$items = array_merge($items, $arg->get_items());
				}
				else
				{
					trigger_error('Arguments must be SimplePie objects', E_USER_WARNING);
				}
			}

			$do_sort = true;
			foreach ($items as $item)
			{
				if (!$item->get_date('U'))
				{
					$do_sort = false;
					break;
				}
			}
			$item = null;
			if ($do_sort)
			{
				usort($items, array('SimplePie', 'sort_items'));
			}

			if ($end == 0)
			{
				return array_slice($items, $start);
			}
			else
			{
				return array_slice($items, $start, $end);
			}
		}
		else
		{
			trigger_error('Cannot merge zero SimplePie objects', E_USER_WARNING);
			return array();
		}
	}
}
