<%-- 
    Document   : consulta_funcion2
    Created on : 29/09/2021, 11:23:50 AM
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
                
                String nickname = (String) session.getAttribute("user");
                String espectaculo = (String) request.getParameter("selector");
                
                if(espectaculo.equals("No hay espectaculos disponibles en la plataforma")){
                    out.println("OPCION INVALIDA");
                    if(session.getAttribute("tipo") != null){
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
                <%
                }
                else{
                String[] listafunciones = sis.listarFuncionesxEspectaculo(espectaculo);

            %>

            <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <div class="div-lista ml-2">
                    <form action="registro_a_funcion_de_espectaculo4.jsp">
                    <select name= "selector"id="listaEspectaculo" class="form-select" multiple aria-label="multiple select example">
                        <% // CARGAMOS LA LISTA DE FUNCIONES DEL ESPECTACULO EN EL SELECT
                       
                        if(listafunciones[0] != null){
                             int i = 1;
                             for(String s: listafunciones){

                             %>
                             <option  id="<% out.print(i); %>" value="<% out.print(s); %>"  > <% out.print(s); %></option>
                             <%
                             i++; 
                             }
                         }else{
                             %>
                             <option  id="MensajeError"  >El espectaculo no tiene ninguna funcion</option>
                             <%
                         }
                         %>
                    </select>
   
                             <% if(sis.alMenos3Registros(nickname) == true){
                                    List lisRegistro = sis.ListarRegistros(nickname);  %>
                            
                                    <div class="row mt-3">
                                        <div class="col-6">
                                            <h4>Seleccione 0 o 3 registros</h4>
                                        </div>
                                        
                                        <div class="col-6">
                                        <%  int i = 0;
                                            for(Object x: lisRegistro){
                                                DtRegistro r = (DtRegistro) x;
                                                if(r != null){ %>
                                                    <div class="form-check" name="selector2">
                                                        <input class="form-check-input" type="checkbox" name="registros" value="<% out.println(r.getFuncion());%>" id="<% out.println(r.getFuncion());%>">
                                                        <label class="form-check-label" for="flexCheckDefault">
                                                            <% out.print(r.getFuncion() + " - " + ft2.format(r.getFecha()));%> 
                                                        </label>
                                                    </div> <%
                                                }
                                                else{ %>                      
                                                    <div class="form-check" name="selector2">
                                                        <label class="form-check-label" for="flexCheckDefault">
                                                        </label>
                                                    </div> <%
                                                }
                                            }%>       
                                        </div>       
                                    </div>          
                            <% } %>
                            <button type="submit" class="mt-2 btn btn-secondary btn-lg" id="btn_registro">Registrarse a funcion</button>
                            <input id="invisible" name="invisible" value="<%out.println(espectaculo);%>">
                    </form>         
                            

                    <form action="bienvenida.jsp">
                        <button type="submit" class="mt-2 btn btn-secondary btn-lg">Volver</button>
                    </form>
               
            </div>
            </div>
             
            </div>
            <div class="col-4"></div>

            </div>
        </div>

    </body>
        <%
            }
        %>    

        <script>
            var btn_invisible = document.getElementById('invisible');
            btn_invisible.style.display = 'none';
            
            var btn_mostrar_funcion = document.getElementById('btn_mostrar_funcion');
            var listaEspectaculo = document.getElementById('listaEspectaculo');
            var btn_registro = document.getElementById('btn_registro');
            
            btn_mostrar_funcion.style.display = 'none';
            btn_registro.style.display = 'none';
            
            listaEspectaculo.addEventListener('change', function(){
                btn_mostrar_funcion.style.display = 'inline';
                btn_registro.style.display = 'inline';
            });
        </script>
</html>
