<?php

/**
 * @todo Move to using an actual HTML parser (this will allow tags to be properly stripped, and to switch between HTML and XHTML), this will also make it easier to shortern a string while preserving HTML tags
 */
class SimplePie_Sanitize
{
	// Private vars
	var $base;

	// Options
	var $remove_div = true;
	var $image_handler = '';
	var $strip_htmltags = array('base', 'blink', 'body', 'doctype', 'embed', 'font', 'form', 'frame', 'frameset', 'html', 'iframe', 'input', 'marquee', 'meta', 'noscript', 'object', 'param', 'script', 'style');
	var $encode_instead_of_strip = false;
	var $strip_attributes = array('bgsound', 'class', 'expr', 'id', 'style', 'onclick', 'onerror', 'onfinish', 'onmouseover', 'onmouseout', 'onfocus', 'onblur', 'lowsrc', 'dynsrc');
	var $strip_comments = false;
	var $output_encoding = 'UTF-8';
	var $enable_cache = true;
	var $cache_location = './cache';
	var $cache_name_function = 'md5';
	var $cache_class = 'SimplePie_Cache';
	var $file_class = 'SimplePie_File';
	var $timeout = 10;
	var $useragent = '';
	var $force_fsockopen = false;
	var $proxy = "";

	var $replace_url_attributes = array(
		'a' => 'href',
		'area' => 'href',
		'blockquote' => 'cite',
		'del' => 'cite',
		'form' => 'action',
		'img' => array('longdesc', 'src'),
		'input' => 'src',
		'ins' => 'cite',
		'q' => 'cite'
	);

	function remove_div($enable = true)
	{
		$this->remove_div = (bool) $enable;
	}

	function set_image_handler($page = false)
	{
		if ($page)
		{
			$this->image_handler = (string) $page;
		}
		else
		{
			$this->image_handler = false;
		}
	}

	function pass_cache_data($enable_cache = true, $cache_location = './cache', $cache_name_function = 'md5', $cache_class = 'SimplePie_Cache')
	{
		if (isset($enable_cache))
		{
			$this->enable_cache = (bool) $enable_cache;
		}

		if ($cache_location)
		{
			$this->cache_location = (string) $cache_location;
		}

		if ($cache_name_function)
		{
			$this->cache_name_function = (string) $cache_name_function;
		}

		if ($cache_class)
		{
			$this->cache_class = (string) $cache_class;
		}
	}

	function pass_file_data($file_class = 'SimplePie_File', $timeout = 10, $useragent = '', $force_fsockopen = false)
	{
		if ($file_class)
		{
			$this->file_class = (string) $file_class;
		}

		if ($timeout)
		{
			$this->timeout = (string) $timeout;
		}

		if ($useragent)
		{
			$this->useragent = (string) $useragent;
		}

		if ($force_fsockopen)
		{
			$this->force_fsockopen = (string) $force_fsockopen;
		}
	}

	function strip_htmltags($tags = array('base', 'blink', 'body', 'doctype', 'embed', 'font', 'form', 'frame', 'frameset', 'html', 'iframe', 'input', 'marquee', 'meta', 'noscript', 'object', 'param', 'script', 'style'))
	{
		if ($tags)
		{
			if (is_array($tags))
			{
				$this->strip_htmltags = $tags;
			}
			else
			{
				$this->strip_htmltags = explode(',', $tags);
			}
		}
		else
		{
			$this->strip_htmltags = false;
		}
	}

	function encode_instead_of_strip($encode = false)
	{
		$this->encode_instead_of_strip = (bool) $encode;
	}

	function strip_attributes($attribs = array('bgsound', 'class', 'expr', 'id', 'style', 'onclick', 'onerror', 'onfinish', 'onmouseover', 'onmouseout', 'onfocus', 'onblur', 'lowsrc', 'dynsrc'))
	{
		if ($attribs)
		{
			if (is_array($attribs))
			{
				$this->strip_attributes = $attribs;
			}
			else
			{
				$this->strip_attributes = explode(',', $attribs);
			}
		}
		else
		{
			$this->strip_attributes = false;
		}
	}

