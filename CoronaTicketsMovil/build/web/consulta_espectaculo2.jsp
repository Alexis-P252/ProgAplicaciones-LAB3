<%-- 
    Document   : consulta_espectaculo2
    Created on : 28/10/2021, 09:41:20 AM
    Author     : User
--%>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <% String nickname = (String) session.getAttribute("user");
        if(nickname == null){
            %><jsp:include page="error_identidad.jsp"/> <%
        }
        else{
            
        
    %>
    <head>
        <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>CoronaTickets</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src="http://code.highcharts.com/highcharts.js"></script>
    </head>
    <body>
        <% 
        ISistema sis;
        SistemaFactory fabrica = SistemaFactory.getInstance();
        sis = fabrica.getISistema();

        SimpleDateFormat ft = new SimpleDateFormat ("dd.MM.yyyy '-' HH:mm:ss");
        SimpleDateFormat ft2 = new SimpleDateFormat ("dd.MM.yyyy");

        String espectaculo = (String) request.getParameter("espectaculo");

        DtEspectaculo dtEsp = sis.mostrarEspectaculo(espectaculo);
        String nombre = dtEsp.GetNombre();
        String cant_mint = ""+dtEsp.GetCant_min_espec();;
        String cant_maxt =""+dtEsp.GetCant_max_espec();
        String descripcion = dtEsp.GetDescripcion();
        String URL = dtEsp.GetUrl();
        String duracion = ""+dtEsp.GetDuracion();
        String costo = ""+dtEsp.GetCosto();
        String imagen = dtEsp.GetImagen();
        String video = dtEsp.GetVideo();
        String desc_premio = dtEsp.getDesc_premio();
        String cant_premios = ""+dtEsp.getCant_premios();

        float puntaje_prom = sis.PuntajePromedioEspectaculo(espectaculo);
        int[] cant_estrellas = sis.CantEstrellasEspectaculo(espectaculo);
        int total_estrellas = 0;
        for(int i = 0; i < cant_estrellas.length;i++){
            total_estrellas = total_estrellas + cant_estrellas[i];
        }

        long cant_favs = sis.CantFavxEspectaculo(espectaculo);

        String[] categorias = sis.listarCategoriasxEspectaculo(espectaculo);
        String[] funciones = sis.listarFuncionesxEspectaculo(espectaculo);
        String[] paquetes = sis.listarPaquetesdeEsp(espectaculo); %>
        
        <hr>
    <div class="container bootstrap snippet">
        <div class="row">
            <div class="col-sm-2">
                <a href="pagina_principal.jsp" class>
                    <img title="profile image" class="img-circle img-responsive" width='100px' src="assets/img/virus.png">
                </a>
                <div > </div>
            </div>
            <div class="col-sm-10"><h1><%out.println(nombre);%></h1></div>
        </div>
        
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
              

      <div class="text-center">
        <img src="<%out.println(imagen);%>" class="avatar img-thumbnail" alt="Imagen">

      </div></hr><br>

               
          <div class="panel panel-default">
            <div class="panel-heading">Marcado como favorito?<i class="fa fa-link fa-1x"></i></div>
            <%  if(sis.TieneFavorito(nickname, espectaculo)){ %>
                    <div class="panel-body" style='color:green' >SI</div> <%
                }
                else{ %>
                    <div class="panel-body" style='color:red' >NO</div> <%
                }
            %>
            <div class="panel-body" >Cantidad de favoritos: <%out.println(cant_favs);%></div>
          </div>
          
           <ul class="list-group">
            <li class="list-group-item text-muted"><strong>Categorias</strong> <i class="fa fa-dashboard fa-1x"></i></li>
            <% 
                for(String cat: categorias){ %>
                    <li class="list-group-item text-right"><span class="pull-left"><%out.println(cat);%></span></li> <%
                }
            %>
          </ul>
          
          <ul class="list-group">
              <li class="list-group-item text-muted"><strong>Funciones</strong> <i class="fa fa-dashboard fa-1x"></i></li>
            <% 
                for(String fun: funciones){ %>
              
                  <li class="list-group-item text-right">
                      <span class="pull-left">
                          <a href="consulta_funcion3.jsp?funcion=<%out.println(fun);%>"> <%out.println(fun);%> </a>
                      </span>
                  </li>
              
                     <%
                }
            %>
          </ul>
          
          <ul class="list-group">
              <li class="list-group-item text-muted"> <strong>Paquetes</strong> <i class="fa fa-dashboard fa-1x"></i></li>
            <% 
                for(String paq: paquetes){ %>
                    <li class="list-group-item text-right"><span class="pull-left"><%out.println(paq);%></span></li> <%
                }
            %>
          </ul> 
               

          
        </div><!--/col-3-->
    	<div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Datos </a></li>
                <li><a data-toggle="tab" href="#media">Media</a></li>
                <li><a data-toggle="tab" href="#settings">Calificaciones</a></li>
            </ul>

              
          <div class="tab-content">
            <div class="tab-pane active" id="home">
                <hr>
                  <form class="form" action="consulta_espectaculo.jsp" method="post" id="volver">
                      <div class="form-group">
                          <label for="first_name"><h4 class='texto'>Descripcion</h4></label> 
                          <div class="col-xs-12">
                                <div class="card">
                                  <div class="card-body">
                                    <%out.println(descripcion);%>  
                                  </div>
                                </div>
                              <!-- <input type="text" class="form-control" name="first_name" id="first_name" placeholder="<%out.println(descripcion);%>" title="enter your first name if any." readonly> -->
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                            <label for="last_name"><h4 class='texto'>Duracion</h4></label>
                              <input type="text" class="form-control" name="last_name" id="last_name" placeholder="<%out.println(duracion);%>" title="enter your last name if any." readonly>
                          </div>
                      </div>
          
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="phone"><h4 class='texto'>Costo</h4></label>
                              <input type="text" class="form-control" name="phone" id="phone" placeholder="<%out.println(costo);%>" title="enter your phone number if any." readonly>
                          </div>
                      </div>
                      <div class="form-group">
                          <div class="col-xs-6">
                              <label for="email"><h4 class='texto'>Espectadores minimos</h4></label>
                              <input type="email" class="form-control" name="email" id="email" placeholder="<%out.println(cant_mint);%>" title="enter your email." readonly>
                          </div>
                      </div>    
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="email"><h4 class='texto'>Espectadores maximos</h4></label>
                              <input type="email" class="form-control" id="location" placeholder="<%out.println(cant_maxt);%>" title="enter a location" readonly>
                          </div>
                      </div> 
                          
                      <div class="form-group">
                          <div class="col-xs-6">
                             <label for="mobile"><h4 class='texto'>Sitio Web</h4></label>
                              <input type="text" class="form-control" name="mobile" id="mobile" placeholder="<%out.println(URL);%>" title="enter your mobile number if any." readonly>
                          </div>
                      </div>
                      
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                            <label for="password2"><h4 class='texto'>Cantidad premios</h4></label>
                              <input type="password" class="form-control" name="password2" id="password2" placeholder="<%out.println(cant_premios);%>" title="enter your password2." readonly>
                          </div>
                      </div>
                                                 
                      <div class="form-group">
                          <label for="first_name"><h4 class='texto'>Premio</h4></label> 
                          <div class="col-xs-12">
                                <div class="card">
                                  <div class="card-body">
                                    <%out.println(desc_premio);%>  
                                  </div>
                                </div>
                              <!-- <input type="text" class="form-control" name="first_name" id="first_name" placeholder="<%out.println(descripcion);%>" title="enter your first name if any." readonly> -->
                          </div>
                      </div>    
                      
                      <div class="form-group">
                           <div class="col-xs-12">
                                <br>
                              	<button class="btn btn-lg btn-success pull-right" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Volver</button>
                            </div>
                      </div>
              	</form>
              
              <hr>
              
             </div><!--/tab-pane-->
             <div class="tab-pane" id="media">
               
               <h2></h2>
               
               <hr>
                    <form class="form" action="consulta_espectaculo.jsp" method="post" id="volver">
                        <div class="row mt-3">
                            <div class="col-12">
                                <h4>Video</h4>
                            </div>
                            <div class="col-12" style="padding-bottom:56.25%; position:relative; display:block; width: 100%">
                                <% if(video.equals("")){ %>
                                    <h4> Este espectaculo no tiene ningun video asociado </h4> <%
                                }else{ %>
                                <iframe style="position:absolute; top:0; left: 0" src="<% out.println(video); %>" width="100%" height="100%">  </iframe> <%
                                }%>
                            </div>
                        </div>
                      
                      
                        <div class="form-group">
                             <div class="col-xs-12">
                                  <br>
                                  <button class="btn btn-lg btn-success pull-right" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Volver</button>
                              </div>
                        </div>
                    </form>
               
             </div><!--/tab-pane-->
             <div class="tab-pane" id="settings">
            		
               	
                  <hr>
                  <form class="form" action="consulta_espectaculo.jsp" method="post" id="volver">
                      
                    <div class="col-6">
                        <div id="container" style="width: 90%; height: 400px; margin: 0 auto"></div>
                        <script language="JavaScript">
                            $(document).ready(function() {  
                               var chart = {
                                  type: 'bar'
                               };
                               var title = {
                                  text: 'Calificaciones'   
                               };
                               var subtitle = {
                                  text: ''  
                               };
                               var xAxis = {
                                  categories: ['5 estrellas', '4 estrellas', '3 estrellas', '2 estrellas', '1 estrellas'],
                                  title: {
                                     text: null
                                  }
                               };
                               var yAxis = {
                                  min: 0,
                                  title: {
                                     text: '',
                                     align: 'high'
                                  },
                                  labels: {
                                     overflow: 'justify'
                                  }
                               };
                               var tooltip = {
                                  valueSuffix: ' Calificaciones'
                               };
                               var plotOptions = {
                                  bar: {
                                     dataLabels: {
                                        enabled: true
                                     }
                                  },
                                      series: {
                                         stacking: 'normal'
                                      }
                               };
                               var credits = {
                                  enabled: false
                               };
                               var series= [{
                                     name: '',
                                        data: [<% out.println(cant_estrellas[4]); %>, <% out.println(cant_estrellas[3]); %>, <% out.println(cant_estrellas[2]); %>, <% out.println(cant_estrellas[1]); %>, <% out.println(cant_estrellas[0]); %>]
                                    }
                               ];     

                               var json = {};   
                               json.chart = chart; 
                               json.title = title;   
                               json.subtitle = subtitle; 
                               //   json.tooltip = tooltip;
                               json.xAxis = xAxis;
                               json.yAxis = yAxis;  
                               json.series = series;
                               json.plotOptions = plotOptions;
                               json.credits = credits;
                               $('#container').highcharts(json);

                            });
                        </script>
                    </div>
                    
                        <div>
                             <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="password2"><h4>Puntaje promedio</h4></label>
                                    <input type="password" class="form-control" name="password2" id="password2" placeholder="<%out.println(puntaje_prom);%>" title="enter your password2.">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="password"><h4>Total calificaciones</h4></label>
                                    <input type="password" class="form-control" name="password" id="password" placeholder="<%out.println(total_estrellas);%>" title="enter your password.">
                                </div>
                            </div>

                        </div>
    
                        <div class="form-group">
                            <div class="col-xs-12">
                                <br>
                                <button class="btn btn-lg btn-success pull-right" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Volver</button>

                            </div>
                        </div>
                        
              	</form>
              </div>
               
              </div><!--/tab-pane-->
          </div><!--/tab-content-->

        </div><!--/col-9-->
    </div><!--/row-->
    <br><br>

        
    </body>
    <% } %>
</html>

<script>
    $(document).ready(function() {

    
    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }
    
            reader.readAsDataURL(input.files[0]);
        }
    }
    

    $(".file-upload").on('change', function(){
        readURL(this);
    });
});
</script>

<style>
    .texto{
        font-size: 15px
    }   
    
</style>
