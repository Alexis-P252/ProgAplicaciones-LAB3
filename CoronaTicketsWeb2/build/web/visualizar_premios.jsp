<!DOCTYPE html>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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

    SimpleDateFormat ft2 = new SimpleDateFormat ("dd.MM.yyyy");
    
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
                 <h3 class="me-5">Visualizar premios</h3>
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
            List<DtPremio> premios  = sis.SorteosGanadosxEspectador(nickname); 
           
            if(premios.size() == 0){ %>
                  <h3 class="text-center"> No has ganado ni un premio</h3>  <%
            }
            else{
                 %>
                <div class="container"> <%
                 for(DtPremio dtP: premios){ %>
                 <form method="post" action="visualizar_premios2.jsp">
                       <div class="row mt-3">
                           <div class="col-6">
                               <h4 name="premio">Premio N° <% out.println(dtP.GetID()); %></h4>
                           </div>
                           <div class="col-6">
                               <h5>Espectaculo:  <b><% out.println(dtP.getEspectaculo()); %></b></h5>
                               <h5>Funcion:  <b><% out.println(dtP.getFuncion()); %></b></h5>  
                               <h5>Descripcion del premio:  <b><% out.println(dtP.getDesc_premio()); %></b></h5>  
                               <h5>Fecha de Sorteo:  <b><% out.println(ft2.format(dtP.getFecha_sorteo())); %></b></h5>
                               <h5>Fecha maxima para reclame:  <b><% out.println(ft2.format(dtP.getFecha_caduca())); %></b></h5>
                               <button type="submit" class="btn btn-secondary btn-lg btn-block" id="btn_datos_fun">Descargar comprobante</button>
                           </div>
                       </div>
                    </form>
                    <br>           
                 <%
                }
            }
   
                %></div> <%
            %>
            
            
            

        </div>
               
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
                <a class="list-group-item list-group-item-action" href="visualizar_premios.jsp"> Visualizar premios </a>
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