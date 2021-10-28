<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validacion de Formulario Email</title>
    </head>
    <body>
        <% 
        ISistema sis;
        SistemaFactory fabrica = SistemaFactory.getInstance();
        sis = fabrica.getISistema();
            String email = (String) request.getParameter("email");
                if(sis.UsuarioxEmail(email) == true){
                    response.setHeader("CORRECTO" , "NO");
                }else{
                    response.setHeader("CORRECTO" , "SI");
                }
        
        %>

            
    </body>
</html>
