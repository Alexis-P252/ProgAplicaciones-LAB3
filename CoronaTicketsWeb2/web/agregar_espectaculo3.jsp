<!DOCTYPE html>
<%@page import="Logica.*" %>
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
        else if(session.getAttribute("tipo").equals("Espectador")){
            %> <jsp:include page="error_identidad.jsp"/> <%
        }
        else{
        
        ISistema sis;
        SistemaFactory fabrica = SistemaFactory.getInstance();
        sis = fabrica.getISistema();
        
        String paquete = (String) request.getParameter("paquete");
        String espectaculo = (String) request.getParameter("espectaculo");
        
        if (paquete.equals("No hay ningun paquete")|| paquete.equals("")|| espectaculo.equals("No hay ningun espectaculo")||espectaculo.equals("")){
            %><p>OPCION INVALIDA</p><%
             if(paquete.equals("No hay ningun paquete")||paquete.equals("")){
                 %><p>No hay paquete </p><%
             }
             if(espectaculo.equals("No hay ningun espectaculo")||espectaculo.equals("")){
                 %><p>No hay espectaculo</p><%
             }
        }else{
            if(sis.EspectaculoenPaq(paquete, espectaculo) == true){
                %><p>ERROR: Este espectaculo ya pertenece a este paquete</p><%

            }else{
                sis.AddEspectaculoaPaquete(paquete, espectaculo);
                %><p>ESPECTACULO AGREGADO CORRECTAMENTE AL PAQUETE</p><%
            }
        }
        
            
        
       
    %>
    <div class="row mt-6">
            
            <div class="col-5">
            </div>
            <div class="col-4">
                <form action="index_art.jsp">
                    <button type="submit" class="btn btn-secondary btn-lg btn-block">Volver</button>
                </form>
            </div>
    
            <div class="col-4">
            </div>
    </div>
    
</body>
    
</html>
<% } %>