	function strip_comments($strip = false)
	{
		$this->strip_comments = (bool) $strip;
	}

	function set_output_encoding($encoding = 'UTF-8')
	{
		$this->output_encoding = (string) $encoding;
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
		$this->replace_url_attributes = (array) $element_attribute;
	}

	function sanitize($data, $type, $base = '')
	{
		$data = trim($data);
		if ($data !== '' || $type & SIMPLEPIE_CONSTRUCT_IRI)
		{
			if ($type & SIMPLEPIE_CONSTRUCT_MAYBE_HTML)
			{
				if (preg_match('/(&(#(x[0-9a-fA-F]+|[0-9]+)|[a-zA-Z0-9]+)|<\/(\w+)' . SIMPLEPIE_PCRE_HTML_ATTRIBUTE . '>)/', $data))
				{
					$type |= SIMPLEPIE_CONSTRUCT_HTML;
				}
				else
				{
					$type |= SIMPLEPIE_CONSTRUCT_TEXT;
				}
			}

			if ($type & SIMPLEPIE_CONSTRUCT_BASE64)
			{
				$data = base64_decode($data);
			}

			if ($type & SIMPLEPIE_CONSTRUCT_XHTML)
			{
				if ($this->remove_div)
				{
					$data = preg_replace('/^<div' . SIMPLEPIE_PCRE_XML_ATTRIBUTE . '>/', '', $data);
					$data = preg_replace('/<\/div>$/', '', $data);
				}
				else
				{
					$data = preg_replace('/^<div' . SIMPLEPIE_PCRE_XML_ATTRIBUTE . '>/', '<div>', $data);
				}
			}

			if ($type & (SIMPLEPIE_CONSTRUCT_HTML | SIMPLEPIE_CONSTRUCT_XHTML))
			{
				// Strip comments
				if ($this->strip_comments)
				{
					$data = SimplePie_Misc::strip_comments($data);
				}

				// Strip out HTML tags and attributes that might cause various security problems.
				// Based on recommendations by Mark Pilgrim at:
				// http://diveintomark.org/archives/2003/06/12/how_to_consume_rss_safely
				if ($this->strip_htmltags)
				{
					foreach ($this->strip_htmltags as $tag)
					{
						$pcre = "/<($tag)" . SIMPLEPIE_PCRE_HTML_ATTRIBUTE . "(>(.*)<\/$tag" . SIMPLEPIE_PCRE_HTML_ATTRIBUTE . '>|(\/)?>)/siU';
						while (preg_match($pcre, $data))
						{
							$data = preg_replace_callback($pcre, array(&$this, 'do_strip_htmltags'), $data);
						}
					}
				}

				if ($this->strip_attributes)
				{
					foreach ($this->strip_attributes as $attrib)
					{
						$data = preg_replace('/ '. trim($attrib) .'=("|&quot;)(\w|\s|=|-|:|;|\/|\.|\?|&|,|#|!|\(|\)|\'|&apos;|<|>|\+|{|})*("|&quot;)/i', '', $data);
						$data = preg_replace('/ '. trim($attrib) .'=(\'|&apos;)(\w|\s|=|-|:|;|\/|\.|\?|&|,|#|!|\(|\)|"|&quot;|<|>|\+|{|})*(\'|&apos;)/i', '', $data);
						$data = preg_replace('/ '. trim($attrib) .'=(\w|\s|=|-|:|;|\/|\.|\?|&|,|#|!|\(|\)|\+|{|})*/i', '', $data);
					}
				}

				// Replace relative URLs
				$this->base = $base;
				foreach ($this->replace_url_attributes as $element => $attributes)
				{
					$data = $this->replace_urls($data, $element, $attributes);
				}

				// If image handling (caching, etc.) is enabled, cache and rewrite all the image tags.
				if (isset($this->image_handler) && ((string) $this->image_handler) !== '' && $this->enable_cache)
				{
					$images = SimplePie_Misc::get_element('img', $data);
					foreach ($images as $img)
					{
						if (isset($img['attribs']['src']['data']))
						{
							$image_url = $img['attribs']['src']['data'];
							$cache =& new $this->cache_class($this->cache_location, call_user_func($this->cache_name_function, $image_url), 'spi');

							if ($cache->load())
							{
								$img['attribs']['src']['data'] = $this->image_handler . rawurlencode($img['attribs']['src']['data']);
								$data = str_replace($img['full'], SimplePie_Misc::element_implode($img), $data);
							}
							else
							{
								$file =& new $this->file_class($image_url, $this->timeout, 5, array('X-FORWARDED-FOR' => $_SERVER['REMOTE_ADDR']), $this->useragent, $this->force_fsockopen, $this->proxy);
								$headers = $file->headers;

								if ($file->success && ($file->status_code == 200 || ($file->status_code > 206 && $file->status_code < 300)))
								{
									if (!$cache->save(array('headers' => $file->headers, 'body' => $file->body)))
									{
										trigger_error("$cache->name is not writeable", E_USER_WARNING);
									}
									$img['attribs']['src']['data'] = $this->image_handler . rawurlencode($img['attribs']['src']['data']);
									$data = str_replace($img['full'], SimplePie_Misc::element_implode($img), $data);
								}
							}
						}
					}
				}

				// Having (possibly) taken stuff out, there may now be whitespace at the beginning/end of the data
				$data = trim($data);
			}

			if ($type & SIMPLEPIE_CONSTRUCT_IRI)
			{
				$data = SimplePie_Misc::absolutize_url($data, $base);
			}

			if ($type & (SIMPLEPIE_CONSTRUCT_TEXT | SIMPLEPIE_CONSTRUCT_IRI))
			{
				$data = htmlspecialchars($data, ENT_COMPAT, 'UTF-8');
			}

			if ($this->output_encoding != 'UTF-8')
			{
				$data = SimplePie_Misc::change_encoding($data, 'UTF-8', $this->output_encoding);
			}
		}
		return $data;
	}

