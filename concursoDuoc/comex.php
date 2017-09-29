<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="lib/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="lib/css/bootstrap.css"
    rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="lib/css/TimeCircles.css" />
    <link rel="stylesheet" href="lib/css/sweetalert.min.css">
    <title>Olimpiada de Comercio Exterior</title>
  </head>

  <body>
  <?php include("header.php"); ?>
    <div class="section">
      <div class="container">
          <h3>Pregunta <label id="idpreg"> </label> .-</h3>
          <div>
          <center>
            <h3><p id="preg">Se acabaron las preguntas. Desea<a href="index.php"> Jugar de nuevo</a></p></h3>
          </center>
          </div>
        </div>
    </div>

    <div class="section">
      <div class="container">
          <div class="col-md-12">
            <table class="table table-bordered">
              <tbody>

                <tr>
                  <td><center><button id="alt1" onclick="responder(0)" type="button" class="btn btn-success btn-lg">A</button> <h3><p id="txt1">Alternativa 1</p></h3></center><br></td>
                  <td><center><button id="alt3" onclick="responder(0)" type="button" class="btn btn-success btn-lg">C</button> <h3><p id="txt3">Alternativa 3</p></h3></center><br></td>
                </tr>
                <tr>
                  <td><center><button id="alt2" onclick="responder(0)" type="button" class="btn btn-success btn-lg">B</button> <h3><p id="txt2">Alternativa 2</p></h3></center><br></td>
                  <td><center><button id="alt4" onclick="responder(0)" type="button" class="btn btn-success btn-lg">D</button> <h3><p id="txt4">Alternativa 4</p></h3></center><br></td>
                </tr>
              </tbody>
            </table>
            <!--<center><button class="btn btn-success startTimer">Responder!</button>
            <button class="btn btn-danger stopTimer">Stop Timer</button></center>-->
          </div>
      </div>
    </div>

    <script type="text/javascript" src="lib/js/jquery.min.js"></script>
        <script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="lib/js/sweetalert.min.js"></script>
        <script type="text/javascript" src="lib/js/TimeCircles.js"></script>


    <script>
      $(document).ready(function(){
        filldata();
        audioBien();
        audioMal();
        setTimeout(function(){
          tiempoEnd();
        }, 60000);
      });
		//Variables Globales
		var flag=1;
    //var mediaElement = document.getElementById("bien");
    var audio = 0;

      function tiempoEnd(){
        if(flag == 1){
			timeCircles = $("#CountDownTimer").TimeCircles();
        timeCircles.elements.last().fadeOut();
        swal({
                 title: "Se acabo el tiempo!",
                 text: "Pasando a la siguiente pregunta!",
                 type: "warning",
                 showCancelButton: false,
                 confirmButtonColor: "#DD6B55",
                 confirmButtonText: "Siguiente!",
                 cancelButtonText: "No, cancel plx!",
                 closeOnConfirm: false,
                 closeOnCancel: false },
         function(isConfirm){
           if (isConfirm) {
            swal("Siguiente Pregunta!", "En 5 segundos aparecera la nueva pregunta.", "success");
            setTimeout(function(){
              window.location.replace("comex.php");
            }, 3000);
          }
            else {
              swal("Cancelled", "Your imaginary file is safe :)", "error");
            }
          });
		}
      }
      var id_preg="";
      var id_alt="";
      //Llenar los datos desde la base de datos
      function filldata(){
        dataString = "action=fill";
        $.ajax({
          url: "query/data1.php",
          data: dataString,
          type: "post",
          success: function(data){
            /*setTimeout(function(){
              window.location.replace("puntos.php");
            }, 3000);*/
            //alert(data);
            data = jQuery.parseJSON(data);
            id_preg=data[0].id_pregunta;
            $("#idpreg").text(data[0].id_pregunta);
            $("#preg").text(data[0].pregunta);
            $("#alt1").attr('onclick','responder('+data[1].id_alternativa1+','+id_preg+')');
            $("#txt1").text(data[1].alternativa1);
            $("#alt2").attr('onclick','responder('+data[2].id_alternativa2+','+id_preg+')');
            $("#txt2").text(data[2].alternativa2);
            $("#alt3").attr('onclick','responder('+data[3].id_alternativa3+','+id_preg+')');
            $("#txt3").text(data[3].alternativa3);
            $("#alt4").attr('onclick','responder('+data[4].id_alternativa4+','+id_preg+')');
            $("#txt4").text(data[4].alternativa4);
            //alert(data);
          },
          error: function(data){
            alert("Error");
          }
        });
      }
      //Configuración del TimeCircles
      $("#CountDownTimer").TimeCircles({
        time:
          {
            Days: { show: false },
            Hours: { show: false },
            Minutes: { show: false },
            animation_interval: "smooth",
            count_past_zero: false
          }
      });

      function responder(id_alt, id_preg){
        $("#CountDownTimer").TimeCircles().stop();
		flag = 2;
        //alert("Pregunta: "+id_preg+" Alternativa: "+id_alt);
        dataString = "action=correct&preg="+id_preg+"&alt="+id_alt;
        $.ajax({
          url: "query/data1.php",
          data: dataString,
          type: "post",
          success: function(data){
            //alert(data);
            data = jQuery.parseJSON(data);
            if(data[0].message == "Correcto!"){
              audio = 1;
              audioBien();
              swal({
                       title: ""+data[0].message,
                       text: "La respuesta correcta es: "+data[0].respuesta,
                       type: "success",
                       showCancelButton: false,
                       confirmButtonColor: "#DD6B55",
                       confirmButtonText: "Siguiente!",
                       cancelButtonText: "No, cancel plx!",
                       closeOnConfirm: false,
                       closeOnCancel: false },
               function(isConfirm){
                 if (isConfirm) {
                  swal("Siguiente Pregunta!", "En 5 segundos aparecera la nueva pregunta.", "success");
                  setTimeout(function(){
                    window.location.replace("comex.php");
                  }, 3000);
                }
                  else {
                    swal("Cancelled", "Your imaginary file is safe :)", "error");
                  }
                });
            }
            else if (data[0].message == "Incorrecto!") {
              //swal(""+data[0].message, "La respuesta correcta es: "+data[0].respuesta, "error");
              audio = 1;
              audioMal();
              swal({
                       title: ""+data[0].message,
                       text: "La respuesta correcta es: "+data[0].respuesta,
                       type: "warning",
                       showCancelButton: false,
                       confirmButtonColor: "#DD6B55",
                       confirmButtonText: "Siguiente!",
                       cancelButtonText: "No, cancel plx!",
                       closeOnConfirm: false,
                       closeOnCancel: false },
               function(isConfirm){
                 if (isConfirm) {
                  swal("Siguiente Pregunta!", "En 5 segundos aparecera la nueva pregunta.", "success");
                  setTimeout(function(){
                    window.location.replace("comex.php");
                  }, 3000);
                }
                  else {
                    swal("Cancelled", "Your imaginary file is safe :)", "error");
                  }
                });
            }
            //window.location.replace("com_ex.php");
          },
          error: function(data){
            alert("Error");
          }
        });
        //$("#CountDownTimer").TimeCircles().start();

      }
      // Start and stop are methods applied on the public TimeCircles instance
            /*$(".startTimer").click(function() {
                $("#CountDownTimer").TimeCircles().start();
            });
            $(".stopTimer").click(function() {
                $("#CountDownTimer").TimeCircles().stop();
            });*/

            function audioBien(){
              var mediaElement = document.getElementById("bien");
              if(audio == 0)
              {
                mediaElement.pause();
              }else if (audio == 1){

                mediaElement.play();
              }
            }

            function audioMal(){
              var mediaElement = document.getElementById("mal");
              if(audio == 0)
              {
                mediaElement.pause();
              }else if (audio == 1){

                mediaElement.play();
              }
            }
    </script>

    <audio id ="bien" src="media/audio/bien.mp3"  autoplay = "false">  </audio>
    <audio id ="mal" src="media/audio/mal.mp3"  autoplay = "false">  </audio>




  </body>
</html>
