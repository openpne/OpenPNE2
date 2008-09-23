<?php

class SimplePie_Cache
{
	var $location;
	var $filename;
	var $extension;
	var $name;

	function SimplePie_Cache($location, $filename, $extension)
	{
		$this->location = $location;
		$this->filename = rawurlencode($filename);
		$this->extension = rawurlencode($extension);
		$this->name = "$location/$this->filename.$this->extension";
	}

	function save($data)
	{
		if (file_exists($this->name) && is_writeable($this->name) || file_exists($this->location) && is_writeable($this->location))
		{
			if (function_exists('file_put_contents'))
			{
				return (bool) file_put_contents($this->name, serialize($data));
			}
			else
			{
				$fp = fopen($this->name, 'wb');
				if ($fp)
				{
					fwrite($fp, serialize($data));
					fclose($fp);
					return true;
				}
			}
		}
		return false;
	}

	function load()
	{
		if (file_exists($this->name) && is_readable($this->name))
		{
			if (function_exists('file_get_contents'))
			{
				return unserialize(file_get_contents($this->name));
			}
			elseif (($fp = fopen($this->name, 'rb')) !== false)
			{
				$data = '';
				while (!feof($fp))
				{
					$data .= fread($fp, 8192);
				}
				fclose($fp);
				return unserialize($data);
			}
		}
		return false;
	}

	function mtime()
	{
		if (file_exists($this->name))
		{
			return filemtime($this->name);
		}
		return false;
	}

	function touch()
	{
		if (file_exists($this->name))
		{
			return touch($this->name);
		}
		return false;
	}

	function unlink()
	{
		if (file_exists($this->name))
		{
			return unlink($this->name);
		}
		return false;
	}
}
