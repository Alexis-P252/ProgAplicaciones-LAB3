<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validacion de Formulario</title>
    </head>
    <body>
        <% 
        ISistema sis;
        SistemaFactory fabrica = SistemaFactory.getInstance();
        sis = fabrica.getISistema();
            String nickname = (String) request.getParameter("nick");

            if(sis.UsuarioxNickname(nickname) == true){
                response.setHeader("BIEN" , "NO");
            }else
                 response.setHeader("BIEN", "SI");
            
        
        %>

            
    </body>
</html>
