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
    if(session.getAttribute("tipo") != null){
        %> <jsp:include page="error_identidad.jsp"/> <%
    }
    else{           
    // INICIALIZAMOS EL SISTEMA
    ISistema sis;
    SistemaFactory fabrica = SistemaFactory.getInstance();
    sis = fabrica.getISistema();
    
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <a class="navbar-brand" href="index.jsp">CoronaTickets.uy</a>
                <form action="buscador.jsp" class="d-flex justify-content-between">
                    <div class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Espectaculo, Paquete" aria-label="Search" name="busqueda" />
                        <button class="btn btn-outline-dark" type="submit">Buscar</button>
                    </div>
                </form>
            </div>
            <div class="d-flex ">
                <h3 class="me-5">Consulta de usuario</h3>
                <button class="btn btn-outline-dark me-2 text-nowrap" type="submit" data-bs-toggle="modal" data-bs-target="#modalLogin">
                        Iniciar Sesion
                    </button>
                <button class="btn btn-outline-dark me-2" type="submit" data-bs-toggle="modal" data-bs-target="#modalRegistro">
                        Registrarse
                    </button>
            </div>
        </div>
    </nav>




    </div>
    </nav>
    <div class="row mt-5">
        <div class="col-10">
            <!--Div contenido principal-->
            <div class="div-lista ml-2">
                <form action="consulta_usuario2.jsp">
                <select name= "selector"id="listaUsuarios" class="form-select w-25" aria-label="Default select example">
                    <option selected>Seleccione un usuario</option>
                    <% // CARGAMOS LA LISTA DE NICKNAMES EN EL SELECT
                    String[] lista = sis.ColNickname();    
                    int i = 1;    
                    for(String s: lista){

                    %>
                    <option  id="<% out.print(i); %>" value=<% out.print(s); %>  > <% out.print(s); %></option>
                    <%
                    i++; 
                    }
                     %>

                     
                </select>
                     <button type="submit" class='mt-2 btn btn-outline-dark' id=btn_mostrar_datos> Mostrar datos </button>
                </form>  
                
                
            </div>

        </div>
        <div class="col-2">
            <a class="list-group-item list-group-item-action" href="consulta_espectaculo.jsp">Consulta de Espectaculo</a>
            <a class="list-group-item list-group-item-action" href="consulta_funcion.jsp">Consulta de Funcion de Espectaculo</a>
            <a class="list-group-item list-group-item-action" href="consulta_paquete.jsp">Consulta de Paquete de Espectaculos</a>
        </div>
    </div>

    <!-- Modal de login-->
    <div class="modal fade" id="modalLogin" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Iniciar Sesion</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form method="POST" action="login.jsp">
                        <div class="mb-3">
                            <input type="text" name="user" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Nickname" />
                        </div>
                        <div class="mb-3">
                            <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Contrasena" />
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" value="Artista" id="flexRadioDefault1" checked>
                            <label class="form-check-label" for="flexRadioDefault1">
                              Artista
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" value="Espectador" id="flexRadioDefault2" >
                            <label class="form-check-label" for="flexRadioDefault2">
                              Espectador
                            </label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button type="submit" class="btn btn-primary">Ingresar</button>
                        </div>
                    </form>

                </div>

            </div>
        </div>
    </div>

   <!-- Modal de registro-->
    
    <div class="modal fade" id="modalRegistro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Registrarse</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="registro.jsp"  id="formulario" name="mi_formulario" method="post">
                <div class="modal-body">
                        <div class="row">
                            <div class="mb-3 col-6">
                                <input name="campoNombre" type="text" class="form-control" placeholder="Nombre" id='grupo_nombre'/>
                                <div id="error-nombre" class="alert alert-danger" style="display: none;">
                                    ERROR , INGRESE UN NOMBRE VALIDO
                                </div>
                                
                            </div>
                            <div class="mb-3 col-6">
                                <input name="campoApellido" type="text" class="form-control" placeholder="Apellido" id='grupo_apellido'/>
                                <div id="error-apellido" class="alert alert-danger" style="display: none;">
                                    ERROR , INGRESE UN APELLIDO VALIDO
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-6">
                                <input name="campoEmail" type="text" class="form-control" id="grupo_correo" aria-describedby="emailHelp" placeholder="Email"/>
                                <div id="error-correo" class="alert alert-danger" style="display: none;">
                                    ERROR , INGRESE UN EMAIL VALIDO
                                </div>
                                <div id="error-email-2" class="alert alert-danger" style="display: none;">
                                    ERROR , ESE EMAIL YA ESTA EN USO
                                </div>
                            </div>
                            <div class="mb-3 col-6">
                                <input name="campoNickname" type="text" class="form-control" placeholder="Nickname" id="grupo_nickname"/>
                                <div id="error-nickname" class="alert alert-danger"  style="display: none;">
                                    ERROR , INGRESE UN NICKNAME VALIDO
                                </div>
                                <div id="error-nickname-2" class="alert alert-danger"  style="display: none;">
                                    ERROR , ESE NICKNAME YA ESTA EN USO
                                </div>
    
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-6">
                                <input name="campoPass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Contraseña"/>
                                <div id="error-password" class="alert alert-danger" style="display: none;">
                                    ERROR , INGRESE UNA CONTRASENA VALIDA
                                </div>
                            </div>
                            <div class="mb-3 col-6">
                                <input name="campoConfirmPass" type="password" class="form-control" id="exampleInputPassword2" placeholder="Confirmar contraseña"/>
                                <div id="error-password2" class="alert alert-danger" style="display: none;">
                                    LAS CONTRASENAS NO COINCIDEN
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-6">
                                <input name="campoFecha" id="fecha" class="form-control" type="date"/>
                                <div id="error-fecha" class="alert alert-danger" style="display: none;">
                                    INGRESE UNA FECHA CORRECTA
                                </div>
                            </div>
                            <div class="mb-3 col-6">
                                <input name="campoImagen" type="text" class="form-control" placeholder="Imagen (link, no obligatorio)"  />
                            </div>
                            
                        </div>
                        <div class="row">
                            <div class="mb-3 col-6">
                                <input name="campoDescripcion" type="text" class="form-control descripcion" placeholder="Descpripcion" id='descripcion'/>
                                <div id="error-descripcion" class="alert alert-danger" style="display: none;">
                                    LA DESCRIPCION ES OBLIGATORIA
                                </div>
                            </div>
                            <div class="mb-3 col-6">
                                <input name="campoBiografia" type="text" class="form-control" placeholder="Biografia" id='biografia'/>
                                <div id="error-biografia" class="alert alert-danger" style="display: none;">
                                    LA BIOGRAFIA ES OBLIGATORIA
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-6">
                                <input name="campoWeb" type="text" class="form-control" placeholder="Sitio web" id='web'/>
                                <div id="error-web" class="alert alert-danger" style="display: none;">
                                    EL SITIO WEB ES OBLIGATORIO
                                </div>
                            </div>
                            
                        </div>
                        <div class="row">
                            <div class="mb-3 col-6">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault2" value="Artista" id="btn_artista" checked/>
                                    <label class="form-check-label" for="flexRadioDefault1">
                                      Artista
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault2" value="Espectador" id="btn_espectador"/>
                                    <label class="form-check-label" for="flexRadioDefault2">
                                      Espectador
                                    </label>
                                </div>    
                            </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn btn-outline-dark me-2 mt-5" data-bs-dismiss="modal">Cerrar</button>
                        <button type="submit" onclick="valores()" value="Submit" class="btn btn-primary btn btn-outline-dark me-2 mt-5" id='registrarse'>Registrarse</button>
                </div>
                    
                </form>
            </div>
        </div>
    </div>
    </div>


</body>
<script>
    var btn_mostrar_datos = document.getElementById('btn_mostrar_datos');
    var listaUsuarios = document.getElementById('listaUsuarios');

    btn_mostrar_datos.style.display = 'none';

    listaUsuarios.addEventListener('change', function(){
        console.log('entra');
      btn_mostrar_datos.style.display = 'inline';
    });
    
    var btn_espectador = document.getElementById('btn_espectador');
    var btn_artista = document.getElementById('btn_artista');

    btn_espectador.addEventListener('click', function(){
        document.getElementById('descripcion').style.display ='none';
        document.getElementById('biografia').style.display ='none';
        document.getElementById('web').style.display ='none';
        document.getElementById('error-web').style.display="none";
        document.getElementById('error-biografia').style.display="none";
        document.getElementById('error-descripcion').style.display="none";
    })

    btn_artista.addEventListener('click', function(){
        document.getElementById('descripcion').style.display ='inline';
        document.getElementById('biografia').style.display ='inline';
        document.getElementById('web').style.display ='inline';
    })       

</script>
<script src="form-validation.js"></script>

</html>
<% } %>
