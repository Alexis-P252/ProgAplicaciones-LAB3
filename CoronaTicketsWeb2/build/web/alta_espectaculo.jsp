<!DOCTYPE html>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
<html lang="en">
    
<head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous" />
    <title>CoronaTickets</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    
</head>

<body>
    <%
     if(session.getAttribute("tipo") == null){
        %> <jsp:include page="error_identidad.jsp"/> <%
    }
    else if(session.getAttribute("tipo").equals("Espectador")){
        %> <jsp:include page="error_identidad.jsp"/> <%
    }
    else{
        
    // INICIALIZAMOS EL SISTEMA
    ISistema sis;
    SistemaFactory fabrica = SistemaFactory.getInstance();
    sis = fabrica.getISistema();
    
    String[] listaplataformas = sis.listarPlataformas();
    String[] listaArtistas = sis.listarArtistas();
    String[] listaCategorias = sis.listarCategorias();
    
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <a class="navbar-brand" href="index_art.jsp">CoronaTickets.uy</a>
                <form action="buscador_art.jsp" class="d-flex justify-content-between">
                    <div class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Espectaculo, Paquete" aria-label="Search" name="busqueda" />
                        <button class="btn btn-outline-dark" type="submit">Buscar</button>
                    </div>
                </form>
            </div>
            <div class="d-flex">
                 <h3 class="me-5">Alta de Espectaculo</h3>
                <h2> Bienvenido: <% out.println(session.getAttribute("user")); %></h2>
                <form action="cerrarSesion.jsp">
                    <button class="btn btn-outline-dark me-2" type="submit" data-bs-toggle="modal" data-bs-target="#modalRegistro">
                        Cerrar Sesion
                    </button>
                </form>
                
            </div>
        </div>
    </nav>




    </div>
    </nav>
    <div class="row mt-5">
        <div class="col-10">
            <!--Div contenido principal-->
            <div class="div-lista ml-2">
                <form action="alta_espectaculo2.jsp">
                    <div class="container">
       
                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Seleccione una plataforma</h4>
                            </div>
                            <div class="col-6">
                                <select name= "selector" id="listaPlataforma" class="form-select" multiple aria-label="multiple select example" >
                                    <% // CARGAMOS LA LISTA DE PLATAFORMAS EN EL SELECT

                                    if(listaplataformas[0] != null){
                                         int i = 1;
                                         for(String s: listaplataformas){

                                         %>
                                         <option  id="<% out.print(i); %>" value="<% out.print(s); %>"  > <% out.print(s); %></option>
                                         <%
                                         i++; 
                                         }
                                     }else{
                                         %>
                                         <option  id="MensajeError"  >No hay ninguna plataforma</option>
                                         <%
                                     }
                                     %>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Seleccione una o varias categorias</h4>
                            </div>
                            <div class="col-6">
                                 <% if(listaCategorias[0] != null){
                                        int i = 1;
                                        for(String s: listaCategorias){ %>
                                        <div class="form-check" name="selector2">
                                   
                                            <input class="form-check-input" type="checkbox" name="categorias" value="<% out.println(s);%>" id="<% out.println(s);%>">
                                            <label class="form-check-label" for="flexCheckDefault">
                                                <% out.print(s);%>
                                            </label>
                                        </div>        
                                        <% }
                                    }else{
                                        %> <div class="form-check" name="selector2">

                                                <input class="form-check-input" type="checkbox" value="">
                                                <label class="form-check-label" for="flexCheckDefault">
                                                    No hay ninguna categoria
                                                </label>
                                            </div>
                                    <%} %> 
                             </div>       
                        </div>
                        
                        
                        
                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Nombre</h4>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="text" name="nombre" placeholder="">
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Descripcion</h4>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="text" name="descripcion" placeholder="">
                            </div>
                        </div>


                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Duracion (min)</h4>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="text" name="duracion"  id="duracion" placeholder="" >
                            </div>
                        </div>

                        
                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>URL</h4>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="text" name="URL"  placeholder="">
                            </div>
                        </div>



                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Espectadores minimos</h4>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="text" name="esp_min"  placeholder="">
                            </div>
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Espectadores maximos</h4>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="text" name="esp_max"  placeholder="">
                            </div>
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Costo</h4>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="text" name="costo"  placeholder="">
                            </div>
                        </div>
                         
                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Descripcion del premio</h4>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="text" name="desc_premio"  placeholder="">
                            </div>
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Cantidad de premios</h4>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="text" name="cant_premios"  placeholder="">
                            </div>
                        </div>     
                             

                         <div class="row mt-3">
                            <div class="col-6">
                                <h4>Imagen (link)</h4>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="text" name="imagen" placeholder="">
                            </div>
                        </div>
                             
                         <div class="row mt-3">
                            <div class="col-6">
                                <h4>Video (link)</h4>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="text" name="video" placeholder="">
                            </div>
                        </div>     

                <br>
                <br>

                    </div>
                    <div class="row mt-6">
            
                        <div class="col-5">
                        </div>
                        <div class="col-4">
                                <button type="submit" class="btn btn-secondary btn-lg btn-block">Crear Espectaculo</button>
                        </div>
                        <div class="col-4">
                        </div>
                    </div>
                    <br> <br>
                </form>  
                
                
            </div>

        </div>
        <div class="col-2">
                <a class="list-group-item list-group-item-action" href="modificar_datos_art.jsp">Modificar mis datos</a>
                <a class="list-group-item list-group-item-action" href="consulta_usuario_art.jsp">Consulta usuario</a>
                <a class="list-group-item list-group-item-action" href="consulta_espectaculo_art.jsp">Consulta de Espectaculo</a>
                <a class="list-group-item list-group-item-action" href="consulta_funcion_art.jsp">Consulta de Funcion de Espectaculo</a>
                <a class="list-group-item list-group-item-action" href="consulta_paquete_art.jsp">Consulta de Paquete de Espectaculos</a>
                <a class="list-group-item list-group-item-action" href="alta_espectaculo.jsp">Alta de Espectaculo</a>
                <a class="list-group-item list-group-item-action" href="alta_funcion.jsp">Alta de Funcion de Espectaculo</a>
                <a class="list-group-item list-group-item-action" href="alta_paquete.jsp">Crear Paquete de Espectaculos</a>
                <a class="list-group-item list-group-item-action" href="agregar_espectaculo.jsp">Agregar Espectaculo a Paquete</a>
                <a class="list-group-item list-group-item-action" href="seguir_usuario_art.jsp">Seguir a un Usuario</a>
                <a class="list-group-item list-group-item-action" href="dejar_seguir_art.jsp">Dejar de seguir a un Usuario</a>
                <a class="list-group-item list-group-item-action" href="finalizar_espectaculo.jsp">Finalizar espectaculo</a>
        </div>
    </div>


    <% } %>
</body>

</html>