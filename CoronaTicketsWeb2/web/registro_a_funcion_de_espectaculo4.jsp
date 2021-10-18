<!DOCTYPE html>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<html lang="en">


<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
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
    else{       %>
    
     <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
          <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
        </symbol>
        <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
          <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
        </symbol>
        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
          <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
        </symbol>
    </svg>
    <%  
        
        ISistema sis;
        SistemaFactory fabrica = SistemaFactory.getInstance();
        sis = fabrica.getISistema();
        
        boolean ok = false;
        String nickname = (String) session.getAttribute("user");
        String funcion = (String) request.getParameter("selector"); 
        String espectaculo = (String) request.getParameter("invisible");
        int costo = 1;
        Date f = new Date();
            
        if(funcion.equals("El espectaculo no tiene ninguna funcion")){ 
            ok = true;  %>
           
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                <div>
                    ERROR: LA FUNCION SELECCIONADA NO ES VALIDA
                </div>
            </div>
        
        <%}

        if(sis.espectadorRegistrado(nickname, funcion) == true){
            ok = true; %>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                <div>
                    ERROR: YA ESTAS REGISTRADO A ESTA FUNCION
                </div>
            </div>
        
        <%}

        if(sis.cantMaxAsistentes(espectaculo, funcion) == true){
            ok = true; %>
             <div class="alert alert-danger d-flex align-items-center" role="alert">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                <div>
                    ERROR: ESTA FUNCION YA TIENE TODOS LOS CUPOS LLENOS
                </div>
            </div> <%
        }
        

        if(sis.alMenos3Registros(nickname) == true && ok == false){ // EXISTE LA POSIBILIDAD DE CANJEAR 3 REGISTROS, SE TIENE QUE ANALIZAR CUANTOS SELECCIONO EL USUARIO

            String [] registros = (String[]) request.getParameterValues("registros");
            

            
            if(registros == null){ // NO SELECCIONO NINGUNO, ES DECIR, NO DESEA CANEJARLOS
                sis.agregarRegistro(nickname, funcion, espectaculo, f, costo); %>
                 <div class="alert alert-success d-flex align-items-center" role="alert">
                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                    <div>
                        Te has registrado correctamente a la funcion.
                    </div>
                </div> <%
            }

            else if (registros.length == 3){ // SELECCIONO EXACTAMENTE 3, EL COSTO DEL NUEVO REGISTRO SERA 0.
                costo = 0;
                List <String> RegistrosSeleccionados = new ArrayList();

                for( String s: registros){
                    RegistrosSeleccionados.add(s.trim());
                }

                sis.CanjeoRegistros(RegistrosSeleccionados, nickname);
                sis.agregarRegistro(nickname, funcion, espectaculo, f, costo); %>
                 <div class="alert alert-success d-flex align-items-center" role="alert">
                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                    <div>
                        Te has registrado correctamente a la funcion a costo 0.
                    </div>
                </div> <%
            }

            else{ // NO SELECCIONO NI 0 NI 3, ES DECIR, UN VALOR INVALIDO
                ok = true; %>
                <div class="alert alert-danger d-flex align-items-center" role="alert">
                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                    <div>
                        ERROR: DEBES SELECCIONAR 3 REGISTROS PARA CANJEAR O NINGUNO EN CASO DE QUE NO DESEES HACERLO
                    </div>
                </div> <%
            }
        }

        else{ // NO EXISTE LA POSIBILIDAD DE CANJEAR 3 REGISTROS
            if(ok == false){
                sis.agregarRegistro(nickname, funcion, espectaculo, f, costo); %>
                <div class="alert alert-success d-flex align-items-center" role="alert">
                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                    <div>
                        Te has registrado correctamente a la funcion.
                    </div>
                </div> <%
            }
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
<% } %>
