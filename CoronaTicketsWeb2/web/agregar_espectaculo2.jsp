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
    else{
    // INICIALIZAMOS EL SISTEMA
    ISistema sis;
    SistemaFactory fabrica = SistemaFactory.getInstance();
    sis = fabrica.getISistema();
    
    String plataforma = request.getParameter("selector");
    
    if(plataforma.equals("Seleccione una plataforma")){
        out.print("OPCION INVALIDA");%>
        <form action="agregar_espectaculo.jsp" method="post">
            <button type="submit" class="mt-2 btn btn-outline-dark">Volver</button>
        </form>     
    <%}
      else{
        List lista = sis.listarEspectaculosAceptadosxPlataformaWeb(plataforma);
        String[] listapaq = sis.listarPaquetes();
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <a class="navbar-brand" href="index_art.jsp">CoronaTickets.uy</a>
            </div>
        </div>
    </nav>
    
    <div class="row mt-5">
        <div class="col-10">
            <!--Div contenido principal-->
            <div class="div-lista ml-2">
                <form action="agregar_espectaculo3.jsp" method="post">
                    <div class="container">
       
                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Seleccione un espectaculo</h4>
                            </div>
                            <div class="col-6">
                                <select name= "espectaculo" id="listaPlataforma" class="form-select" multiple aria-label="multiple select example" >
                                    <% // CARGAMOS LA LISTA DE ESPECTACULOS DEL ARTISTA EN EL SELECT
                                        int i = 1;
                                        for(Object x: lista){
                                            Espectaculo e = (Espectaculo) x;
                                            if(e != null){
                                                if(e.getEstado() == 1 && e.getFinalizado() == false){
                                                   %>
                                                   <option  id="<% out.print(i); %>" value="<% out.print(e.getNombre()); %>"  > <% out.print(e.getNombre()); %></option>
                                                   <%
                                                   i++; 
                                               }  
                                            }
                                           else{
                                               %>
                                               <option  id="MensajeError"  >No hay ningun espectaculo</option>
                                               <% break;
                                           }
                                       }

                                     %>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col-6">
                                <h4>Seleccione un paquete</h4>
                            </div>
                            <div class="col-6">
                                <select name= "paquete" id="listaPlataforma" class="form-select" multiple aria-label="multiple select example" >
                                    <% // CARGAMOS LA LISTA DE ESPECTACULOS EN EL SELECT

                                    if(listapaq[0] != null){
                                         int k = 1;
                                         for(String s: listapaq){

                                         %>
                                         <option  id="<% out.print(k); %>" value="<% out.print(s); %>"  > <% out.print(s); %></option>
                                         <%
                                         k++; 
                                         }
                                     }else{
                                         %>
                                         <option  id="MensajeError"  >No hay ningun paquete</option>
                                         <%
                                     }
                                     %>
                                </select>
                            </div>
                        </div>
     
                <br>
                <br>

                    </div>
                    <div class="row mt-6">
            
                        <div class="col-5">
                        </div>
                        <div class="col-4">
                                <button type="submit" class="btn btn-secondary btn-lg btn-block">Agregar Espectaculo a Paquete</button>
                        </div>
                        <div class="col-4">
                        </div>
                    </div>
                    <br> <br>
                </form>
                <form action="agregar_espectaculo.jsp" method="post">
                    <div class="row mt-6">
            
                        <div class="col-5">
                        </div>
                        <div class="col-4">
                                <button type="submit" class="btn btn-secondary btn-lg btn-block">Elegir otra plataforma</button>
                        </div>
                        <div class="col-4">
                        </div>
                    </div>
                </form>
                
                
            </div>

        </div>
    </div>
<% } %>

    
</body>
</html>

<% } %>