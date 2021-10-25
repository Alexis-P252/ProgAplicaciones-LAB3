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
        else if(session.getAttribute("tipo").equals("Espectador")){
            %> <jsp:include page="error_identidad.jsp"/> <%
        }
        else{
        
        ISistema sis;
        SistemaFactory fabrica = SistemaFactory.getInstance();
        sis = fabrica.getISistema();
        
        String nombre = (String) request.getParameter("nombre");
        String descripcion = (String) request.getParameter("descripcion");
        String duracion = (String) request.getParameter("duracion");
        String imagen = (String) request.getParameter("imagen");
        String video = (String) request.getParameter("video");
        String URL = (String) request.getParameter("URL");
        String esp_min = (String) request.getParameter("esp_min");
        String esp_max = (String) request.getParameter("esp_max");
        String costo = (String) request.getParameter("costo");
        String desc_premio = (String) request.getParameter("desc_premio");
        String S_cant_premios = (String) request.getParameter("cant_premios");
        String plataforma = (String) request.getParameter("selector");
        String[] categorias = (String[]) request.getParameterValues("categorias");
        String artista = (String) session.getAttribute("user");
        
        Boolean ok = false;
        Boolean hayVacios = false;
        
        if(imagen.equals("")){
            imagen = "https://www.logolynx.com/images/logolynx/e2/e2b8ce1d51e62a370d7f91fef04f8e17.png";
        }
        
        int espMin = 0,espMax = 0,duracion_num = 0, cant_premios = 0;
        float costonum = 0;
        
        
        // VERIFICAMOS QUE EN NINGUN CAMPO NO SE HAYA INTRODUCIDO NINGUN CARACTER, EN CASO DE QUE ASI SEA, SE DA UN MENSAJE DE ERROR.
        if(nombre.isEmpty() || descripcion.isEmpty() || duracion.isEmpty() || URL.isEmpty() ||
            esp_min.isEmpty() || esp_max.isEmpty() || costo.isEmpty() || desc_premio.isEmpty() ){
                %><p>ERROR: Debe rellenar todos los campos</p><%   
                ok = true;
        }
        
        if(plataforma == null){
            %><p>ERROR: No se selecciono ninguna plataforma</p><%  
            ok = true;
        }
        
        
        if(categorias == null){
            %><p>ERROR: No se selecciono ninguna categoria</p><%
            ok = true; 
        }
        
        // VERIFICAMOS QUE EL VALOR INTRODUCIDO EN EL CAMPO CANTIDAD DE PREMIOS SEA UN NUMERO
        try{
            cant_premios =  Integer.parseInt(S_cant_premios);
        }
        catch(Exception e){
             %><p>ERROR: Cantidad de premios debe ser un valor numerico mayor a 0 </p><%
                ok = true;
        }
        
        // VERIFICAMOS QUE EL VALOR INTRODUCIDO EN EL CAMPO COSTO SEA UN NUMERO
        try{
            costonum =  Float.parseFloat(costo);
        }
        catch(Exception e){
                %><p>ERROR: Costo debe ser un valor numerico mayor a 0 </p><%
                ok = true;
        }

        // VERIFICAMOS QUE EL VALOR INTRODUCIDO EN EL CAMPO ESPECTADORES MINIMOS SEA UN NUMERO
        try{
            espMin = Integer.parseInt(esp_min);
        }
        catch(Exception e){
            %><p>ERROR: El Numero de espectadores minimos debe ser numerico mayor a 0 </p><%
            ok = true;    
        }

        // VERIFICAMOS QUE EL VALOR INTRODUCIDO EN EL CAMPO ESPECTADORES MAXIMOS SEA UN NUMERO
        try{
            espMax = Integer.parseInt(esp_max);
        }
        catch(Exception e){
            %><p>ERROR: El numero de espectadores maximos debe ser numerico mayor a 0 </p><%
            ok = true; 
        }

        // VERIFICAMOS QUE EL VALOR INTRODUCIDO EN EL CAMPO DURACION MAXIMOS SEA UN NUMERO
        try{
            duracion_num = Integer.parseInt(duracion);
        }
        catch(Exception e){
            %><p>ERROR: Duracion debe ser un valor numerico mayor a 0 </p><%
            ok = true; 
        }
        
         // VERIFICAMOS QUE EL NUMERO INTRODUCIDO EN CANTIDAD DE PREMIOS SEA MAYOR A 0
        if(cant_premios <= 0){
            %><p>ERROR: Cantidad de premios debe ser mayor a 0 </p><%
            ok = true; 
            }
        
        // VERIFICAMOS QUE EL NUMERO INTRODUCIDO EN COSTO SEA MAYOR A 0
        if(costonum <= 0){
            %><p>ERROR: Costo debe ser mayor a 0 </p><%
            ok = true;
        }
        
        // VERIFICAMOS QUE LA CANT DE ESPECTADORES MINIMOS SEA MENOR A LA CANT ESPECTADORES MAXIMOS
        if(espMin >= espMax){
            %><p>ERROR: La cantidad de espectadores maximos debe ser mayor que el minimo de espectadores </p><%
            ok = true;
        }
        
        // VERIFICAMOS QUE LA DURACION SEA MAYOR A 0 MINUTOS 
        if(duracion_num <= 0){
            %><p>ERROR: La duracion del espectaculo debe ser mayor que 0 </p><%
            ok = true;
        }

        if(sis.verificarEspectaculo(nombre)){
            %><p>ERROR: Ya existe un Espectaculo con ese nombre </p><%
            ok = true;
        }
        
        Date alta = new Date();

        SimpleDateFormat ft = new SimpleDateFormat ("dd.MM.yyyy '-' HH:mm:ss");
        SimpleDateFormat ft2 = new SimpleDateFormat ("dd.MM.yyyy");
        
        

        if(ok == false){
            List <String> listacategorias = new ArrayList();
            

            for(String s: categorias){
                listacategorias.add(s.trim());
            }

    
            %> <h4> Espectaculo agregado correctamente, pendiente de aceptacion por parte de un administrador </h4> <%
            sis.crearEspectaculo(plataforma,nombre,alta,costonum, URL, espMax,espMin,duracion_num,descripcion, artista, listacategorias, 0, imagen, video, desc_premio, cant_premios);
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
    <% } %>
</body>
    
</html>