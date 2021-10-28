<!DOCTYPE html>
<%@page import="Logica.*" %>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>CoronaTickets</title>
        <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/styles-form.css" rel="stylesheet" />
        
        <script src="ajax-formulario.js"></script>
    </head>
    
    <% 
    ISistema sis;
    SistemaFactory fabrica = SistemaFactory.getInstance();
    sis = fabrica.getISistema();
    %> 
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
            <div class="container px-5">
                <a class="navbar-brand" href="#page-top">CoronaTickets</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <%
                        if(session.getAttribute("user") == null){ %>
                            <li class="nav-item"><a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#modalLogin">Ingresar</a></li>
                            <li class="nav-item"><a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#modalRegistro" id="registro">Registrarse</a></li>
                            <li class="nav-item"><a class="nav-link" href="index.jsp">Sesion invitado</a></li> <%
                        }else{ 
                            String user = (String) session.getAttribute("user"); %>
                            <li class="nav-item"><a class="nav-link" href="bienvenida.jsp"><% out.println("Continuar como " + user); %></a></li>
                            <li class="nav-item"><a class="nav-link" href="cerrarSesion.jsp">Cerrar Sesion</a></li> <%
                            } %>
                    </ul>
                </div>
            </div>
        </nav>
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
                        <input type="password" name="password" class="form-control" id="exampleInputPassword" placeholder="Contrasena" />
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
                        <button type="button" class="btn btn-outline-dark me-2 mt-5" data-bs-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-outline-dark me-2 mt-5">Ingresar</button>
                    </div>
                </form>

            </div>

        </div>
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
                            <input type="password" name="password" class="form-control" id="exampleInputPassword" placeholder="Contrasena" />
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
                <form action="registro.jsp"  id="formulario" name="mi_formulario">
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

        <!-- Header-->
        <header class="masthead text-center text-white">
            <div class="masthead-content">
                <div class="container px-5">
                    <h1 class="masthead-heading mb-0">CoronaTickets</h1>
                    <h2 class="masthead-subheading mb-0">Los mejores espectaculos, desde la comodidad de tu hogar</h2>
                    <a class="btn btn-outline-dark me-2 mt-5" href="#scroll">Sobre Nosotros</a>
                </div>
            </div>
            
        </header>
        <!-- Content section 1-->
        <section id="scroll">
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6 order-lg-2">
                        <div class="p-5"><img class="img-fluid rounded-circle" src="assets/img/01.jpg" alt="..." /></div>
                    </div>
                    <div class="col-lg-6 order-lg-1">
                        <div class="p-5">
                            <h2 class="display-4">Puedes ser un artista...</h2>
                            <p>Registrate como artista y obtiene todos los beneficios y servicios </p>
                            <p>Contamos con un monton de artistas internacionalmente conocidos como: Shakira, Maluma, entre otros</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Content section 2-->
        <section>
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6">
                        <div class="p-5"><img class="img-fluid rounded-circle" src="assets/img/02.jpg" alt="..." /></div>
                    </div>
                    <div class="col-lg-6">
                        <div class="p-5">
                            <h2 class="display-4">Tambien puedes ser un Espectador!</h2>
                            <p>Si lo tuyo no es el escenario, puedes disfrutar los shows y eventos de los artistas registrados desde la comodidad de tu hogar</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
       
        <!-- Footer-->
        <footer class="py-5 bg-black">
            <div class="container px-5"><p class="m-0 text-center text-white small">Copyright &copy; CoronaTickets 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script>
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
    </body>
    
</html>