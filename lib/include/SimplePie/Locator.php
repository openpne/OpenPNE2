<?php

class SimplePie_Locator
{
	var $useragent;
	var $timeout;
	var $file;
	var $local = array();
	var $elsewhere = array();
	var $file_class = 'SimplePie_File';
	var $cached_entities = array();
	var $http_base;
	var $base;
	var $base_location = 0;
	var $checked_feeds = 0;
	var $max_checked_feeds = 10;
	var $proxy;

	function SimplePie_Locator(&$file, $timeout = 10, $useragent = null, $file_class = 'SimplePie_File', $max_checked_feeds = 10, $proxy = "")
	{
		$this->file =& $file;
		$this->file_class = $file_class;
		$this->useragent = $useragent;
		$this->timeout = $timeout;
		$this->max_checked_feeds = $max_checked_feeds;
		$this->proxy = $proxy;
	}

	function find($type = SIMPLEPIE_LOCATOR_ALL)
	{
		if ($this->is_feed($this->file))
		{
			return $this->file;
		}

		if ($type & ~SIMPLEPIE_LOCATOR_NONE)
		{
			$this->get_base();
		}

		if ($type & SIMPLEPIE_LOCATOR_AUTODISCOVERY && $working = $this->autodiscovery())
		{
			return $working;
		}

		if ($type & (SIMPLEPIE_LOCATOR_LOCAL_EXTENSION | SIMPLEPIE_LOCATOR_LOCAL_BODY | SIMPLEPIE_LOCATOR_REMOTE_EXTENSION | SIMPLEPIE_LOCATOR_REMOTE_BODY) && $this->get_links())
		{
			if ($type & SIMPLEPIE_LOCATOR_LOCAL_EXTENSION && $working = $this->extension($this->local))
			{
				return $working;
			}

			if ($type & SIMPLEPIE_LOCATOR_LOCAL_BODY && $working = $this->body($this->local))
			{
				return $working;
			}

			if ($type & SIMPLEPIE_LOCATOR_REMOTE_EXTENSION && $working = $this->extension($this->elsewhere))
			{
				return $working;
			}

			if ($type & SIMPLEPIE_LOCATOR_REMOTE_BODY && $working = $this->body($this->elsewhere))
			{
				return $working;
			}
		}
		return null;
	}

	function is_feed(&$file)
	{
		$body = SimplePie_Misc::strip_comments($file->body);
		if (preg_match('/<([^\s:]+:)?(rss|RDF|feed)' . SIMPLEPIE_PCRE_XML_ATTRIBUTE . '>/i', $body))
		{
			return true;
		}
		return false;
	}

	function get_base()
	{
		if (isset($this->file->headers['content-location']))
		{
			$this->http_base = SimplePie_Misc::absolutize_url(trim($this->file->headers['content-location']), $this->file->url);
		}
		else
		{
			$this->http_base = $this->file->url;
		}
		$this->base = $this->http_base;
		$elements = SimplePie_Misc::get_element('base', $this->file->body);
		foreach ($elements as $element)
		{
			if ($element['attribs']['href']['data'] !== '')
			{
				$this->base = SimplePie_Misc::absolutize_url(trim($element['attribs']['href']['data']), $this->http_base);
				$this->base_location = $element['offset'];
				break;
			}
		}
	}

	function autodiscovery()
	{
		$links = array_merge(SimplePie_Misc::get_element('link', $this->file->body), SimplePie_Misc::get_element('a', $this->file->body), SimplePie_Misc::get_element('area', $this->file->body));
		$done = array();
		foreach ($links as $link)
		{
			if ($this->checked_feeds == $this->max_checked_feeds)
			{
				break;
			}
			if (isset($link['attribs']['href']['data']) && isset($link['attribs']['rel']['data']))
			{
				$rel = array_unique(SimplePie_Misc::space_seperated_tokens(strtolower($link['attribs']['rel']['data'])));

				if ($this->base_location < $link['offset'])
				{
					$href = SimplePie_Misc::absolutize_url(trim($link['attribs']['href']['data']), $this->base);
				}
				else
				{
					$href = SimplePie_Misc::absolutize_url(trim($link['attribs']['href']['data']), $this->http_base);
				}

				if (!in_array($href, $done) && in_array('feed', $rel) || (in_array('alternate', $rel) && !empty($link['attribs']['type']['data']) && in_array(strtolower(SimplePie_Misc::parse_mime($link['attribs']['type']['data'])), array('application/rss+xml', 'application/atom+xml'))))
				{
					$this->checked_feeds++;
					$feed =& new $this->file_class($href, $this->timeout, 5, null, $this->useragent, false, $this->proxy);
					if ($this->is_feed($feed))
					{
						return $feed;
					}
				}
				$done[] = $href;
			}
		}
		return null;
	}

	function get_links()
	{
		$links = SimplePie_Misc::get_element('a', $this->file->body);
		foreach ($links as $link)
		{
			if (isset($link['attribs']['href']['data']))
			{
				$href = trim($link['attribs']['href']['data']);
				$parsed = SimplePie_Misc::parse_url($href);
				if ($parsed['scheme'] === '' || preg_match('/^(http(s)|feed)?$/i', $parsed['scheme']))
				{
					if ($this->base_location < $link['offset'])
					{
						$href = SimplePie_Misc::absolutize_url(trim($link['attribs']['href']['data']), $this->base);
					}
					else
					{
						$href = SimplePie_Misc::absolutize_url(trim($link['attribs']['href']['data']), $this->http_base);
					}

					$current = SimplePie_Misc::parse_url($this->file->url);

					if ($parsed['authority'] === '' || $parsed['authority'] == $current['authority'])
					{
						$this->local[] = $href;
					}
					else
					{
						$this->elsewhere[] = $href;
					}
				}
			}
		}
		$this->local = array_unique($this->local);
		$this->elsewhere = array_unique($this->elsewhere);
		if (!empty($this->local) || !empty($this->elsewhere))
		{
			return true;
		}
		return null;
	}

	function extension(&$array)
	{
		foreach ($array as $key => $value)
		{
			if ($this->checked_feeds == $this->max_checked_feeds)
			{
				break;
			}
			if (in_array(strtolower(strrchr($value, '.')), array('.rss', '.rdf', '.atom', '.xml')))
			{
				$this->checked_feeds++;
				$feed =& new $this->file_class($value, $this->timeout, 5, null, $this->useragent, false, $this->proxy);
				if ($this->is_feed($feed))
				{
					return $feed;
				}
				else
				{
					unset($array[$key]);
				}
			}
		}
		return null;
	}

	function body(&$array)
	{
		foreach ($array as $key => $value)
		{
			if ($this->checked_feeds == $this->max_checked_feeds)
			{
				break;
			}
			if (preg_match('/(rss|rdf|atom|xml)/i', $value))
			{
				$this->checked_feeds++;
				$feed =& new $this->file_class($value, $this->timeout, 5, null, $this->useragent, false, $this->proxy);
				if ($this->is_feed($feed))
				{
					return $feed;
				}
				else
				{
					unset($array[$key]);
				}
			}
		}
		return null;
	}
}
