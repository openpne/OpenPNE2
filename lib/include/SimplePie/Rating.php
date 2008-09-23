<?php

class SimplePie_Rating
{
	var $scheme;
	var $value;

	// Constructor, used to input the data
	function SimplePie_Rating($scheme = null, $value = null)
	{
		$this->scheme = $scheme;
		$this->value = $value;
	}

	function __toString()
	{
		// There is no $this->data here
		return md5(serialize($this));
	}

	function get_scheme()
	{
		if ($this->scheme !== null)
		{
			return $this->scheme;
		}
		else
		{
			return null;
		}
	}

	function get_value()
	{
		if ($this->value !== null)
		{
			return $this->value;
		}
		else
		{
			return null;
		}
	}
}
