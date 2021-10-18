<%-- 
    Document   : bienvenida
    Created on : 02/10/2021, 10:50:04 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CoronaTickets</title>
    </head>
    <body>
        <% if (session.getAttribute("tipo") == null){
            %> <jsp:include page="index.jsp"/>  <%
        }
        else if (session.getAttribute("tipo").equals("Artista")){
            %> <jsp:include page="index_art.jsp"/>  <%
        }
        else{
             %> <jsp:include page="index_esp.jsp"/>  <%
        } %>
    </body>
</html>
