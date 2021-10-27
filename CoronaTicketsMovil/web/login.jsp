<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>CoronaTickets</title>
        <meta charset="UTF-8">
        <link rel="icon" type="image/x-icon" href="assets/img/virus.png" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    
        <div class="container">
        <div class="row">
			<div class="col-md-5 mx-auto">
			<div id="first">
				<div class="myform form ">
                                    <div class="logo mb-3">
                                    <% String cerrar = (String) request.getParameter("cerrar");
                                    if(cerrar != null){
                                        if(cerrar.equals("si")){ 
                                            session.invalidate(); %>
                                          <br> <br><div class="alert alert-primary" role="alert">
                                                        <b> Sesion cerrada correctamente </b>
                                                    </div  
                                        <%}
                                    } 
                                        
                                    
                                    String error = (String) request.getParameter("error");
                                    if(error != null){
                                        if(error.equals("si")){ %>
                                        <br> <br><div class="alert alert-primary" role="alert">
                                            <b> Error:</b> El usuario o la contraseña son incorrectos
                                        </div
                                    <%}
                                    } %>
                                    
                                    
                                            <div class="col-md-12 text-center">
                                                   <h1>Iniciar Sesion</h1>
                                            </div>
                                   </div>
                                    <form action="procesado_login.jsp"method="post" name="login">
                                        
                                        <div class="form-group">
                                           <label for="exampleInputEmail1">Nickname</label>
                                           <input type="text" name="nickname"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="Escribe tu nickname">
                                        </div>
                                        <div class="form-group">
                                           <label for="exampleInputEmail1">Contraseña</label>
                                           <input type="password" name="password" id="password"  class="form-control" aria-describedby="emailHelp" placeholder="Escribe tu contraseña">
                                        </div>
                                        <div class="form-group">

                                        </div>
                                        <div class="col-md-12 text-center ">
                                           <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Iniciar sesion</button>
                                        </div>
                                    </form>
                                    
				</div>
			</div>
		</div>
      </div>   
</html>
