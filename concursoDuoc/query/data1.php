<?php
require_once("cnx1.php");
if(isset($_POST['action']) && !empty($_POST['action'])) {
  $action = $_POST['action'];
  switch ($action) {
    case 'fill':
      fill();
      break;
    case 'correct':
      correct();
      break;
    default:
      # code...
      break;
  }
}

function correct(){
  $preg = $_POST['preg'];
  $alt = $_POST['alt'];
  mysql_query("SET NAMES 'utf8'");
  $sql = "select count(*) as total, alternativas.alternativa as respuesta
          from correctas, alternativas
          where correctas.id_preguntas= $preg and correctas.id_alternativas= $alt
          and alternativas.id_alternativas = correctas.id_alternativas";
  $result = mysql_query($sql);
  while ($row = mysql_fetch_array($result)){
    if($row['total'] == 1){
      $data[] = [
        'message' => 'Correcto!',
        'respuesta' => $row['respuesta']
      ];
    }
    else if ($row['total'] == 0){
      //echo 'Incorrecto!';
      mysql_query("SET NAMES 'utf8'");
      $sql = "select alternativas.alternativa as respuesta
              from correctas, alternativas
              where correctas.id_preguntas= $preg
              and alternativas.id_alternativas = correctas.id_alternativas";
      $result = mysql_query($sql);
      while ($row = mysql_fetch_array($result)){
        $data[] = [
          'message' => 'Incorrecto!',
          'respuesta' => $row['respuesta']
        ];
      }
    }
  }
  header("Content_Type: application/json");
  echo json_encode($data);
}

function fill(){
  //variables
  $count = 1;
  $sql = "select * from preguntas";
  $result = mysql_query($sql);
  $num = mysql_num_rows($result);
  if($num > 0){
	$random = rand(1,$num);
	mysql_query("SET NAMES 'utf8'"); //para que muestre con tildes y las ñ
	$sql = "select * from preguntas where id_preguntas = $random and estado = 0";
	$result = mysql_query($sql);
	$num1 = mysql_num_rows($result);
	if($num1 > 0){
		while ($row = mysql_fetch_array($result)){
		$data[] = [
			'id_pregunta' => $row['id_preguntas'],
			'pregunta' => $row['pregunta']
		];
		$sql = "select * from alternativas where id_preguntas = $random";
		$result = mysql_query($sql);
		while ($row = mysql_fetch_array($result)){
			$data[] = [
			'id_alternativa'.$count => $row['id_alternativas'],
			'alternativa'.$count => $row['alternativa']
			];
			$count++;
		}
		mysql_query("update preguntas set estado = 1 where id_preguntas = $random"); //Esta linea se habilita para hacer pruebas de validacion
		}
		header("Content_Type: application/json");
		echo json_encode($data);
	}
	else {
		$result = mysql_query("select * from preguntas where estado = 0");
		$num = mysql_num_rows($result);
		if($num > 0){
			fill();
		}
		else{
			echo "Se acabaron las preguntas.";
		}
	}
  }

}
?>
