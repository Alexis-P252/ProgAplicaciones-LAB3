<!DOCTYPE html>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
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
    else if(session.getAttribute("tipo").equals("Espectador")){
        %> <jsp:include page="error_identidad.jsp"/> <%
    }
    else{  %>   
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                    <a class="navbar-brand" href="index_art.jsp">CoronaTickets.uy</a> 
                </div>
            </div>
        </nav>
            <% 
                ISistema sis;
                SistemaFactory fabrica = SistemaFactory.getInstance();
                sis = fabrica.getISistema();

                

                String espectaculo = (String) request.getParameter("selector");
              
                String[] listafunciones = sis.listarFuncionesxEspectaculo(espectaculo);

            %>

            <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <div class="div-lista ml-2">
                    <form action="sortear_premios3.jsp">
                    <select name= "selector"id="listaFunciones" class="form-select" multiple aria-label="multiple select example">
                        <% // CARGAMOS LA LISTA DE FUNCIONES DEL ESPECTACULO EN EL SELECT
                        int i = 1;
                        if(listafunciones[0] != null){
                             
                             for(String s: listafunciones){

                             %>
                             <option  id="<% out.print(i); %>" value="<% out.print(s); %>"  > <% out.print(s); %></option>
                             <%
                             i++; 
                             }
                        }else{ %>
                                <option  id="MensajeError"  >El espectaculo no tiene ninguna funcion</option> <%
                                 
                            }
                         %>
                        </select>
                        <% if(i>1){ %>
                            <button type="submit" class="btn btn-secondary btn-lg" id="elegir_funcion">Elegir Funcion</button>
                         <%} %>     
                    </form>
                    <form action="sortear_premios.jsp">
                        <button type="submit" class="btn btn-secondary btn-lg">Volver</button>
                    </form>
            </div>
            <div class="col-4"></div>

            </div>
        </div>

</body>
<script>
     var listaFunciones = document.getElementById("listaFunciones");
     var elegir_funcion = document.getElementById("elegir_funcion");
     elegir_funcion.style.display = 'none';
                         
     listaFunciones.addEventListener('change',function(){
     elegir_funcion.style.display = 'inline';
     })
                         
</script>
</html>

<% } %>