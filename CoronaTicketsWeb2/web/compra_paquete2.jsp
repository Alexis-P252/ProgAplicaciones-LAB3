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
            ISistema sis;
            SistemaFactory fabrica = SistemaFactory.getInstance();
            sis = fabrica.getISistema();

            String paquete = (String) request.getParameter("selector");
            String nickname = (String) session.getAttribute("user");

            if(sis.espectadorComproPaquete(nickname, paquete) == true){
                out.println("ERROR: Ya compraste este paquete antes");
            }
            else{
                out.println("Paquete de espectaculos comprado correctamente");
                sis.comprarPaquete(nickname, paquete);
            }


    %>
    <div class="row mt-6">
            
            <div class="col-5">
            </div>
            <div class="col-4">
                <form action="bienvenida.jsp">
                    <button type="submit" class="btn btn-secondary btn-lg btn-block">Volver</button>
                </form>
            </div>
    
            <div class="col-4">
            </div>
    </div>
  
</body>
    
</html>

  <% } %>