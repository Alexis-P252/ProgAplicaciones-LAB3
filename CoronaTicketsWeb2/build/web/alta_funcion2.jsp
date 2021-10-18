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
        
        ISistema sis;
        SistemaFactory fabrica = SistemaFactory.getInstance();
        sis = fabrica.getISistema();
        
        SimpleDateFormat ft = new SimpleDateFormat ("dd.MM.yyyy '-' HH:mm:ss");
        SimpleDateFormat ft2 = new SimpleDateFormat ("dd.MM.yyyy");
        
        String nombre = (String) request.getParameter("nombre");
        String imagen = (String) request.getParameter("imagen");
        String fechaString = (String) request.getParameter("fecha");
        String hora = (String) request.getParameter("hora");
        String artista = (String) session.getAttribute("tipo");
        String espectaculo = (String) request.getParameter("selector");
        String[] artistas = (String []) request.getParameterValues("artistas");
        Date actual = new Date();
        
        Boolean ok = false;
        Boolean hayVacios = false;
        int anio = 0, mes = 0, dia = 0, hour = 0, min = 0;
        
        // COMPROBAMOS QUE LA HORA SEA CORRECTA
        if(hora.equals("")){
            %><p>ERROR: Debe introducir una hora valida</p><%
            ok = true;
        }
        else{
            String[] divHora = hora.split(":");
            hour = Integer.parseInt(divHora[0]);
            min = Integer.parseInt(divHora[1]);
        }

        // COMPROBAMOS QUE LA FECHA SEA CORRECTA
        if(fechaString.equals("")){
            %><p>ERROR: Debe introducir una fecha valida</p><%
            ok = true;
        }else{
            String[] divFecha = fechaString.split("-");
            anio = Integer.parseInt(divFecha[0]);
            mes = Integer.parseInt(divFecha[1]);
            dia = Integer.parseInt(divFecha[2]);
            
        }

        Date fecha = new Date(anio-1900,mes-1,dia,hour,min);
        
        List artistasSeleccionados;

        if(artistas == null){ // NO SE SELECCIONO NINGUN ARTISTA
            artistasSeleccionados = new ArrayList();
        }
        else{
            artistasSeleccionados = new ArrayList();
            for(String s: artistas){
                artistasSeleccionados.add(s.trim());
            }
        }

        // COMPROBAMOS QUE SE HAYA SELECCIONADO UN ESPECTACULO
        if(espectaculo == null){
            %><p>ERROR: No se seleciono ningun espetaculo</p><%
            ok = true;
        }

        // COMPROBAMOS QUE NO HAYA CAMPOS VACIOS
        if(nombre.isEmpty()){
            %><p>ERROR: Debe completar el campo nombre</p><%
            ok = true;
        }
     
        // COMPROBAMOS QUE LA FECHA INGRESADA SEA MAYOR A LA ACTUAL
        if(fecha.before(actual) || fecha.equals(actual)){
            %><p>ERROR:La fecha de la funcion no puede ser menor o igual a la actual</p><%
            ok = true;
        }

        // VERIFICAMOS QUE EL NOMBRE NO PERTENEZCA YA A OTRA FUNCION
        if(sis.ExisteFuncion(nombre) == true){
            %><p>ERROR:El nombre introducido ya pertenece a otra funcion</p><%
            ok = true;
        }

        if(espectaculo.equals("No hay ningun espectaculo")){
            %><p>ERROR:No hay ningun espectaculo</p><%
            ok = true;
        }

        if(imagen.equals("")){
            imagen = "https://cdn-icons-png.flaticon.com/512/68/68314.png";
        }

        if(ok == false){
            out.println("Funcion de espectaculo creada correctamente");
            sis.AgregarFuncion(nombre, fecha, actual, espectaculo, artistasSeleccionados, imagen);
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