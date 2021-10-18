<!DOCTYPE html>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CoronaTickets</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                    <% if(session.getAttribute("tipo") != null){
                            if(session.getAttribute("tipo").equals("Artista")){
                                %> <a class="navbar-brand" href="index_art.jsp">CoronaTickets.uy</a><%
                            }
                            else if (session.getAttribute("tipo").equals("Espectador")) {
                                 %> <a class="navbar-brand" href="index_esp.jsp">CoronaTickets.uy</a> <%
                            }
                        }
                        else{   %> <a class="navbar-brand" href="index.jsp">CoronaTickets.uy</a> <% } %>
                </div>

            </div>
        </nav>
    <%
            // INICIALIZAMOS EL SISTEMA
            ISistema sis;
            SistemaFactory fabrica = SistemaFactory.getInstance();
            sis = fabrica.getISistema();
            
            SimpleDateFormat ft = new SimpleDateFormat ("dd.MM.yyyy '-' HH:mm:ss");
            SimpleDateFormat ft2 = new SimpleDateFormat ("dd.MM.yyyy");

            String paquete = (String) request.getParameter("selector");
            
            if(paquete.equals("Seleccione un paquete")){
                out.print("OPCION INVALIDA");
                if(session.getAttribute("tipo") != null){
                        if(session.getAttribute("tipo").equals("Artista")){
                            %> <form action="consulta_paquete_art.jsp"><%
                        }
                        else if (session.getAttribute("tipo").equals("Espectador")) {
                             %> <form action="consulta_paquete_esp.jsp"> <%
                        }
                    }
                    else{   %> <form action="consulta_paquete.jsp"> <% } %>
               
                    <button type="submit" class="mt-2 btn btn-outline-dark">Volver</button>
                </form>
            <%}
            else{
                
                DtPaquete dtP = sis.mostrarPaquete(paquete);

                String nombre = dtP.getNombre();
                String descripcion = dtP.getDescripcion();
                String descuento = ""+dtP.getDescuento();
                String imagen = dtP.getImagen();
                Date alta = dtP.getFecha_alta();
                Date ini = dtP.getFecha_ini();
                Date fin = dtP.getFecha_fin();

                String[] categorias = sis.listarCategoriasxPaquete(paquete);
                String[] espectaculos = sis.listarEspectaculosxPaq(paquete);

                %>
                
               
    <div class="container">
        
        <div class="row mt-3">
            <div class="col-6">
                <h4>Nombre</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<%out.print(nombre);%>">
            </div>
        </div>
        
        <div class="row mt-3">
            <div class="col-6">
                <h4>Descripcion</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<%out.print(descripcion);%>">
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-6">
                <h4>Descuento</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<%out.print(descuento);%>">
            </div>
        </div>


        <div class="row mt-3">
            <div class="col-6">
                <h4>Fecha de alta</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly placeholder="<%out.print(ft.format(alta));%>">
            </div>
        </div>
            
        <div class="row mt-3">
            <div class="col-6">
                <h4>Fecha Inicio</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly id="fecha_ini" placeholder="<%out.print(ft.format(ini));%>" >
            </div>
        </div>
        
        <div class="row mt-3">
            <div class="col-6">
                <h4>Fecha Fin</h4>
            </div>
            <div class="col-6">
                <input class="form-control" type="text" readonly id="fecha_fin" placeholder="<%out.print(ft.format(fin));%>" >
            </div>
        </div>
        
        <div class="row mt-3">
            <div class="col-6">
                <h4>Imagen</h4>
            </div>
            <div class="col-6">
                 <img src="<% out.println(imagen); %>" alt="Este paquete no tiene ninguna imagen o hubo un error al procesarla" width="200" height="200"> 
            </div>
        </div>
        
        <div class="row mt-3">
            <div class="col-6">
                <h4>Categorias del Paquete</h4>
            </div>
            <div class="col-6">
                <select name= "selector" id="listaCategorias" class="form-select" multiple aria-label="multiple select example">
                    <% // CARGAMOS LA LISTA DE CATEOGRIAS DEL PAQUETE
                    int i = 1;
                    if(categorias[0] != null){
                        i = 1;
                        for(String s: categorias){

                        %>
                        <option  id="<% out.print(i); %>" value="<% out.print(s); %>"> <% out.print(s); %></option>
                        <%
                        i++; 
                        }
                    }
                     %>
                </select>                  
            </div>
        </div>
                
        <div class="row mt-3">
            <div class="col-6">
                <h4>Espectaculos</h4>
            </div>
            <div class="col-6">
                <form action="consulta_espectaculo3.jsp">
                    <select name= "selector" id="listaPaquetes" class="form-select" multiple aria-label="multiple select example">
                        <% // CARGAMOS LA LISTA DE ARTISTAS INVITADOS A LA FUNCION
                        int j = 1;
                        if(espectaculos[0] != null){
                            j = 1;
                            for(String s: espectaculos){
        
                            %>
                            <option  id="<% out.print(j); %>" value="<% out.print(s); %>"> <% out.print(s); %></option>
                            <%
                            j++; 
                            }
                        }
                         %>
                    </select>
                        <% if(j > 1){ %>
                            <button type="submit" class="btn btn-secondary btn-lg btn-block" id="btn_espectaculo">Ver datos espectaculo</button>    
                        <% } %>
                </form>
            </div>
        </div>

        
<br>    
<br>
        <div class="row mt-6">
            
            <div class="col-5">
            </div>
            <div class="col-4">
                <% if(session.getAttribute("tipo") != null){
                        if(session.getAttribute("tipo").equals("Artista")){
                            %> <form action="consulta_paquete_art.jsp"><%
                        }
                        else if (session.getAttribute("tipo").equals("Espectador")) {
                             %> <form action="consulta_paquete_esp.jsp"> <%
                        }
                    }
                    else{   %> <form action="consulta_paquete.jsp"> <% } %>
                    <button type="submit" class="btn btn-secondary btn-lg btn-block">Volver</button>
                </form>
            </div>
    
            <div class="col-4">
            </div>
        </div>
        <% }  %>
<br>
<br>       

    </div>
            
                
</body>

<script>
    var btn_espectaculo = document.getElementById('btn_espectaculo');
    var listaPaquetes = document.getElementById('listaPaquetes');

    btn_espectaculo.style.display = 'none';

    listaPaquetes.addEventListener('change', function(){
        btn_espectaculo.style.display = 'inline';
    });
</script>
</html>