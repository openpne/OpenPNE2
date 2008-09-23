<?php

class SimplePie_Copyright
{
	var $url;
	var $label;

	// Constructor, used to input the data
	function SimplePie_Copyright($url = null, $label = null)
	{
		$this->url = $url;
		$this->label = $label;
	}

	function __toString()
	{
		// There is no $this->data here
		return md5(serialize($this));
	}

	function get_url()
	{
		if ($this->url !== null)
		{
			return $this->url;
		}
		else
		{
			return null;
		}
	}

	function get_attribution()
	{
		if ($this->label !== null)
		{
			return $this->label;
		}
		else
		{
			return null;
		}
	}
}
