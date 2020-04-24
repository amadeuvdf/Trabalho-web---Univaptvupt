<?php

require_once("../model/Perfil.php");

$perfil = new Perfil();
$perfil->setNome("Bruno");
$perfil->setBio("Bruno");
$perfil->setFoto("Bruno");
$perfil->setCurso_idcurso(1);
$perfil->setFaculdade_idfaculdade(1);
$perfil->setUsuario_idusuario(1);
$perfil->criarPerfil();

?>
