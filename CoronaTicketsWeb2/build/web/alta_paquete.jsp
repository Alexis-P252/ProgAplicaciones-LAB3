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
                 <h3 class="me-5">Alta de Paquete de Espectaculos</h3>
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
                <form action="alta_paquete2.jsp">
                    <div class="container">
       
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
                                <h4>Descuento (%)</h4>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="text" name="descuento"  id="fecha" placeholder="" >
                            </div>
                        </div>

                        
                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Fecha inicio</h4>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="date" name="f_ini"  placeholder="">
                            </div>
                        </div>



                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Fecha final</h4>
                            </div>
                            <div class="col-6">
                                <input class="form-control" type="date" name="f_fin"  placeholder="">
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

                <br>
                <br>

                    </div>
                     <button type="submit"> Crear Paquete </button>
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

    
    
</body>

</html>

<% } %>