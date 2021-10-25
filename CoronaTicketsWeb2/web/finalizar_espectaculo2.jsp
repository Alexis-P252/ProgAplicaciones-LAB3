<%-- 
    Document   : consulta_espectaculo3
    Created on : 29/09/2021, 11:47:56 AM
    Author     : User
--%>

<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/estrellas.css">
        <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="http://code.highcharts.com/highcharts.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
        <title>CoronaTickets</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    </head>
    <body>
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
            
            String nickname = (String) session.getAttribute("user");
            String espectaculo = (String) request.getParameter("selector");
            
             if(espectaculo.equals("Seleccione un espectaculo") || espectaculo == null){
                out.print("OPCION INVALIDA"); 
                
               %> <form action="valorar_espectaculo.jsp"> <%  %>
                    <button type="submit" class="btn btn-secondary btn-lg btn-block">Volver</button>
                </form>
            <%}
            else{
                
            DtEspectaculo dtEsp = sis.mostrarEspectaculo(espectaculo);
            String nombre = dtEsp.GetNombre();
            String descripcion = dtEsp.GetDescripcion();
            String imagen = dtEsp.GetImagen();
        %>
        <form action="finalizar_espectaculo3.jsp">
            <div class="container">
                <div class="row mt-3">
                    <div class="col-6">
                        <h4>Nombre</h4>
                    </div>
                    <div class="col-6">
                        <input class="form-control" type="text" name="espectaculo" value="<% out.println(nombre); %>" readonly placeholder="<% out.println(nombre); %>">
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-6">
                        <h4>Descripcion</h4>
                    </div>
                    <div class="col-6">
                        <input class="form-control" type="text" readonly placeholder="<% out.println(descripcion); %>">
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-6">
                        <h4>Imagen</h4>
                    </div>
                    <div class="col-6">
                        <img src="<% out.println(imagen); %>" alt="Este espectaculo no tiene ninguna imagen asociada o hubo un error al procesarla" width="200" height="200"> 
                    </div>
                </div>   
            </div>
<br>
            <div class=" d-flex justify-content-center">
                <button type="submit" class="btn btn-secondary btn-lg btn-block ">Finalizar</button>
            </div>   
        </form>    

<br>


                 <form action="finalizar_espectaculo.jsp">
                    <div class=" d-flex justify-content-center">
                        <button type="submit" class="btn btn-secondary btn-lg btn-block">Volver</button>
                    </div>    
                </form>
      
<br>
<br>        

    </div>
    </body>
    <%
   }
    %>

    <script>
     
        var estrellas = document.getElementById('clasificacion');
        var boton = document.getElementById('btn-estrellas');
        
        var invisible = document.getElementById("invisible");
        invisible.style.display = 'none';

        boton.style.display = 'none';
        estrellas.addEventListener('click', function(){
            boton.style.display = 'inline'
        })


    </script>
</html>
