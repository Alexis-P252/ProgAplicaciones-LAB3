<%-- 
    Document   : consulta_espectaculo2
    Created on : 28/10/2021, 09:41:20 AM
    Author     : User
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.xml.datatype.XMLGregorianCalendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

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
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>CoronaTickets</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src="http://code.highcharts.com/highcharts.js"></script>
    </head>
    <body>
        <% 
        pkgWS.PublicadorService service = new pkgWS.PublicadorService();
        pkgWS.Publicador port = service.getPublicadorPort();

        SimpleDateFormat ft = new SimpleDateFormat ("dd.MM.yyyy '-' HH:mm:ss");
        SimpleDateFormat ft2 = new SimpleDateFormat ("dd.MM.yyyy");

        String funcion = (String) request.getParameter("funcion");
        
        pkgWS.DtFuncion dtF = port.mostrarFuncion(funcion);
        String imagen = dtF.getImagen();
        String nombre = dtF.getNombre();
        XMLGregorianCalendar  fecha_registroXML = dtF.getFechaRegistro();
        Date fecha_registro = fecha_registroXML.toGregorianCalendar().getTime();
        
        XMLGregorianCalendar fecha_horaXML = dtF.getFechaHora();
        Date fecha_hora = fecha_horaXML.toGregorianCalendar().getTime();
      
        List<String> preartistas = port.artistasinvitados(funcion).getItem();
        Object[] artistas = preartistas.toArray();
       
       
        
        

       
%>
        
        <hr>
    <div class="container bootstrap snippet">
        <div class="row">
            <div class="col-sm-2">
                <a href="pagina_principal.jsp" class>
                    <img title="profile image" class="img-circle img-responsive" width='100px' src="assets/img/virus.png">
                </a>
                <div > </div>
            </div>
            <div class="col-sm-10"><h1><%out.println(nombre);%></h1></div>
        </div>
        
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
              

      <div class="text-center">
        <img src="<%out.println(imagen);%>" class="avatar img-thumbnail" alt="Imagen">

      </div></hr><br>

           <ul class="list-group">
            <li class="list-group-item text-muted"><strong>Artistas invitados</strong> <i class="fa fa-dashboard fa-1x"></i></li>
            <% 
                for(Object x: artistas){ String art = (String)x;
                    if(art == null){ %>
                         <li class="list-group-item text-right"><span class="pull-left">No hay artistas invitados</span></li> <%
                    }
                    else{ %>
                         <li class="list-group-item text-right"><span class="pull-left"><%out.println(art);%></span></li> <%
                    }
                }
            %>
          </ul>
          
          
               

          
        </div><!--/col-3-->
    	<div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Datos </a></li>
            </ul>

              
          <div class="tab-content">
            <div class="tab-pane active" id="home">
                <hr>
                  <form class="form" action="consulta_funcion.jsp" method="post" id="volver">
                        
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                            <label for="last_name"><h4 class='texto'>Fecha y hora</h4></label>
                              <input type="text" class="form-control" name="last_name" id="last_name" placeholder="<%out.println(ft2.format(fecha_hora));%>" title="enter your last name if any." readonly>
                          </div>
                      </div>
          
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="phone"><h4 class='texto'>Fecha de alta</h4></label>
                              <input type="text" class="form-control" name="phone" id="phone" placeholder="<%out.println(ft2.format(fecha_registro));%>" title="enter your phone number if any." readonly>
                          </div>
                      </div>
      
                      <div class="form-group">
                           <div class="col-xs-12">
                                <br>
                              	<button class="btn btn-lg btn-success pull-right" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Volver</button>
                            </div>
                      </div>
              	</form>
              
              <hr>
              
             </div><!--/tab-pane-->
             
               
              </div><!--/tab-pane-->
          </div><!--/tab-content-->

        </div><!--/col-9-->
    </div><!--/row-->
    <br><br>

        
    </body>
    <% } %>
</html>

<script>
    $(document).ready(function() {

    
    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }
    
            reader.readAsDataURL(input.files[0]);
        }
    }
    

    $(".file-upload").on('change', function(){
        readURL(this);
    });
});
</script>

<style>
    .texto{
        font-size: 15px
    }   
    
</style>