<%-- 
    Document   : cerrarSesion
    Created on : 30/09/2021, 11:15:07 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <title>CoronaTickets</title>
    </head>
    <body>
        <div class="container d-flex text-align-center justify-content-center"> 
                <h1>Sesion cerrada correctamente, nos vemos pronto <% out.println(session.getAttribute("user")); %></h1>
        </div>
        
        <%  session.invalidate();%>
        
        
        <div class="row mt-6">
            
            <div class="col-5">
            </div>
            <div class="d-flex justify-content-center">
                <form action="bienvenido.jsp">
                    <button type="submit" class="btn btn-secondary btn-lg btn-block">Volver</button>
                </form>
            </div>
    
            <div class="col-4">
            </div>
        </div>
    </body>
</html>
