<?php
require_once ("banco/Banco.php");

class Perfil{
	private $foto;	
	private $bio;
	private $nome;
	private $curso_idcurso;
	private $faculdade_idfaculdade;
	private $usuario_idusuario;

	public function getFoto() {
		return $this->foto;
	}

	public function getUsuario_idusuario() {
		return $this->usuario_idusuario;
	}

	public function getBio() {
		return $this->bio;
	}
	public function getNome() {
		return $this->nome;
	}

	public function getCurso_idcurso() {
		return $this->curso_idcurso;
	}
	public function getFaculdade_idfaculdade() {
		return $this->faculdade_idfaculdade;
	}

	public function setFoto($foto) {
		$this->foto = $foto;
	}

	public function setBio($bio) {
		$this->bio = $bio;
	}
	public function setNome($nome) {
		$this->nome = $nome;
	}

	public function setCurso_idcurso($curso_idcurso) {
		$this->curso_idcurso = $curso_idcurso;
	}
	public function setFaculdade_idfaculdade($faculdade_idfaculdade) {
		$this->faculdade_idfaculdade = $faculdade_idfaculdade;
	}

	public function setUsuario_idusuario($usuario_idusuario) {
		$this->usuario_idusuario = $usuario_idusuario;
	}

	public function criarPerfil (){
		$sql = MysqliDb::getInstance();
		
        $data = Array (
		"nome" => $this->getNome(),
    	"usuario_idusuario" => $this->getUsuario_idusuario(),
        "bio" => $this->getBio(),
        "curso_idcurso" => $this->getCurso_idcurso(),
        "faculdade_idfaculdade" => $this->getFaculdade_idfaculdade(),
        "foto" => $this->getFoto()
        );
        print_r($data);
    
		$id = $sql->insert("perfil", $data);
		
		echo $sql->getLastErrno();
		if($id)
			echo 'user was created. Id=' . $id;
		else
			echo "deu ruim";

	}
}		
?>