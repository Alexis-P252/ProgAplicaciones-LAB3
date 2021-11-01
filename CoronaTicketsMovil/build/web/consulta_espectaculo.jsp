<%-- 
    Document   : consulta_espectaculo
    Created on : 28/10/2021, 09:41:07 AM
    Author     : User
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Logica.*" %>
<%--<%@page import="pkgWS.*" %>--%>
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
                        <li><a href="pagina_principal.jsp">Pagina Principal</a></li>
                        <li class="active"><a href="consulta_espectaculo.jsp">Consulta de Espectaculo</a></li>
                        <li><a href="consulta_funcion.jsp">Consulta de Funcion de Espectaculo</a></li>
                       
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="login.jsp?cerrar=si"><span class="glyphicon glyphicon-log-in"></span> Cerrar Sesion</a></li>
                    </ul>
              </div>
            </div>
        </nav>
        <h3 class="text-center">Consulta de Espectaculo</h3>
        
        <% 
        
//        pkgWS.PublicadorService service = new pkgWS.PublicadorService();
//        pkgWS.Publicador port = service.getPublicadorPort();
        
        ISistema sis;
        SistemaFactory fabrica = SistemaFactory.getInstance();
        sis = fabrica.getISistema();
        
        String[] lista = sis.listarPlataformas();
        
        
        int i = 1;    
        %>
        <form action="consulta_espectaculo.jsp" method="get" id="form_lista_plataformas" name="form_lista_plataformas">
            <select name="plataforma" id="selectorPlataforma" class="form-select form-control" aria-label="Default select example">
                <option>Seleccione una plataforma</option>
                <% 
                    for(String s: lista){
                        String plataforma = (String) request.getParameter("plataforma");
                        if(plataforma != null){
                            if(plataforma.equals(s)){ %>
                                <option selected  id="<% out.print(i); %>" value="<% out.print(s); %>"  > <% out.print(s); %></option> <%
                            }
                            else{ %>
                             <option  id="<% out.print(i); %>" value="<% out.print(s); %>"  > <% out.print(s); %></option> <%
                            }
                        }
                        else{ %>
                            <option  id="<% out.print(i); %>" value="<% out.print(s); %>"  > <% out.print(s); %></option> <%
                        }
                        i++;  
                    }
     
                %>
            </select>
        </form> <br> <br>  
         
        <% 
        String plataforma = (String) request.getParameter("plataforma");
        if(plataforma != null){
            if(plataforma.equals("Seleccione una plataforma") == true){
                
            }
            else{
                String[] listaespectaculos = sis.listarEspectaculosAceptadosxPlataforma(plataforma);
               
                for(String s: listaespectaculos){
     
                    DtEspectaculo dtEsp = sis.mostrarEspectaculo(s);
                    String imagen = dtEsp.GetImagen();
                    String nombre = dtEsp.GetNombre(); %>
                    
                    <figure class="figure">
                        <img src="<% out.println(imagen);%>" class="rounded img responsive center-block" alt="A generic square placeholder image with rounded corners in a figure.">
                        <figcaption name="espectaculo" value="<%out.println(nombre);%>" class="figure-caption"><%out.println(nombre);%></figcaption>
                    </figure>
                    
                <%    
                }
            }
        }
        
        
        %>    
      
    </body>
</html>

<script>
    var selectorPlataforma = document.getElementById("selectorPlataforma");
    
    selectorPlataforma.addEventListener('change', function(){
        document.form_lista_plataformas.submit()
        
    });
</script>
<% } %>

<style> 
.responsive {
  max-width: 250px;
  max-height: 250px;
  height: auto;
}

body {
  font-family: 'Raleway', sans-serif;
}
.bg-dark {
  background-color: #105469 !important;
}

.nav-item:hover {
  color: #E2B842 !important;
}

h1 {
  color: #105469;
  font-weight: 700;
}

footer, footer .container .col{
  height: 200px;
}

</style>