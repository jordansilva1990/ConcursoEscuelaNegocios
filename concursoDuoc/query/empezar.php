<?php

if(isset($_GET['action']) && !empty($_GET['action'])) {
  $action = $_GET['action'];
  switch ($action) {
    case 'logistica':
      logistica();
      break;
    case 'comex':
      comex();
      break;
    default:
      # code...
      break;
  }
}

function logistica(){
  require_once("cnx.php");
  $sql= "UPDATE preguntas SET estado = 0";
  if(mysql_query($sql)){

    header("location: ../logistica.php");

  }else{
    echo "Se genero un problema." .mysql_error();
  }

}

function comex(){
  require_once("cnx1.php");
  $sql= "UPDATE preguntas SET estado = 0";
  if(mysql_query($sql)){

    header("location: ../comex.php");

  }else{
    echo "Se genero un problema." .mysql_error();
  }

}

 ?>
