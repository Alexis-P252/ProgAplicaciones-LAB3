<!DOCTYPE html>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
    else if(session.getAttribute("tipo").equals("Artista")){
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
                <a class="navbar-brand" href="index_esp.jsp">CoronaTickets.uy</a>
                <form action="buscador_esp.jsp" class="d-flex justify-content-between">
                    <div class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Espectaculo, Paquete" aria-label="Search" name="busqueda" />
                        <button class="btn btn-outline-dark" type="submit">Buscar</button>
                    </div>
                </form>
            </div>
            <div class="d-flex">
                 <h3 class="me-5">Valorar un  Espectaculo</h3>
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
            <%
            String nickname = (String) session.getAttribute("user");
            List funciones = sis.listarfuncionesRealizadasxEspectador(nickname);
            List espectaculos = sis.listaEspectaculosSegunFunciones(funciones);
            
            if(espectaculos.size() == 0){ %>
            <h3>No puedes valorar ningun espectaculo</h3>
            <%}
            else{ %>
                
                <div class="div-lista ml-2">
                    <form action="valorar_espectaculo2.jsp">
                        <select name= "selector"id="listaEspectaculos" class="form-select w-25" aria-label="Default select example">
                            <option selected>Seleccione un espectaculo </option>
                            <% // CARGAMOS LA LISTA DE ESPECTACULOS EN EL SELECT
                            int i = 1;    
                            for(Object x: espectaculos){
                                String s = (String) x;
                            %>
                            <option  id="<% out.print(i); %>" value="<% out.print(s); %>"  > <% out.print(s); %></option>
                            <%
                            i++; 
                            }
                             %>

                        </select>
                         <% if(i>1){ %>
                            <button type="submit" id="btn_elegir" class="mt-2 btn btn-secondary btn-lg btn-block"> Elegir Espectaculo </button> <%
                         } %>
                         
                    </form>  


                </div>

        </div>
        <%}%>             
        <div class="col-2">
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

</body>
<script>
            var btn_elegir = document.getElementById('btn_elegir');
            var listaEspectaculos = document.getElementById('listaEspectaculos');
        
            btn_elegir.style.display = 'none';
        
            listaEspectaculos.addEventListener('change', function(){
                btn_elegir.style.display = 'inline';
            });
    
</script>
</html>

  <% } %>