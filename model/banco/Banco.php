<?php
// arquivos do banco
require_once ("MysqliDb.php");
require_once ("dbObject.php");

/**
 * Classe que realiza a conexão ao banco
 */
class Banco
{
	
	private $sql;
	private $host = "localhost";
	private $user = "root";
	private $password = "root";
	private $db_name = "mydb";

	function __construct()
	{
		
		// db staying private here
		$this->sql = new MysqliDb ($this->host, $this->user, $this->password, $this->db_name);

	}

}

$sql = new Banco();