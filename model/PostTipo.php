<?php
require_once ("banco/Banco.php");
/**
 * Classe PostTipo
 */
class PostTipo
{
	
	private $idpost_tipo;
	private $post_nome_tipo;

	/**
	 * Getter & Setters
	 */

	public function getIdpost_tipo()
	{
		return $this->idpost_tipo;
	}

	public function setIdpost_tipo($idpost_tipo)
	{
		$this->idpost_tipo = $idpost_tipo;
	}

	public function getPost_nome_tipo()
	{
		return $this->post_nome_tipo;
	}

	public function setPost_nome_tipo($post_nome_tipo)
	{
		$this->post_nome_tipo = $post_nome_tipo;
	}

	/**
	 * Método de teste para consulta no banco 
	 */
	public function teste()
	{
		// echo "Ola Mundo";
		$sql = MysqliDb::getInstance();

		$tipos = $sql->rawQuery("SELECT * FROM post_tipo");
		foreach ($tipos as $tipouser) {
			print_r ($tipouser);
		}

	}

	// Continuar métodos da classe

}