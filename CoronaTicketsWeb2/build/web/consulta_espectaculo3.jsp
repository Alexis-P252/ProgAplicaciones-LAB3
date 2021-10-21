<%-- 
    Document   : consulta_espectaculo3
    Created on : 29/09/2021, 11:47:56 AM
    Author     : User
--%>

<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/estrellas.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="http://code.highcharts.com/highcharts.js"></script>
        <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
        <title>CoronaTickets</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    </head>
    <body>
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
            ISistema sis;
            SistemaFactory fabrica = SistemaFactory.getInstance();
            sis = fabrica.getISistema();
            
            SimpleDateFormat ft = new SimpleDateFormat ("dd.MM.yyyy '-' HH:mm:ss");
            SimpleDateFormat ft2 = new SimpleDateFormat ("dd.MM.yyyy");

            String espectaculo = (String) request.getParameter("selector");
            
             if(espectaculo.equals("Seleccione un espectaculo") || espectaculo == null){
                out.print("OPCION INVALIDA"); 
                
                if(session.getAttribute("tipo") != null){
                    if(session.getAttribute("tipo").equals("Artista")){
                        %> <form action="consulta_espectaculo_art.jsp"> <%
                    }
                    else if (session.getAttribute("tipo").equals("Espectador")) {
                         %> <form action="consulta_espectaculo_esp.jsp"> <%
                    }
                }
                else{   %> <form action="consulta_espectaculo.jsp"> <% } %>
               
                    <button type="submit" class="btn btn-secondary btn-lg btn-block">Volver</button>
                </form>
            <%}
            else{
                
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

            
        
        <div class="container"> <%
            if(session.getAttribute("tipo") != null){
                if(session.getAttribute("tipo").equals("Espectador")){
                    String nick = (String) session.getAttribute("user");
                    if(sis.TieneFavorito(nick, espectaculo)){ %>
                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Marcado como favorito</h4>
                            </div>
                            <div class="col-6">
                            </div>
                        </div>

                    
                <%}
                }
            }
        %>
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
                <h4>Duracion (min)</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<% out.println(duracion); %>">
            </div>
        </div>


        <div class="row mt-3">
            <div class="col-6">
                <h4>URL</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<% out.println(URL); %>">
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-6">
                <h4>Espectadores minimos</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<% out.println(cant_mint); %>">
            </div>
        </div>
        
        <div class="row mt-3">
            <div class="col-6">
                <h4>Espectadores maximos</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly id="fecha" placeholder="<% out.println(cant_maxt); %>" >
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-6">
                <h4>Costo</h4>
            </div>
            <div class="col-6">
                <input class="h-700 form-control" type="text" readonly placeholder="<% out.println(costo); %>">
            </div>
        </div>
            
        <div class="row mt-3">
            <div class="col-6">
                <h4>Cantidad de Favoritos</h4>
            </div>
            <div class="col-6">
                <input class="h-700 form-control" type="text" readonly placeholder="<% out.println(cant_favs); %>">
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
                <h4>Video</h4>
            </div>
            <div class="col-6">
                <% if(video.equals("")){ %>
                    <h4> Este espectaculo no tiene ningun video asociado </h4> <%
                }else{ %>
                    <iframe src="<% out.println(video); %>" width="560" height="315">  </iframe> <%
                }%>
            </div>
        </div>
            
        <div class="row mt-3">
            <div class="col-6">
                <h4>Categorias</h4>
            </div>
            <div class="col-6">
                    <select name= "selector" id="listaCategorias" class="form-select" multiple aria-label="multiple select example">
                        <% // CARGAMOS LA LISTA DE CATEGORIAS DEL ESPECTACULO 
                        if(categorias[0] != null){
                            int i = 1;
                            for(String s: categorias){
        
                            %>
                            <option  id="<% out.print(i); %>" value="<% out.print(s); %>"> <% out.print(s); %></option>
                            <%
                            i++; 
                            }
                        }else{
                            %>
                            <option  id="MensajeError" > <% out.print("No tiene ninguna categoria"); %></option>
                            <%
                        }
                        
                         %>
                    </select>  
            </div>
        </div>
                    
        <div class="row mt-3">
            <div class="col-6">
                <h4>Funciones</h4>
            </div>
            <div class="col-6">
                <form action="consulta_funcion4.jsp">
                    <select name= "selector" id="listaFunciones" class="form-select" multiple aria-label="multiple select example">
                        <% // CARGAMOS LA LISTA DE FUNCIONES DEL ESPECTACULO
                        int j = 1; 
                        if(funciones[0] != null){
                            j = 1;
                            for(String s: funciones){
        
                            %>
                            <option  id="<% out.print(j); %>" value="<% out.print(s); %>"> <% out.print(s); %></option>
                            <%
                            j++; 
                            }
                        }else{
                            %>
                            <option  id="MensajeError" > <% out.print("No tiene ninguna funcion"); %></option>
                            <%
                        }
                        
                         %>
                    </select>
                    <% if(j > 1){ %>
                            <button type="submit" class="btn btn-secondary btn-lg btn-block" id="btn_datos_fun">Ver datos funcion</button>    
                        <% } %>
                </form>
            </div>
        </div>
                    
        <div class="row mt-3">
            <div class="col-6">
                <h4>Paquetes</h4>
            </div>
            <div class="col-6">
                <form action="consulta_paquete2.jsp">
                    <select name= "selector" id="listaPaquete" class="form-select" multiple aria-label="multiple select example">
                        <% // CARGAMOS LA LISTA DE PAQUETES DEL ESPECTACULO
                        int k = 1;
                        if(paquetes != null){
                            k = 1;
                            for(String s: paquetes){
        
                            %>
                            <option  id="<% out.print(k); %>" value="<% out.print(s); %>"> <% out.print(s); %></option>
                            <%
                            k++;
                            }
                            if(k == 1){
                                %>
                                <option  id="MensajeError" > <% out.print("No pertenece a ningun paquete"); %></option>
                                <%
                            }
                        }else{
                            %>
                            <option  id="MensajeError" > <% out.print("No pertenece a ningun paquete"); %></option>
                            <%
                        }
                        
                         %>
                    </select>
                        <% if(k > 1){ %>
                            <button type="submit" class="btn btn-secondary btn-lg btn-block" id='btn_datos'>Ver datos paquete</button>    
                        <% } %>
                </form>
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
                    
                 
                    
    
<br>
<br>
        <div class="row mt-6">
            
            <div class="col-5">
            </div>
            <div class="col-4">
                <%
                if(session.getAttribute("tipo") != null){
                    if(session.getAttribute("tipo").equals("Artista")){
                        %> <form action="consulta_espectaculo_art.jsp"> <%
                    }
                    else if (session.getAttribute("tipo").equals("Espectador")) {
                         %> <form action="consulta_espectaculo_esp.jsp"> <%
                    }
                }
                else{   %> <form action="consulta_espectaculo.jsp"> <% } %>
                    <button type="submit" class="btn btn-secondary btn-lg btn-block">Volver</button>
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
        var btn_datos = document.getElementById('btn_datos');
        var listaPaquete = document.getElementById('listaPaquete');
        var btn_datos_fun = document.getElementById('btn_datos_fun');

        btn_datos.style.display = 'none';

        btn_datos_fun.style.display = 'none';
        listaPaquete.addEventListener('change', function(){
            btn_datos.style.display = 'inline';
        });

       
        var btn_datos_fun = document.getElementById('btn_datos_fun');
        btn_datos_fun.style.display = 'none';

        var listaFunciones = document.getElementById('listaFunciones');
        listaFunciones.addEventListener('change', function(){
            btn_datos_fun.style.display = 'inline';
        });


    </script>
</html>
