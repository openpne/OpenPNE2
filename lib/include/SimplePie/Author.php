<?php

class SimplePie_Author
{
	var $name;
	var $link;
	var $email;

	// Constructor, used to input the data
	function SimplePie_Author($name = null, $link = null, $email = null)
	{
		$this->name = $name;
		$this->link = $link;
		$this->email = $email;
	}

	function __toString()
	{
		// There is no $this->data here
		return md5(serialize($this));
	}

	function get_name()
	{
		if ($this->name !== null)
		{
			return $this->name;
		}
		else
		{
			return null;
		}
	}

	function get_link()
	{
		if ($this->link !== null)
		{
			return $this->link;
		}
		else
		{
			return null;
		}
	}

	function get_email()
	{
		if ($this->email !== null)
		{
			return $this->email;
		}
		else
		{
			return null;
		}
	}
}
