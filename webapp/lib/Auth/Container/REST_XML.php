<?php
require_once 'Auth/Container.php';
require_once 'HTTP/Request.php';
require_once 'XML/Unserializer.php';

/**
$GLOBALS['_OPENPNE_AUTH_CONFIG'] =
array(
'storage'=>"REST_XML",
'options'=>array(
    'URL' => "http://example.com/",
    'cryptType'   => 'blowfish',
    'cryptKey'   => 'samplekey',
    'usernameKey'   => 'username',
    'passwordKey'   => 'password',
    'resultKey'   => 'result',
    'correctValue'   => 1,
    ),
);
*/

class Auth_Container_REST_XML extends Auth_Container
{
    var $options = array();
    var $result_value = array();

    /**
     * コンストラクタ
     */
    function Auth_Container_REST_XML($params)
    {
        $this->options = $params;
    }

    function fetchData($username, $password)
    {
        switch ($this->options['cryptType']) {
            case 'blowfish':
                include_once 'Crypt/Blowfish.php';
                $bf = new Crypt_Blowfish($this->options['cryptKey']);
                $password = $bf->encrypt($password);
                $password = base64_encode($password);
                break;
            default :
                if (function_exists($this->options['cryptType'])) {
                    $password = $this->options['cryptType']($password);
                }
                break;
        }

        $req = new HTTP_Request();
        $req->setURL($this->options['URL']);
        $req->setMethod(HTTP_REQUEST_METHOD_GET);
        $req->addQueryString($this->options['usernameKey'], $username);
        $req->addQueryString($this->options['passwordKey'], $password);

        if (!PEAR::isError($req->sendRequest())) {
            $response = $req->getResponseBody();
        } else {
            return false;
        }

        $unserializer = new XML_Unserializer();
        if ($unserializer->unserialize($response)) {
            $this->result_value = $unserializer->getUnserializedData();
            if ($this->result_value[$this->options['resultKey']] == $this->options['correctValue']) {
                return true;
            }
        }

        return false;
    }
}
?>
