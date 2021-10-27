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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
        <title>CoronaTickets</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                     <a class="navbar-brand" href="index_art.jsp">CoronaTickets.uy</a>
                </div>
            </div>
        </nav>
        <%
            ISistema sis;
            SistemaFactory fabrica = SistemaFactory.getInstance();
            sis = fabrica.getISistema();
            
            SimpleDateFormat ft = new SimpleDateFormat ("dd.MM.yyyy '-' HH:mm:ss");
            SimpleDateFormat ft2 = new SimpleDateFormat ("dd.MM.yyyy");

            String funcion = (String) request.getParameter("selector");
            
             if(funcion.equals("El espectaculo no tiene ninguna funcion") || funcion == null){
                out.print("OPCION INVALIDA"); %>
                <form action="index_art.jsp"> 
                    <button type="submit" class="btn btn-secondary btn-lg btn-block">Volver</button>
                </form>
            <%}
            else{
            
            DtFuncion dtF = sis.MostrarFuncion(funcion);
            String nombre = dtF.getNombre();
            Date fecha_registro = dtF.getFecha_registro();
            Date fecha_hora = dtF.getFecha_hora();
            Date actual = new Date();
            String imagen = dtF.getImagen();
            boolean sorteado = dtF.getSorteado();
            
            String[] artistas = sis.Artistasinvitados(funcion);
            
        %>
        <div class="container">

        <div class="row mt-3">
            <div class="col-6">
                <h4>Nombre</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" name="<% out.println(nombre); %>" readonly placeholder="<% out.println(nombre); %>">
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-6">
                <h4>Fecha y hora</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<% out.println(ft.format(fecha_hora)); %>">
            </div>
        </div>


        <div class="row mt-3">
            <div class="col-6">
                <h4>Fecha de alta</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<% out.println(ft.format(fecha_registro)); %>">
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
                <h4>Artistas invitados</h4>
            </div>
            <div class="col-6">
                <form action="consulta_usuario2.jsp">
                    <select name= "selector" id="listaArtistas" class="form-select" multiple aria-label="multiple select example">
                        <% // CARGAMOS LA LISTA DE ARTISTAS INVITADOS A LA FUNCION
                        int i = 1;
                        if(artistas[0] != null){
                            i = 1;
                            for(String s: artistas){
        
                            %>
                            <option  id="<% out.print(i); %>" value="<% out.print(s); %>"> <% out.print(s); %></option>
                            <%
                            i++; 
                            }
                        }
                         %>
                    </select>
                        <% if(i > 1){ %>
                            <button type="submit" class="btn btn-secondary btn-lg btn-block" id="btn_ver_datos">Ver datos artista</button>    
                        <% } %>
                </form>
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <%
        
        if(fecha_hora.after(actual)){ // LA FUNCION NO SE HA REALIZADO %>
            <h3 class="text-center"> Esta funcion todavia no se ha realizado,no se pueden sortear premios</h3> 
        <% } 
        else{ 
            if(sorteado){

            List ganadores = sis.GanadoresdeSorteo(funcion);
            %>
                <h3 class="text-center"> Ya se realizo el sorteo de esta funcion.</h3>
                
                <div class="row mt-3">
                    <div class="col-6">
                        <h4>Ganadores</h4>
                    </div>
                    <div class="col-6">
                         <select name= "selector" id="listaPaquete" class="form-select" multiple aria-label="multiple select example">
                        <% // CARGAMOS LA LISTA DE PAQUETES DEL ESPECTACULO
                        int k = 1;
                        if(ganadores != null){
                            k = 1;
                            for(Object o: ganadores){
                                String s = (String) o;
                            %>
                            <option  id="<% out.print(k); %>" value="<% out.print(o); %>"> <% out.print(o); %></option>
                            <%
                            k++;
                            }
                        }else{
                            %>
                            <option  id="MensajeError" > <% out.print("Al parecer no hubo ganadores..."); %></option>
                            <%
                        }
                        
                         %>
                    </select>
                    </div>
                </div>
            <%}
            else{ 
                String[] registrados = sis.listarEspectadoresxFuncion(funcion);
                if(registrados[0].equals("vacio")){ %>
                    <h3 class="text-center"> Ningun espectador se registro a esta funcion.</h3> <%
                }
                else{ %>
                <form action="sortear_premios4.jsp">
                    <input hidden class="form-control" type="text" id="invisible" name="funcion" value="<% out.println(funcion); %>"  readonly placeholder="">
                    <div class="row mt-3">
                        <div class="col-6">
                            <h4>Espectadores registrados</h4>
                        </div>
                        <div class="col-6">
                            <select id="listaEspectadores" class="form-select" multiple aria-label="multiple select example">
                                <% // CARGAMOS LA LISTA DE ESPECTADORES REGISTRADOS A LA FUNCION
                                int k = 1;
                                if(registrados[0] != null){
                                    k = 1;
                                    for(String s: registrados){

                                    %>
                                    <option  id="<% out.print(k); %>" value="<% out.print(s); %>"> <% out.print(s); %></option>
                                    <%
                                    k++; 
                                    }
                                }
                                 %>
                            </select>
                        </div>
                        <div class="mt-2 col d-flex justify-content-center">
                               <button type="submit" class="btn btn-secondary btn-lg btn-block">Sortear</button>
                        </div>
                    </div>
                </form>            
                <%}

            %>
                
                 
                 
            <%}
        }
        %>        
                
    
<br>
            <div class="mt-2 col d-flex justify-content-center">
                <form action="sortear_premios.jsp"> 
                    <button type="submit" class="btn btn-secondary btn-lg btn-block">Volver</button>
                </form>
            </div>     
            
<br>
<br>       

    </div>
    </body>
    <%
   }
    %>

    <script>
        var btn_ver_datos = document.getElementById('btn_ver_datos');
        var listaArtistas = document.getElementById('listaArtistas');

        btn_ver_datos.style.display = 'none';
        
        var invisible = document.getElementById("invisible");
        invisible.style.display = 'none';

        listaArtistas.addEventListener('change', function(){
            btn_ver_datos.style.display = 'inline';
        });
    </script>
</html>
