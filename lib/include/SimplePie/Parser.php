<?php

class SimplePie_Parser
{
	var $xml;
	var $error_code;
	var $error_string;
	var $current_line;
	var $current_column;
	var $current_byte;
	var $separator = ' ';
	var $feed = false;
	var $namespace = array('');
	var $element = array('');
	var $xml_base = array('');
	var $xml_base_explicit = array(false);
	var $xml_lang = array('');
	var $data = array();
	var $datas = array(array());
	var $current_xhtml_construct = -1;
	var $encoding;

	function pre_process(&$data, $encoding)
	{
		// Use UTF-8 if we get passed US-ASCII, as every US-ASCII character is a UTF-8 character
		if (strtoupper($encoding) == 'US-ASCII')
		{
			$this->encoding = 'UTF-8';
		}
		else
		{
			$this->encoding = $encoding;
		}

		// Strip BOM:
		// UTF-32 Big Endian BOM
		if (strpos($data, "\x0\x0\xFE\xFF") === 0)
		{
			$data = substr($data, 4);
		}
		// UTF-32 Little Endian BOM
		elseif (strpos($data, "\xFF\xFE\x0\x0") === 0)
		{
			$data = substr($data, 4);
		}
		// UTF-16 Big Endian BOM
		elseif (strpos($data, "\xFE\xFF") === 0)
		{
			$data = substr($data, 2);
		}
		// UTF-16 Little Endian BOM
		elseif (strpos($data, "\xFF\xFE") === 0)
		{
			$data = substr($data, 2);
		}
		// UTF-8 BOM
		elseif (strpos($data, "\xEF\xBB\xBF") === 0)
		{
			$data = substr($data, 3);
		}

		// Make sure the XML prolog is sane and has the correct encoding
		$data = preg_replace("/^<\?xml[\x20\x9\xD\xA]+version([\x20\x9\xD\xA]+)?=([\x20\x9\xD\xA]+)?(\"1.0\"|'1.0'|\"1.1\"|'1.1')([\x20\x9\xD\xA]+encoding([\x20\x9\xD\xA]+)?=([\x20\x9\xD\xA]+)?(\"[A-Za-z][A-Za-z0-9._\-]*\"|'[A-Za-z][A-Za-z0-9._\-]*'))?([\x20\x9\xD\xA]+standalone([\x20\x9\xD\xA]+)?=([\x20\x9\xD\xA]+)?(\"(yes|no)\"|'(yes|no)'))?([\x20\x9\xD\xA]+)?\?>/", '', $data);
		$data = "<?xml version='1.0' encoding='$encoding'?>\n" . $data;
	}

	function parse(&$data)
	{
		$return = true;

		// Create the parser
		$this->xml = xml_parser_create_ns($this->encoding, $this->separator);
		xml_parser_set_option($this->xml, XML_OPTION_SKIP_WHITE, 1);
		xml_parser_set_option($this->xml, XML_OPTION_CASE_FOLDING, 0);
		xml_set_object($this->xml, $this);
		xml_set_character_data_handler($this->xml, 'cdata');
		xml_set_element_handler($this->xml, 'tag_open', 'tag_close');

		// Parse!
		if (!xml_parse($this->xml, $data, true))
		{
			$this->data = null;
			$this->error_code = xml_get_error_code($this->xml);
			$this->error_string = xml_error_string($this->error_code);
			$return = false;
		}
		$this->current_line = xml_get_current_line_number($this->xml);
		$this->current_column = xml_get_current_column_number($this->xml);
		$this->current_byte = xml_get_current_byte_index($this->xml);
		xml_parser_free($this->xml);
		return $return;
	}

	function get_error_code()
	{
		return $this->error_code;
	}

	function get_error_string()
	{
		return $this->error_string;
	}

	function get_current_line()
	{
		return $this->current_line;
	}

	function get_current_column()
	{
		return $this->current_column;
	}

	function get_current_byte()
	{
		return $this->current_byte;
	}

	function get_data()
	{
		return $this->data;
	}

