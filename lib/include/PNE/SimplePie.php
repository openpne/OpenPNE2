<?php
/**
 * @license  GNU Lesser General Public License (LGPL)
 * @see      simplepie.inc
 */

require_once 'simplepie.inc';
require_once 'Snoopy.class.php';

/**
 * Wrapper class for SimplePie
 */
class PNE_SimplePie extends SimplePie
{
    /**
     * use Snoopy instead of fopen
     * 
     * PHP Bug #36017 fopen() crashes PHP when opening a URL in PHP4.4.2
     * @see http://bugs.php.net/bug.php?id=36017
     */
    function get_file($url)
    {
        $snoopy = new Snoopy();

        @$snoopy->fetch($url);
        if ($snoopy->status >= 200 && $snoopy->status < 300) {
            return str_replace("\0", '', $snoopy->results);
        } else {
            return false;
        }
    }

    /**
     * SimplePie doesn't support the following date format.
     * - YYYY-MM-DDThh:mmTZD (i.e. not include seconds.)
     * This modification supports the above format.
     */
    function parse_date($date)
    {
        if (preg_match('/([0-9]{2,4})-([0-9][0-9])-([0-9][0-9])T([0-9][0-9]):([0-9][0-9]):([0-9][0-9])(\.[0-9][0-9])?Z/i', $date, $matches)) {
            if (isset($matches[7]) && substr($matches[7], 1) >= 50)
                $matches[6]++;
            return strtotime("$matches[1]-$matches[2]-$matches[3] $matches[4]:$matches[5]:$matches[6] -0000");
        } else if (preg_match('/([0-9]{2,4})-([0-9][0-9])-([0-9][0-9])T([0-9][0-9]):([0-9][0-9]):([0-9][0-9])(\.[0-9][0-9])?(\+|-)([0-9][0-9]):([0-9][0-9])/i', $date, $matches)) {
            if (isset($matches[7]) && substr($matches[7], 1) >= 50)
                $matches[6]++;
            return strtotime("$matches[1]-$matches[2]-$matches[3] $matches[4]:$matches[5]:$matches[6] $matches[8]$matches[9]$matches[10]");
        } else if (preg_match('/([0-9]{2,4})-([0-9][0-9])-([0-9][0-9])T([0-9][0-9]):([0-9][0-9])Z/i', $date, $matches)) {
            return strtotime("$matches[1]-$matches[2]-$matches[3] $matches[4]:$matches[5]:00 -0000");
        } else if (preg_match('/([0-9]{2,4})-([0-9][0-9])-([0-9][0-9])T([0-9][0-9]):([0-9][0-9])(\+|-)([0-9][0-9]):([0-9][0-9])/i', $date, $matches)) {
            return strtotime("$matches[1]-$matches[2]-$matches[3] $matches[4]:$matches[5]:00 $matches[6]$matches[7]$matches[8]");
        } else {
            return strtotime($date);
        }
    }

    /**
     * is_feed
     * 
     * RSS/Atom feeds don't contain '<html'
     * Some HTML files contain '<rdf:RDF' and don't contain '<!DOCTYPE HTML'
     */
	function is_feed($data, $is_url = true) {
		if ($is_url) {
			$data = $this->get_file($data);
		}
		if (stristr($data, '<!DOCTYPE HTML')) {
			return false;
		} elseif (stristr($data, '<html')) {
		    return false;
        } elseif (stristr($data, '<rss') || stristr($data, '<rdf:RDF') || preg_match('/<([a-z0-9]+\:)?feed/mi', $data)) {
			return true;
		} else {
			return false;
		}
	}
}

?>
