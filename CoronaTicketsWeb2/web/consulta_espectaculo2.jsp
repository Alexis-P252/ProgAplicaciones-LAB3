<%-- 
    Document   : consulta_espectaculo2
    Created on : 29/09/2021, 11:23:50 AM
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
                    <%if(session.getAttribute("tipo") != null){
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

                String plataforma = (String) request.getParameter("selector");
                if(plataforma.equals("Seleccione una plataforma")){
                    out.println("OPCION INVALIDA"); 
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
                <%
                }
                else{
                String[] listaespectaculos = sis.listarEspectaculosAceptadosxPlataforma(plataforma);

            %>

            <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <div class="div-lista ml-2">
                    <form action="consulta_espectaculo3.jsp">
                    <select name= "selector" id="listaEspectaculo" class="form-select" multiple aria-label="multiple select example" >
                        <% // CARGAMOS LA LISTA DE ESPECTACULOS EN EL SELECT
                       
                        if(listaespectaculos[0] != null){
                             int i = 1;
                             for(String s: listaespectaculos){
                             if(listaespectaculos[i-1] != null){
                                 %>
                                <option  id="<% out.print(i); %>" value="<% out.print(s); %>"  > <% out.print(s); %></option>
                                <%
                                i++; 
                                }
                             }      
                         }else{
                             %>
                             <option  id="MensajeError"  >No hay espectaculos disponibles en la plataforma</option>
                             <%
                         }
                         %>
                    </select>
                        
                        <button type="submit" class="mt-2 btn btn-secondary btn-lg" id='btn_espectaculo'>Elegir Espectaculo</button>
                    </form>
                        <%
                        if(session.getAttribute("tipo") != null){
                            if(session.getAttribute("tipo").equals("Artista")){
                                %> <form action="consulta_espectaculo_art.jsp"> <%
                            }       
                            else if (session.getAttribute("tipo").equals("Espectador")) {
                                %><form action="consulta_espectaculo_esp.jsp"> <%
                            }
                        }
                        else{   %> <form action="consulta_espectaculo.jsp"> <% } %>
                            <button type="submit" class="mt-2 btn btn-secondary btn-lg">Elegir otra plataforma</button>
                        </form>
            </div>
            <div class="col-4"></div>

            </div>
        </div>

    </body>
        <%
            }
        %>    
        <script>
            var btn_espectaculo = document.getElementById('btn_espectaculo');
            var listaEspectaculo = document.getElementById('listaEspectaculo');
        
            btn_espectaculo.style.display = 'none';
        
            listaEspectaculo.addEventListener('change', function(){
                btn_espectaculo.style.display = 'inline';
            });
        </script>
</html>