	function tag_open($parser, $tag, $attributes)
	{
		if ($this->feed === 0)
		{
			return;
		}
		elseif ($this->feed == false)
		{
			if (in_array($tag, array(
				SIMPLEPIE_NAMESPACE_ATOM_10 . $this->separator . 'feed',
				SIMPLEPIE_NAMESPACE_ATOM_03 . $this->separator . 'feed',
				'rss',
				SIMPLEPIE_NAMESPACE_RDF . $this->separator . 'RDF'
			)))
			{
					$this->feed = 1;
			}
		}
		else
		{
			$this->feed++;
		}

		list($this->namespace[], $this->element[]) = $this->split_ns($tag);

		$attribs = array();
		foreach ($attributes as $name => $value)
		{
			list($attrib_namespace, $attribute) = $this->split_ns($name);
			$attribs[$attrib_namespace][$attribute] = $value;
		}

		if (isset($attribs[SIMPLEPIE_NAMESPACE_XML]['base']))
		{
			$this->xml_base[] = SimplePie_Misc::absolutize_url($attribs[SIMPLEPIE_NAMESPACE_XML]['base'], end($this->xml_base));
			$this->xml_base_explicit[] = true;
		}
		else
		{
			$this->xml_base[] = end($this->xml_base);
			$this->xml_base_explicit[] = end($this->xml_base_explicit);
		}

		if (isset($attribs[SIMPLEPIE_NAMESPACE_XML]['lang']))
		{
			$this->xml_lang[] = $attribs[SIMPLEPIE_NAMESPACE_XML]['lang'];
		}
		else
		{
			$this->xml_lang[] = end($this->xml_lang);
		}

		if ($this->current_xhtml_construct >= 0)
		{
			$this->current_xhtml_construct++;
			if (end($this->namespace) == SIMPLEPIE_NAMESPACE_XHTML)
			{
				$this->data['data'] .= '<' . end($this->element);
				if (isset($attribs['']))
				{
					foreach ($attribs[''] as $name => $value)
					{
						$this->data['data'] .= ' ' . $name . '="' . htmlspecialchars($value, ENT_COMPAT, $this->encoding) . '"';
					}
				}
				$this->data['data'] .= '>';
			}
		}
		else
		{
			$this->datas[] =& $this->data;
			$this->data =& $this->data['child'][end($this->namespace)][end($this->element)][];
			$this->data = array('data' => '', 'attribs' => $attribs, 'xml_base' => end($this->xml_base), 'xml_base_explicit' => end($this->xml_base_explicit), 'xml_lang' => end($this->xml_lang));
			if ((end($this->namespace) == SIMPLEPIE_NAMESPACE_ATOM_03 && in_array(end($this->element), array('title', 'tagline', 'copyright', 'info', 'summary', 'content')) && isset($attribs['']['mode']) && $attribs['']['mode'] == 'xml')
			|| (end($this->namespace) == SIMPLEPIE_NAMESPACE_ATOM_10 && in_array(end($this->element), array('rights', 'subtitle', 'summary', 'info', 'title', 'content')) && isset($attribs['']['type']) && $attribs['']['type'] == 'xhtml'))
			{
				$this->current_xhtml_construct = 0;
			}
		}
	}

	function cdata($parser, $cdata)
	{
		if ($this->current_xhtml_construct >= 0)
		{
			$this->data['data'] .= htmlspecialchars($cdata, ENT_QUOTES, $this->encoding);
		}
		elseif ($this->feed > 1)
		{
			$this->data['data'] .= $cdata;
		}
	}

	function tag_close($parser, $tag)
	{
		if (!$this->feed)
		{
			return;
		}

		if ($this->current_xhtml_construct >= 0)
		{
			$this->current_xhtml_construct--;
			if (end($this->namespace) == SIMPLEPIE_NAMESPACE_XHTML && !in_array(end($this->element), array('area', 'base', 'basefont', 'br', 'col', 'frame', 'hr', 'img', 'input', 'isindex', 'link', 'meta', 'param')))
			{
				$this->data['data'] .= '</' . end($this->element) . '>';
			}
		}
		if ($this->current_xhtml_construct == -1)
		{
			$this->data =& $this->datas[$this->feed];
			array_pop($this->datas);
		}

		array_pop($this->element);
		array_pop($this->namespace);
		array_pop($this->xml_base);
		array_pop($this->xml_base_explicit);
		array_pop($this->xml_lang);
		$this->feed--;
	}

	function split_ns($string)
	{
		static $cache = array();
		if (!isset($cache[$string]))
		{
			if ($pos = strpos($string, $this->separator))
			{
				static $separator_length;
				if (!$separator_length)
				{
					$separator_length = strlen($this->separator);
				}
				$cache[$string] = array(substr($string, 0, $pos), substr($string, $pos + $separator_length));
			}
			else
			{
				$cache[$string] = array('', $string);
			}
		}
		return $cache[$string];
	}
}
