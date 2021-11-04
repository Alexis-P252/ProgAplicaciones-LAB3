<!DOCTYPE html>
<%@page import="Logica.*" %>
<%@page import="java.util.Date"%>
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
     if(session.getAttribute("tipo") != null){
        %> <jsp:include page="error_identidad.jsp"/> <%
    }
    else{    
    // INICIALIZAMOS EL SISTEMA
    ISistema sis;
    SistemaFactory fabrica = SistemaFactory.getInstance();
    sis = fabrica.getISistema();
    
    String busqueda = request.getParameter("busqueda");
    String orden = request.getParameter("flexRadioOrden");
    String[] categorias = request.getParameterValues("categorias");
    

    List espectaculos;
    List paquetes;
    String[] listaCategorias = sis.listarCategorias();
    

    if(orden == null || orden.equals("Alfabeticamente")){
        espectaculos = sis.BuscadorEspectaculo(busqueda,0);
        paquetes = sis.BuscadorPaquete(busqueda,0);
    }
    else{
       espectaculos = sis.BuscadorEspectaculo(busqueda,1);
       paquetes = sis.BuscadorPaquete(busqueda,1); 
    }
    
 
    if(categorias != null){

        espectaculos = sis.FiltrarEspectaculoxCat(espectaculos,categorias);
        paquetes = sis.FiltrarPaquetexCat(paquetes,categorias);
    }
   
    
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <a class="navbar-brand" href="index.jsp">CoronaTickets.uy</a>
            </div>
            <div class="d-flex ">
                <h3 class="me-5">Buscador</h3>
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
                <form action="buscador.jsp">
                    
                    <div class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Espectaculo, Paquete" aria-label="Search" name="busqueda" value="<% out.println(busqueda); %>" />
                        <button class="btn btn-outline-dark" type="submit">Aplicar</button>
                    </div>
                    
                    <% if(orden == null || orden.equals("Alfabeticamente")){ %>
                        <div class="mb-3 col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioOrden" value="Alfabeticamente" id="btn_alf" checked>
                                <label class="form-check-label" for="flexRadioDefault1">
                                  Ordenar alfabeticamente (ascendente)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioOrden" value="fecha" id="btn_fecha" >
                                <label class="form-check-label" for="flexRadioDefault2">
                                  Ordenar por fecha de publicacion (descendente)
                                </label>
                            </div>    
                        </div> <%
                    }else{ %>   
                        <div class="mb-3 col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioOrden" value="Alfabeticamente" id="btn_alf">
                                <label class="form-check-label" for="flexRadioDefault1">
                                  Ordenar alfabeticamente (ascendente)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioOrden" value="fecha" id="btn_fecha" checked>
                                <label class="form-check-label" for="flexRadioDefault2">
                                  Ordenar por fecha de publicacion (descendente)
                                </label>
                            </div>    
                        </div> <%
                    } %>
                    
                     <div class="row mt-3">
                            <div class="col-6">
                                <h4>Filtrar por categorias</h4>
                            </div>
                            <div class="col-6">
                                 <% if(listaCategorias[0] != null){
                                        int i = 1;
                                        for(String s: listaCategorias){ %>
                                        <div class="form-check" name="selector2">
                                   
                                            <input class="form-check-input" type="checkbox" name="categorias" value="<% out.println(s);%>" id="<% out.println(s);%>">
                                            <label class="form-check-label" for="flexCheckDefault">
                                                <% out.print(s);%>
                                            </label>
                                        </div>        
                                        <% }
                                    }else{
                                        %> <div class="form-check" name="selector2">

                                                <input class="form-check-input" type="checkbox" value="">
                                                <label class="form-check-label" for="flexCheckDefault">
                                                    No hay ninguna categoria
                                                </label>
                                            </div>
                                    <%} %> 
                             </div>       
                        </div>
                    
                        
                </form>        
                    <div class="row mt-3">
                        <div class="col-6">
                            <h4>Espectaculos</h4>
                        </div>
                        <div class="col-6">
                            <form action="consulta_espectaculo3.jsp">
                                <select name= "selector" id="listaEspectaculo" class="form-select" multiple aria-label="multiple select example">
                                <%  int i = 1;   
                                    if(espectaculos != null){
                                    
                                        for(Object obj: espectaculos){
                                           String s = (String) obj;
                                        %>
                                        <option  id="<% out.print(i); %>" value="<% out.print(s); %>"> <% out.print(s); %></option>
                                        <%
                                        i++;
                                        }
                                        if(i == 1){
                                            %>
                                            <option  id="MensajeError" > <% out.print("La busqueda no arrojo ningun resultado"); %></option>
                                            <%
                                        }
                                    }else{
                                        %>
                                        <option  id="MensajeError" > <% out.print("La busqueda no arrojo ningun resultado"); %></option>
                                        <%
                                    }

                                %>
                                </select>
                                    <% if(i > 1){ %>
                                        <button type="submit" id="btn_espectaculo" class="btn btn-secondary btn-lg btn-block">Ver datos espectaculo</button>    
                                    <% } %>

                            </form>
                        </div>
                    </div>
                                    
                    <div class="row mt-3">
                        <div class="col-6">
                            <h4>Paquetes</h4>
                        </div>
                        <div class="col-6">
                            <form action="consulta_paquete2.jsp">
                                <select name= "selector" id="listaPaquete" class="form-select" multiple aria-label="multiple select example">
                                    <%  int k = 1;   
                                    if(paquetes != null){
                                    
                                        for(Object obj: paquetes){
                                           String s = (String) obj;
                                        %>
                                        <option  id="<% out.print(k); %>" value="<% out.print(s); %>"> <% out.print(s); %></option>
                                        <%
                                        k++;
                                        }
                                        if(k == 1){
                                            %>
                                            <option  id="MensajeError" > <% out.print("La busqueda no arrojo ningun resultado"); %></option>
                                            <%
                                        }
                                    }else{
                                        %>
                                        <option  id="MensajeError" > <% out.print("La busqueda no arrojo ningun resultado"); %></option>
                                        <%
                                    }

                                %>
                                </select>
                                    <% if(k > 1){ %>
                                        <button type="submit" id="btn_paquete" class="btn btn-secondary btn-lg btn-block">Ver datos paquete</button>    
                                    <% } %>


                            </form>
                        </div>
                    </div>
                    
                    <% if(categorias != null){ %>
                        <h5> Actualmente filtrando por:
                        <%  int z = 0;
                            for(String s: categorias){
                                if(z == 0){
                                    out.println(s.trim());
                                }
                                else{
                                    out.println(","+s.trim());
                                }
                            z++;    
                            }
                        }    
                        %>
                        </h5>
         
        </div>

        </div>
        <div class="col-2">
            <a class="list-group-item list-group-item-action" href="consulta_usuario.jsp">Consulta usuario</a>
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
    var btn_espectaculo = document.getElementById('btn_espectaculo');
    var listaEspectaculos = document.getElementById('listaEspectaculo');
    
    var btn_paquete = document.getElementById('btn_paquete');
    var listaPaquetes = document.getElementById('listaPaquete')

    btn_espectaculo.style.display = 'none';
    btn_paquete.style.display = 'none';

    listaEspectaculos.addEventListener('change', function(){
        console.log('entra');
      btn_espectaculo.style.display = 'inline';
    });
    
    listaPaquetes.addEventListener('change', function(){
        console.log('entra');
      btn_paquete.style.display = 'inline';
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