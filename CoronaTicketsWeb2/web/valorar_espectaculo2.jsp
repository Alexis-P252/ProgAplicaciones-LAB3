<%-- 
    Document   : consulta_espectaculo3
    Created on : 29/09/2021, 11:47:56 AM
    Author     : User
--%>

<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/estrellas.css">
        <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="http://code.highcharts.com/highcharts.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
        <title>CoronaTickets</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
        if(session.getAttribute("tipo") == null){
            %> <jsp:include page="error_identidad.jsp"/> <%
        }
        else if(session.getAttribute("tipo").equals("Artista")){
            %> <jsp:include page="error_identidad.jsp"/> <%
        }
        else{        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                
                <% if(session.getAttribute("tipo") != null){
                    
                        if ( session.getAttribute("tipo").equals("Artista")){ %>
                
                        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                             <a class="navbar-brand" href="index_art.jsp">CoronaTickets.uy</a>
                        </div> 
                         <%
                        }
                        else if (session.getAttribute("tipo").equals("Espectador")){ %>
                            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                                <a class="navbar-brand" href="index_esp.jsp">CoronaTickets.uy</a>
                            </div>
                          <%
                        }
                    }
                    else{ %>
                        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                            <a class="navbar-brand" href="index.jsp">CoronaTickets.uy</a>
                        </div>
                    
                <% } %>
            </div>
        </nav>
        <%
            
            pkgWS.PublicadorService service = new pkgWS.PublicadorService();
            pkgWS.Publicador port = service.getPublicadorPort();
            
            String nickname = (String) session.getAttribute("user");
            
            SimpleDateFormat ft = new SimpleDateFormat ("dd.MM.yyyy '-' HH:mm:ss");
            SimpleDateFormat ft2 = new SimpleDateFormat ("dd.MM.yyyy");

            String espectaculo = (String) request.getParameter("selector");
            
             if(espectaculo.equals("Seleccione un espectaculo") || espectaculo == null){
                out.print("OPCION INVALIDA"); 
                
%>              <form action="valorar_espectaculo.jsp" method="post"> <%  %>
                    <button type="submit" class="btn btn-secondary btn-lg btn-block">Volver</button>
                </form>
            <%}
            else{
                
            pkgWS.DtEspectaculo dtEsp = port.mostrarEspectaculo(espectaculo);
            String nombre = dtEsp.getNombre();
            String descripcion = dtEsp.getDescripcion();
            String imagen = dtEsp.getImagen();
            float puntaje_prom = port.puntajePromedioEspectaculo(espectaculo);

            List<Integer> precant_estrellas = port.cantEstrellasEspectaculo(espectaculo).getItem();
            Object[] cant_estrellas = precant_estrellas.toArray();
         
            int total_estrellas = 0;
            for(int i = 0; i < cant_estrellas.length;i++){
                total_estrellas = total_estrellas + (int ) cant_estrellas[i];
            }
            
    
        %>
        
        <div class="container">
        <div class="row mt-3">
            <div class="col-6">
                <h4>Nombre</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<% out.println(nombre); %>">
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-6">
                <h4>Descripcion</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<% out.println(descripcion); %>">
            </div>
        </div>
   
        <div class="row mt-3">
            <div class="col-6">
                <h4>Imagen</h4>
            </div>
            <div class="col-6">
                <img src="<% out.println(imagen); %>" alt="Este espectaculo no tiene ninguna imagen asociada o hubo un error al procesarla" width="200" height="200"> 
            </div>
        </div>
        
         <div class="row mt-3">
            <div class="col-6">
                <h4>Puntaje promedio</h4>
            </div>
            <div class="col-6">
               <div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
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
                         text: 'Cantidad de calificaciones ',
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
                <h5>Total de calificaciones: <% out.println(total_estrellas); %></h5>
                <h5>Puntaje Promedio: <% out.println(puntaje_prom); %> </h5>
            </div>
        </div>
        
        <%
        if(port.espectadorValoroEspectaculo(nickname, espectaculo)){
            int miPuntaje = port.puntajedeEspectador(nickname, espectaculo);
        %>
            <div class="row mt-3">
                <div class="col-6">
                    <h4>Tu puntaje</h4>
                </div>
                <div class="col-6">
                    <h5> <% out.println(miPuntaje); %> </h5>
                </div>
            </div> <%
        } 
        else{ %>
            <form action="valorar_espectaculo3.jsp" method="post">
                 <input class="form-control" type="text" id="invisible" name="espectaculo" value="<% out.println(espectaculo); %>"  readonly placeholder="">
                <div class="row mt-3">
                    <div class="col-6">
                        <h4>Califica al espectaculo</h4>
                    </div>
                    <div class="col-6">
                        <div class="estrellas">
                            <p class="clasificacion">
                              <input id="radio1" type="radio" name="estrellas" value="5"><!--
                              --><label for="radio1">★</label><!--
                              --><input id="radio2" type="radio" name="estrellas" value="4"><!--
                              --><label for="radio2">★</label><!--
                              --><input id="radio3" type="radio" name="estrellas" value="3"><!--
                              --><label for="radio3">★</label><!--
                              --><input id="radio4" type="radio" name="estrellas" value="2"><!--
                              --><label for="radio4">★</label><!--
                              --><input id="radio5" type="radio" name="estrellas" value="1"><!--
                              --><label for="radio5">★</label>
                            </p>
                        </div>
                    </div>
                   
                </div>
                    <div class=" d-flex justify-content-center">
                        <button type="submit" class="btn btn-secondary btn-lg btn-block ">Valorar</button>
                    </div>   
            </form>    
        <%} %>
              

<br>
<br>
        <div class="row mt-6">
            
            <div class="col-5">
            </div>
            <div class="col-4">
                
                 <form action="valorar_espectaculo.jsp">
                    <div class=" d-flex justify-content-center">
                        <button type="submit" class="btn btn-secondary btn-lg btn-block">Volver</button>
                    </div>    
                </form>
            </div>
    
            <div class="col-4">
            </div>
        </div>
<br>
<br>        

    </div>
    </body>
    <%
   }
    %>

    <script>
     
        var estrellas = document.getElementById('clasificacion');
        var boton = document.getElementById('btn-estrellas');
        
        var invisible = document.getElementById("invisible");
        invisible.style.display = 'none';

        boton.style.display = 'none';
        estrellas.addEventListener('click', function(){
            boton.style.display = 'inline'
        })


    </script>
</html>
<% } %>
