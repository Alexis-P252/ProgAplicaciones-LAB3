<!DOCTYPE html>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
    <title>CoronaTickets</title>
    <!-- CSS only -->
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
            // INICIALIZAMOS EL SISTEMA
            ISistema sis;
            SistemaFactory fabrica = SistemaFactory.getInstance();
            sis = fabrica.getISistema();
            
            SimpleDateFormat ft = new SimpleDateFormat ("dd.MM.yyyy '-' HH:mm:ss");
            SimpleDateFormat ft2 = new SimpleDateFormat ("dd.MM.yyyy");

            String nickname = (String) request.getParameter("selector");
            
            if(nickname.equals("Seleccione un usuario")){
                out.print("OPCION INVALIDA");
                
                if(session.getAttribute("tipo") != null){
                    if(session.getAttribute("tipo").equals("Artista")){
                        %> <form action="consulta_usuario_art.jsp"> <%
                    }
                    else if (session.getAttribute("tipo").equals("Espectador")) {
                         %> <form action="consulta_usuario_esp.jsp"> <%
                    }
                }
                else{   %> <form action="consulta_usuario.jsp"> <% } %>
 
                    <button type="submit" class="btn btn-secondary btn-lg btn-block">Volver</button>
                </form>
            <%}
            else{
                
                DtUsuario dtU = sis.GetDtUsuario(nickname);

                String nombre = dtU.GetNombre();
                String apellido = dtU.GetApellido();
                String correo = dtU.GetEmail();
                String imagen = dtU.GetImagen();
                Date f = dtU.GetFecha_Nac();
                String[] seguidores = sis.listarSeguidores(nickname);
                String[] seguidos = sis.listarSeguidos(nickname);

                String biografia = "No Corresponde";
                String descripcion = "No Corresponde";
                String link = "No Corresponde";
                %>
                
               
    <div class="container">
        
        <div class="row mt-3">
            <div class="col-6">
                <h4>Nickname</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<%out.print(nickname);%>">
            </div>
        </div>
        
        <div class="row mt-3">
            <div class="col-6">
                <h4>Nombre</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<%out.print(nombre);%>">
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-6">
                <h4>Apellido</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<%out.print(apellido);%>">
            </div>
        </div>


        <div class="row mt-3">
            <div class="col-6">
                <h4>Email</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<%out.print(correo);%>">
            </div>
        </div>
            
        <div class="row mt-3">
            <div class="col-6">
                <h4>Fecha Nacimiento</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly id="fecha" placeholder="<%out.print(ft2.format(f));%>" >
            </div>
        </div>

        <%
            if(dtU instanceof DtArtista){

                DtArtista dtArt = (DtArtista) dtU;
                biografia = dtArt.GetBiografia();
                descripcion = dtArt.GetDescripcion();
                link = dtArt.GetLink();
                
               String[] listaEspectaculos = sis.listarespectaculosXArtista(nickname);
              
        %>        
        <div class="row mt-3">
            <div class="col-6">
                <h4>Sitio Web</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<%out.print(link);%>">
            </div>
        </div>
        
        

        <div class="row mt-3">
            <div class="col-6">
                <h4>Descripcion</h4>
            </div>
            <div class="col-6">
                <input class="h-700 form-control" type="text" readonly placeholder="<%out.print(descripcion);%>">
            </div>
        </div>
        
        <div class="row mt-3">
            <div class="col-6">
                <h4>Biografia</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<%out.print(biografia);%>">
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-6">
                <h4>Espectaculos organizados</h4>
            </div>
            <div class="col-6">
                <form action="consulta_espectaculo3.jsp">
                    <select name= "selector" id="listaEspectaculos" class="form-select" multiple aria-label="multiple select example">
                        <% int j = 1;
                        // CARGAMOS LA LISTA DE ESPECTACULOS ORGANIZADOS
                        if(listaEspectaculos[0] != null){
                            j = 1;
                            for(String s: listaEspectaculos){
        
                            %>
                            <option  id="<% out.print(j); %>" value="<% out.print(s); %>"> <% out.print(s); %></option>
                            <%
                            j++; 
                            }
                        }else{
                            %>
                            <option  id="MensajeError" > <% out.print("No tiene espectaculos organizados"); %></option>
                            <%
                        }
                        
                         %>
                    </select>  
                        <% if(j > 1){ %>

                            <button type="submit" id="btn_espectaculo" class="btn btn-secondary btn-lg btn-block">Ver datos espectaculo</button>    
                        <% } %>
                </form>
                    
            </div>
        </div>
        
        <% 
            }
            else{ // ES ESPECTADOR
                String[] listaFunciones = sis.listarfuncionesxEspectador(nickname);
                
            
        %>

        <div class="row mt-3">
            <div class="col-6">
                <h4>Registros a funciones</h4>
            </div>
            <div class="col-6">
                <form action="consulta_funcion4.jsp">
                    <select name= "selector" id="listaRegistros" class="form-select" multiple aria-label="multiple select example">
                        <% int i = 1; 
                            // CARGAMOS LA LISTA DE REGISTROS A FUNCIONES
                        if(listaFunciones[0] != null){
                            i = 1;
                            for(String s: listaFunciones){
                            
                            %>
                            <option  id="<% out.print(i); %>" value="<% out.print(s); %>"  > <% out.print(s); %></option>
                            <%
                            i++; 
                            }
                        }else{
                            %>
                            <option  id="MensajeError"  > <% out.print("No tiene registros a funciones"); %></option>
                            <%
                        }
                        %>
                    </select>
                        <% if(i > 1){ %>
                            <button type="submit" class="btn btn-secondary btn-lg btn-block">Ver datos funcion</button>    
                        <% } %>
                        
                        
                </form>
                    
            </div>
        </div>
         <% 
                String logueado = (String) session.getAttribute("user");
                if(logueado != null){
                    if(logueado.equals(nickname)){
                        String[] paquetes = sis.listarPaquetesComprados(nickname); %>
                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Paquetes comprados</h4>
                            </div>
                            <div class="col-6">
                                <form action="consulta_paquete2.jsp">
                                    <select name= "selector" id="listaPaquetes" class="form-select" multiple aria-label="multiple select example">
                                        <% int q = 1; 
                                            // CARGAMOS LA LISTA DE REGISTROS A FUNCIONES
                                        if(paquetes[0] != null){
                                            q = 1;
                                            for(String s: paquetes){

                                            %>
                                            <option  id="<% out.print(q); %>" value="<% out.print(s); %>"  > <% out.print(s); %></option>
                                            <%
                                            q++; 
                                            }
                                        }else{
                                            %>
                                            <option  id="MensajeError"  > <% out.print("No ha comprado ningun paquete"); %></option>
                                            <%
                                        }
                                        %>
                                    </select>
                                        <% if(q > 1){ %>
                                            <button type="submit" id="btn_paquetes" class="btn btn-secondary btn-lg btn-block">Ver datos paquete</button>    
                                        <% } %>
                                </form>
                            </div>
                        </div> <%
                    }
                }
            }
         %> 
         
         <div class="row mt-3">
            <div class="col-6">
                <h4>Seguidores</h4>
            </div>
            <div class="col-6">
                <form action="consulta_usuario2.jsp">
                    <select name= "selector" id="listaSeguidores" class="form-select" multiple aria-label="multiple select example">
                        <% // CARGAMOS LA LISTA DE SEGUIDORES
                        int k = 1;
                        if(seguidores != null){
                            k = 1;
                            for(String s: seguidores){
        
                            %>
                            <option  id="<% out.print(k); %>" value="<% out.print(s); %>"> <% out.print(s); %></option>
                            <%
                            k++;
                            }
                            if(k == 1){
                                %>
                                <option  id="MensajeError" > <% out.print("No tiene ningun seguidor"); %></option>
                                <%
                            }
                        }else{
                            %>
                            <option  id="MensajeError" > <% out.print("No tiene ningun seguidor"); %></option>
                            <%
                        }
                        
                         %>
                    </select>
                        <% if(k > 1){ %>
                            <button type="submit" id="btn_seguidores" class="btn btn-secondary btn-lg btn-block">Ver datos usuario</button>    
                        <% } %>
                        
                        
                </form>
            </div>
        </div>
                        
        <div class="row mt-3">
            <div class="col-6">
                <h4>Seguidos</h4>
            </div>
            <div class="col-6">
                <form action="consulta_usuario2.jsp">
                    <select name= "selector" id="listaSeguidos" class="form-select" multiple aria-label="multiple select example">
                        <% // CARGAMOS LA LISTA DE SEGUIDORES
                        int b = 1;
                        if(seguidos != null){
                            b = 1;
                            for(String s: seguidos){
        
                            %>
                            <option  id="<% out.print(b); %>" value="<% out.print(s); %>"> <% out.print(s); %></option>
                            <%
                            b++;
                            }
                            if(b == 1){
                                %>
                                <option  id="MensajeError" > <% out.print("No tiene ningun seguidor"); %></option>
                                <%
                            }
                        }else{
                            %>
                            <option  id="MensajeError" > <% out.print("No tiene ningun seguidor"); %></option>
                            <%
                        }
                        
                         %>
                    </select>
                        <% if(b > 1){ %>
                            <button type="submit" id="btn_seguidos" class="btn btn-secondary btn-lg btn-block">Ver datos usuario</button>    
                        <% } %>
                        
                        
                </form>
            </div>
        </div>
         
         
         <div class="row mt-3">
            <div class="col-6">
                <h4>Imagen</h4>
            </div>
            <div class="col-6">
                <img src="<% out.println(imagen); %>" alt="Este usuario no tiene ninguna imagen o hubo un error al procesarla" width="200" height="200"> 
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
                        %> <form action="consulta_usuario_art.jsp"> <%
                    }
                    else if (session.getAttribute("tipo").equals("Espectador")) {
                         %> <form action="consulta_usuario_esp.jsp"> <%
                    }
                }
                else{   %> <form action="consulta_usuario.jsp"> <% } %>
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
        var listaEspectaculos = document.getElementById('listaEspectaculos');
        var btn_espectaculo = document.getElementById('btn_espectaculo');

        btn_espectaculo.style.display = 'none';
 
        listaEspectaculos.addEventListener('change', function(){
            btn_espectaculo.style.display = 'inline';
        });

        var listaSeguidores = document.getElementById('listaSeguidores');
        var btn_seguidores = document.getElementById('btn_seguidores');

        btn_seguidores.style.display = 'none';
 
        listaSeguidores.addEventListener('change', function(){
            btn_seguidores.style.display = 'inline';
        });

        var listaSeguidos = document.getElementById('listaSeguidos');
        var btn_seguidos = document.getElementById('btn_seguidos');

        btn_seguidos.style.display = 'none';
 
        listaSeguidos.addEventListener('change', function(){
            btn_seguidos.style.display = 'inline';
        });

<<<<<<< HEAD
       
=======

>>>>>>> 5526806314e18bfc4e193892ca852777bdbd8644
</script>
</html>