<!DOCTYPE html>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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

}
        ISistema sis;
        SistemaFactory fabrica = SistemaFactory.getInstance();
        sis = fabrica.getISistema();
        
        String nombre = (String) request.getParameter("nombre");
        String descripcion = (String) request.getParameter("descripcion");
        String descuento = (String) request.getParameter("descuento");
        String imagen = (String) request.getParameter("imagen");
        String fecha_ini = (String) request.getParameter("f_ini");
        String fecha_fin = (String) request.getParameter("f_fin");
        Date alta = new Date();
        SimpleDateFormat ft = new SimpleDateFormat ("dd.MM.yyyy '-' HH:mm:ss");
        SimpleDateFormat ft2 = new SimpleDateFormat ("dd.MM.yyyy");
        
        
        Boolean ok = false;
        Boolean hayVacios = false;
        
        if(imagen.equals("")){
            imagen = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ772wqQczt1JZAlAwrzgvMHI8vFqWjve0uJ90nOW596_nPGBjvjjnXS-VCK-4_wzLlarE&usqp=CAU";
        }
        
        
        Date ini = new Date();
        if(fecha_ini.equals("")){ // COMPROBAMOS QUE LA FEHCA DE INICIO DE PROMOCION SEA VALIDO.
            %><p>ERROR: Debe introducir una fecha de inicio de promocion valida</p><%
            ok = true;
        }
        else{
            String[] divFecha = fecha_ini.split("-");
            int anio = Integer.parseInt(divFecha[0]);
            int mes = Integer.parseInt(divFecha[1]);
            int dia = Integer.parseInt(divFecha[2]);
            ini = new Date(anio-1900,mes-1,dia,0,0,0);

        }

        Date fin = new Date();
        if(fecha_fin.equals("")){ // COMPROBAMOS QUE LA FEHCA DE INICIO DE PROMOCION SEA VALIDO.
            %><p>ERROR: Debe introducir una fecha de fin de promocion valida</p><%
            hayVacios = true;
            ok = true;
        }
        else{
            String[] divFecha2 = fecha_fin.split("-");
            int anio2 = Integer.parseInt(divFecha2[0]);
            int mes2 = Integer.parseInt(divFecha2[1]);
            int dia2 = Integer.parseInt(divFecha2[2]);
            fin = new Date(anio2-1900,mes2-1,dia2,0,0,0);

        }

        
       if(nombre.isEmpty() || descripcion.isEmpty() || descuento.isEmpty()){
            %><p>ERROR: Rellene todos los campos</p><%
            ok = true;
            hayVacios = true;
        } 

        if(sis.ExistePaquete(nombre) == true){
            %><p>ERROR: Ya existe un paquete con ese nombre</p><%
            ok = true;
        }
        
        int descuentonum = -1;
        try{
            descuentonum = Integer.parseInt(descuento);
            }
        catch(Exception e){
            %><p>ERROR: El descuento debe ser un valor numerico entre 1 y 100</p><%
            ok = true;
        }
        
        if(descuentonum < 1 || descuentonum > 100){
            %><p>ERROR: El descuento debe ser un valor numerico entre 1 y 100</p><%
            ok = true;
        }

        if(fin.before(ini) || fin.equals(ini)){
            %><p>ERROR: La fecha de fin no puede ser inferior o igual a la fecha de inicio</p><%
            ok = true;
            
        }else if(fin.before(alta) || ini.before(alta) || fin.equals(alta)){
            %><p>ERROR: La fecha de inicio o final no pueden ser anteriores a la actual</p><%
            ok = true;    
            
        }

    
        if(ok == false){
            
            sis.AgregarPaquete(nombre, descripcion, descuentonum, alta, fin, ini, imagen);
            %><p>Paquete agregado correctamente</p><%
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