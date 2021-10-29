<%-- 
    Document   : procesado_login
    Created on : 27/10/2021, 05:15:56 PM
    Author     : User
--%>
<%@page import="Logica.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CoronaTickets</title>
    </head>
    <body>
      <% 
        String nickname  = (String) request.getParameter("nickname"); 
        String password = (String) request.getParameter("password");
        
        pkgWS.PublicadorService service = new pkgWS.PublicadorService();
        pkgWS.Publicador port = service.getPublicadorPort();
        
        if(port.comprobarLogin(nickname, password, "Espectador") == false){ 
        %>
        <form action="login.jsp" method="post" id="form" name="formulario">
            <input hidden class="form-control" type="text" id="invisible" name="error" value="si"  readonly placeholder="">      
        </form>
        <script>
            document.formulario.submit();
            
        </script>
        <%}
        else{
            HttpSession sesion = request.getSession();
            sesion.setAttribute("user", nickname);
            sesion.setAttribute("tipo", "Espectador");
%>      <jsp:include page="pagina_principal.jsp"/>
        <%}
        
      %>
      
    </body>
</html>