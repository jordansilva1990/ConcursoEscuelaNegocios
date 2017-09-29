<?php
//Aqui va la variable de conexión al servidor de la base de datos, los parametros son "dirección del servidor, usuario, contraseña".
$cnx = mysql_connect("localhost", "root", "");
//Aqui se hace la conexión a la base de datos, los parametros son "el nombre de la base de datos, las variables de conexión del servidor".
mysql_select_db("db_comex", $cnx) or die("Error, no se pudo conectar con la base de datos");
//Si la conexión al servidor falla, se ejecuta lo siguiente.
if (!$cnx) {
  die('No hay conexión: ' . mysql_error());
  echo('Error.</br>');
}
