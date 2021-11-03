<%-- 
    Document   : consulta_espectaculo
    Created on : 28/10/2021, 09:41:07 AM
    Author     : User
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Logica.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <% String nickname = (String) session.getAttribute("user");
        if(nickname == null){
            %><jsp:include page="error_identidad.jsp"/> <%
        }
        else{
            
        
    %>
    <head>
        <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>CoronaTickets</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">CoronaTickets  &nbsp&nbsp&nbsp&nbsp Bienvenido <%out.println(nickname); %></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="pagina_principal.jsp">Pagina Principal</a></li>
                        <li><a href="consulta_espectaculo.jsp">Consulta de Espectaculo</a></li>
                        <li class="active"><a href="consulta_funcion.jsp">Consulta de Funcion de Espectaculo</a></li>
                       
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="login.jsp?cerrar=si"><span class="glyphicon glyphicon-log-in"></span> Cerrar Sesion</a></li>
                    </ul>
              </div>
            </div>
      </nav>
         <h3 class="text-center" id="msg_seleccionar">Seleccione una funcion</h3>
      
      <% 
        
//        pkgWS.PublicadorService service = new pkgWS.PublicadorService();
//        pkgWS.Publicador port = service.getPublicadorPort();
        
        ISistema sis;
        SistemaFactory fabrica = SistemaFactory.getInstance();
        sis = fabrica.getISistema();
        
        String espectaculo = (String) request.getParameter("espectaculo");
        
        String[] listafunciones = sis.listarFuncionesxEspectaculo(espectaculo);
        
 
        for(String s: listafunciones){

            if(s == null){ %>
                <h4 class="text-center">Este espectaculo no tiene ninguna funcion</h4>
                <script>
                    var msg_seleccionar = document.getElementById("msg_seleccionar");
                    msg_seleccionar.style.display = 'none';
                </script>
                
                <%
            }
            else{
                DtFuncion dtF = sis.MostrarFuncion(s);
                String imagen = dtF.getImagen();
                String nombre = dtF.getNombre();
                %>

                <div class="divimg center-block ">
                    <figure class="figure">
                        <a href="consulta_funcion3.jsp?funcion=<%out.println(nombre);%>">
                            <img src="<% out.println(imagen);%>" class="rounded img responsive center-block" id="img_espectaculo">
                        </a>
                        <figcaption name="espectaculo" value="<%out.println(nombre);%>" class="figure-caption txtimg"><%out.println(nombre);%></figcaption>
                    </figure> 
                </div> <%
            }      
        }
        %>
        <form method="post" action="consulta_funcion.jsp">
            <div class="form-group">
               <div class="col-xs-12">
                   <br>
                   <button class="btn btn-lg btn-success pull-right" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Volver</button>
               </div>
           </div> 
        </form>    
          
        <br> <br> <br> <br> <br> <br> 
        
    </body>
   
</html>


<style> 
.responsive {
     width: 100%;  
     border-radius: 15px;
     border-image: black 3px;
}

.divimg {
    width: 80%;
    padding: 10px;    
      
}

.txtimg {
    font-family: 'Noto Sans', sans-serif;
    font-size: 18px;    
}



body {
  font-family: 'Raleway', sans-serif;
}
.bg-dark {
  background-color: #105469 !important;
}

.nav-item:hover {
  color: #E2B842 !important;
}

h1 {
  color: #105469;
  font-weight: 700;
}

footer, footer .container .col{
  height: 200px;
}

</style>


 <% } %>