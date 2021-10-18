<!DOCTYPE html>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
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
        
        
        String nombre = (String) request.getParameter("nombre");
        String apellido = (String) request.getParameter("apellido");
        String desc = (String) request.getParameter("desc");
        String imagen = (String) request.getParameter("imagen");
        String web = (String) request.getParameter("web");
        String fecha = (String) request.getParameter("f_nac");
        String bio = (String) request.getParameter("bio");
        String nickname = (String) session.getAttribute("user");
        String tipoUsuario = (String) session.getAttribute("tipo");       
        
        Boolean ok = false;
        
        if(imagen.equals("")){
            imagen = "https://i.imgur.com/udaJG1y.jpeg";
        }
       
        Boolean hayVacios = false;
        Date fechaNac = new Date();
        if(fecha.equals("")){
            %><p>ERROR: Debe introducir una fecha valida</p><%
            hayVacios = true;
            ok = true;
        }else{
            String[] divFecha = fecha.split("-");
            int anio = Integer.parseInt(divFecha[0]);
            int mes = Integer.parseInt(divFecha[1]);
            int dia = Integer.parseInt(divFecha[2]);
            fechaNac = new Date(anio-1900,mes-1,dia,0,0,0);
        }
        
        if( apellido.isEmpty()|| nombre.isEmpty()){ ok = true;hayVacios = true;}
        
        if(hayVacios == true){
            %><p>COMPLETE TODO LOS CAMPOS</p><%
                ok = true;
        }
              
        if(tipoUsuario.equals ("Artista") && hayVacios == false){
            if(web.isEmpty() || desc.isEmpty() || bio.isEmpty()){
                %><p>COMPLETE TODO LOS CAMPOS</p><%
                ok = true;
            }
        }
        
        if(ok == false){
            if(tipoUsuario.equals("Espectador")){ // SE MODIFICA UN ESPECTADOR
                sis.modificarEspectador(nickname,nombre,apellido,fechaNac, imagen);
            }
            else{ // SE MODIFICA UN ARTISTA
                sis.ModificarArtista(nickname,nombre,apellido,fechaNac,desc,bio,web, imagen);
            }
            %><p>MODIFICADO CORRECTAMENTE</p><%
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