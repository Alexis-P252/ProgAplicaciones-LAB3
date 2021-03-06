<%-- 
    Document   : pagina_principal
    Created on : 27/10/2021, 05:22:19 PM
    Author     : User
--%>

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
                        <li class="active"><a href="pagina_principal.jsp">Pagina Principal</a></li>
                        <li><a href="consulta_espectaculo.jsp">Consulta de Espectaculo</a></li>
                        <li><a href="consulta_funcion.jsp">Consulta de Funcion de Espectaculo</a></li>
                       
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="login.jsp?cerrar=si"><span class="glyphicon glyphicon-log-in"></span> Cerrar Sesion</a></li>
                    </ul>
              </div>
            </div>
        </nav>
        <h3 class="text-center">Pagina principal</h3>
        <br> <br> <br> <br> <br> <br>
        <div class="col-auto p-5 text-center">
            <img src="assets/img/virus.png" class="responsive" width="200" height="200" alt="alt"/>
        </div>
        
        
    </body>
    <% } %>
</html>
 
<style> 
.responsive {
  max-width: 100%;
  height: auto;
}

</style>