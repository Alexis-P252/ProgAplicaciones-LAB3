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
                    <% if(session.getAttribute("tipo") != null){
                            if(session.getAttribute("tipo").equals("Artista")){
                                %> <a class="navbar-brand" href="index_art.jsp">CoronaTickets.uy</a><%
                            }
                            else if (session.getAttribute("tipo").equals("Espectador")) {
                                 %> <a class="navbar-brand" href="index_esp.jsp">CoronaTickets.uy</a> <%
                            }
                        }
                        else{   %> <a class="navbar-brand" href="index.jsp">CoronaTickets.uy</a> <% } %>
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
                <% if(session.getAttribute("tipo") != null){
                            if(session.getAttribute("tipo").equals("Artista")){
                                %> <form action="consulta_funcion_art.jsp"><%
                            }
                            else if (session.getAttribute("tipo").equals("Espectador")) {
                                 %> <form action="consulta_funcion_esp.jsp"> <%
                            }
                        }
                        else{   %> <form action="consulta_funcion.jsp"> <% } %>
                    <button type="submit" class="btn btn-secondary btn-lg btn-block">Volver</button>
                </form>
            <%}
            else{
            
            DtFuncion dtF = sis.MostrarFuncion(funcion);
            String nombre = dtF.getNombre();
            Date fecha_registro = dtF.getFecha_registro();
            Date fecha_hora = dtF.getFecha_hora();
            String imagen = dtF.getImagen();
            String[] artistas = sis.Artistasinvitados(funcion);
            
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
        <div class="row mt-6">
            
            <div class="col-5">
            </div>
            <div class="col-4">
                <% if(session.getAttribute("tipo") != null){
                        if(session.getAttribute("tipo").equals("Artista")){
                            %> <form action="consulta_funcion_art.jsp"><%
                        }
                        else if (session.getAttribute("tipo").equals("Espectador")) {
                             %> <form action="consulta_funcion_esp.jsp"> <%
                        }
                    }
                    else{   %> <form action="consulta_funcion.jsp"> <% } %>
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
        var btn_ver_datos = document.getElementById('btn_ver_datos');
        var listaArtistas = document.getElementById('listaArtistas');

        btn_ver_datos.style.display = 'none';

        listaArtistas.addEventListener('change', function(){
            btn_ver_datos.style.display = 'inline';
        });
    </script>
</html>