	function replace_urls($data, $tag, $attributes)
	{
		if (!is_array($this->strip_htmltags) || !in_array($tag, $this->strip_htmltags))
		{
			$elements = SimplePie_Misc::get_element($tag, $data);
			foreach ($elements as $element)
			{
				if (is_array($attributes))
				{
					foreach ($attributes as $attribute)
					{
						if (isset($element['attribs'][$attribute]['data']))
						{
							$element['attribs'][$attribute]['data'] = SimplePie_Misc::absolutize_url($element['attribs'][$attribute]['data'], $this->base);
							$data = str_replace($element['full'], SimplePie_Misc::element_implode($element), $data);
						}
					}
				}
				elseif (isset($element['attribs'][$attributes]['data']))
				{
					$element['attribs'][$attributes]['data'] = SimplePie_Misc::absolutize_url($element['attribs'][$attributes]['data'], $this->base);
					$data = str_replace($element['full'], SimplePie_Misc::element_implode($element), $data);
				}
			}
		}
		return $data;
	}

	function do_strip_htmltags($match)
	{
		if ($this->encode_instead_of_strip)
		{
			if (isset($match[4]) && !in_array(strtolower($match[1]), array('script', 'style')))
			{
				$match[1] = htmlspecialchars($match[1], ENT_COMPAT, 'UTF-8');
				$match[2] = htmlspecialchars($match[2], ENT_COMPAT, 'UTF-8');
				return "&lt;$match[1]$match[2]&gt;$match[3]&lt;/$match[1]&gt;";
			}
			else
			{
				return htmlspecialchars($match[0], ENT_COMPAT, 'UTF-8');
			}
		}
		elseif (isset($match[4]) && !in_array(strtolower($match[1]), array('script', 'style')))
		{
			return $match[4];
		}
		else
		{
			return '';
		}
	}
}
