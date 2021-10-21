<!DOCTYPE html>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>

<html lang="en">


<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="css/styles.css" rel="stylesheet" />
    <title> CoronaTickets </title>
</head>

<body>
    <%  
        if(session.getAttribute("tipo") == null){
            %> <jsp:include page="error_identidad.jsp"/> <%
        }
        else if(session.getAttribute("tipo").equals("Artista")){
            %> <jsp:include page="error_identidad.jsp"/> <%
        }
        else{       
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
                <a class="navbar-brand" href="#">CoronaTickets.uy</a>
                <form action="buscador_esp.jsp" class="d-flex justify-content-between">
                    <div class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Espectaculo, Paquete" aria-label="Search" name="busqueda" />
                        <button class="btn btn-outline-dark" type="submit">Buscar</button>
                    </div>
                </form>
            </div>
            <div class="d-flex">
                <h2> Bienvenido: <% out.println(session.getAttribute("user")); %></h2>
                <form action="cerrarSesion.jsp">
                    <button class="btn btn-outline-dark me-2" type="submit" data-bs-toggle="modal" data-bs-target="#modalRegistro">
                        Cerrar Sesion
                    </button>
                </form>
                
            </div>
        </div>
    </nav>

    <div id="principal">
        <div class="row mt-4">
            <div class="col-4">
            </div>
            
            <div class="col-4 mt-5">
                <div class="list-group">
                    <a class="list-group-item list-group-item-action" href="modificar_datos_esp.jsp">Modificar mis datos</a>
                    <a class="list-group-item list-group-item-action" href="consulta_usuario_esp.jsp">Consulta usuario</a>
                    <a class="list-group-item list-group-item-action" href="consulta_espectaculo_esp.jsp">Consulta de Espectaculo</a>
                    <a class="list-group-item list-group-item-action" href="consulta_funcion_esp.jsp">Consulta de Funcion de Espectaculo</a>
                    <a class="list-group-item list-group-item-action" href="consulta_paquete_esp.jsp">Consulta de Paquete de Espectaculos</a>
                    <a class="list-group-item list-group-item-action" href="compra_paquete.jsp">Compra de Paquete de Espectaculos</a>
                    <a class="list-group-item list-group-item-action" href="registro_a_funcion_de_espectaculo.jsp">Registro a Funcion de Espectaculo</a>
                    <a class="list-group-item list-group-item-action" href="seguir_usuario_esp.jsp">Seguir a un Usuario</a>
                    <a class="list-group-item list-group-item-action" href="dejar_seguir_esp.jsp">Dejar de seguir a un Usuario</a>
                    <a class="list-group-item list-group-item-action" href="valorar_espectaculo.jsp">Valorar un espectaculo</a>
                    <a class="list-group-item list-group-item-action" href="marcar_desmarcar_fav.jsp"> Marcar / Desmarcar Espectáculo como Favorito </a>
                </div>
            </div>
    
            <div class="col-4"></div>
           
            
        </div>
    </div>
    

    
    </div>
</body>

</html>
<% } %>