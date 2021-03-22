<?php


namespace App\Services\Soap;

use SoapClient;
use SoapFault;
use SoapParam;

class Soap {

    private $messages = array();
    private $soap;

    public function __construct() {
        try {
            $this -> connect();
        }
        catch (\Exception $e) {
            $this->addMessage($e->getMessage());
        }
    }

    public function connect() {
        try {
            $this->soap = new SoapClient(NULL, array(
                'location' => 'http://'.env('SOAP_HOST').':'.env('SOAP_PORT').'/',
                'uri' => 'urn:AC',
                'style' => SOAP_RPC,
                'login' => env('SOAP_USER'),
                'password' => env('SOAP_PASSWORD')
            ));
        }
        catch (SoapFault $e) {
            $this->addMessage($e->getMessage());
        }
    }

    public function cmd($command) {
        $result = $this->soap->executeCommand(new SoapParam($command, 'command'));
        $this->addMessage($result);
    }

    public function addMessage($message) {
        $this->messages[] = $message;
    }

    public function getMessages() {
        return $this->messages;
    }

}