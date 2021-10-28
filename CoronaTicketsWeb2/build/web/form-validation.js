const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input')

const expresiones = {
	usuario: /^[a-zA-Z0-9\_\-]{4,16}$/, // Letras, numeros, guion y guion_bajo
	nombre: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, // Letras y espacios, pueden llevar acentos.
	password: /^.{4,12}$/, // 4 a 12 digitos.
	correo: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
}



const validarFormulario = (e) =>{
    switch(e.target.name){
        case "campoNombre":
            
            if(expresiones.nombre.test(e.target.value)) {
               document.getElementById('grupo_nombre').style.borderColor='grey'; 
               document.getElementById('grupo_nombre').style.borderColor='green';
               document.getElementById('error-nombre').style.display="none";
               var true_nombre = true;
            }
            else{
                document.getElementById('grupo_nombre').style.borderColor='red'; 
                document.getElementById('error-nombre').style.display="";
                var true_nombre = false;
            }
        break;
        case 'campoApellido':
            
            if(expresiones.nombre.test(e.target.value)){
                document.getElementById('grupo_apellido').style.borderColor='green';
                document.getElementById('error-apellido').style.display="none";
                var true_apellido = true;
            }else{
                document.getElementById('grupo_apellido').style.borderColor='red'; 
                document.getElementById('error-apellido').style.display="";
                var true_apellido = false;

            }
        break;

        case 'campoEmail':
            console.log(e.target.value);
            if(expresiones.correo.test(e.target.value)){
                    document.getElementById('grupo_correo').style.borderColor='green';
                    document.getElementById('error-correo').style.display="none";
                    var true_email = true;

            }else{
                    document.getElementById('grupo_correo').style.borderColor='red'; 
                    document.getElementById('error-correo').style.display="";
                    var true_email = false;

                }
            
            
        break;

        case 'campoNickname':
        
            if(expresiones.usuario.test(e.target.value)) {
                document.getElementById('grupo_nickname').style.borderColor='grey'; 
                document.getElementById('grupo_nickname').style.borderColor='green';
                document.getElementById('error-nickname').style.display="none";
                var true_nickname = true;

            }
             else{
                 document.getElementById('grupo_nickname').style.borderColor='red'; 
                 document.getElementById('error-nickname').style.display="";
                 var true_nickname = false;
             }
         
        break;
            
         
        case 'campoPass':
            
             if(expresiones.password.test(e.target.value)){
                document.getElementById('exampleInputPassword1').style.borderColor='grey'; 
                document.getElementById('exampleInputPassword1').style.borderColor='green';
                document.getElementById('error-password').style.display="none";
                var true_password = true;
            }
             else{
                 document.getElementById('exampleInputPassword1').style.borderColor='red'; 
                 document.getElementById('error-password').style.display="";
                 var true_password = false;

             }
             
        break;

        case 'campoConfirmPass':
           const input_contraseña1 = document.getElementById('exampleInputPassword1');
           const input_contraseña2 = document.getElementById('exampleInputPassword2');
            if(input_contraseña1.value == input_contraseña2.value){
                document.getElementById('exampleInputPassword2').style.borderColor='grey'; 
                document.getElementById('exampleInputPassword2').style.borderColor='green';
                document.getElementById('error-password2').style.display="none";
                var true_password2 = true;

            }else{
                 document.getElementById('exampleInputPassword2').style.borderColor='red'; 
                 document.getElementById('error-password2').style.display="";
                 var true_password2 = false;
            }
            
        break;

        case 'campoDescripcion':
            const descripcion = document.getElementById('descripcion');
            if(descripcion.value === ""){
                document.getElementById('descripcion').style.borderColor='red'; 
                 document.getElementById('error-descripcion').style.display="";
                 var true_descripcion = false;
            }else{
                document.getElementById('descripcion').style.borderColor='grey'; 
                document.getElementById('descripcion').style.borderColor='green';
                document.getElementById('error-descripcion').style.display="none";
                var true_descripcion = true;
            }
        break;
        
        case 'campoBiografia':
            const biografia_var = document.getElementById('biografia');
            if(biografia.value === ""){
                 document.getElementById('biografia').style.borderColor='red'; 
                 document.getElementById('error-biografia').style.display="";
                 var true_biografia = false;
            }else{
                document.getElementById('biografia').style.borderColor='grey'; 
                document.getElementById('biografia').style.borderColor='green';
                document.getElementById('error-biografia').style.display="none";
                var true_biografia = true;
            }
        break;

        case 'campoWeb':
            const campo_web = document.getElementById('web');
            if(campo_web.value === ""){
                 document.getElementById('web').style.borderColor='red'; 
                 document.getElementById('error-web').style.display="";
                 var true_web = false;
            }else{
                document.getElementById('web').style.borderColor='grey'; 
                document.getElementById('web').style.borderColor='green';
                document.getElementById('error-web').style.display="none";
                var true_web = true;
            }
        break;
        
        
        case 'campoFecha':
           const fecha = document.getElementById('fecha');
            console.log(fecha.value);
            if(typeof(fecha)==undefined){
                fecha.style.borderColor='red'; 
                 document.getElementById('error-fecha').style.display="";
            }else{
                console.log('entra');
                fecha.style.borderColor='grey'; 
                fecha.style.borderColor='green';
                document.getElementById('error-fecha').style.display="none"
            }
        break;
        
    } 
}

inputs.forEach((input)=>{
    input.addEventListener('blur', validarFormulario);
    input.addEventListener('keyup', validarFormulario);
});

var input_nickname = document.getElementById('grupo_nickname');
input_nickname.addEventListener('blur', existe_nickname);
input_nickname.addEventListener('keyup', existe_nickname);

var input_email = document.getElementById('grupo_email');
input_email.addEventListener('blur', existe_email);
input_email.addEventListener('keyup', existe_email);

////////////////////////////AJAX//////////////////////////////////
function existe_nickname(){
    var nickname = document.getElementById('grupo_nickname').value;
    var nickname_campo = document.getElementById('grupo_nickname');
        var http = new XMLHttpRequest();
        http.open("POST", "ajax.jsp?nick=" + nickname, true);
        http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        var params = "nick=" +"nombre"; // probably use document.getElementById(...).value
        http.send(params);
        
        http.onload = function() {
            var cabecera = http.getResponseHeader("BIEN");
            console.log(cabecera);
            if(cabecera == "SI"){
                nickname_campo.style.borderColor = "green"
                document.getElementById('error-nickname-2').style.display="none";
            }else{
                nickname_campo.style.borderColor = "red"
                document.getElementById('error-nickname-2').style.display="";

            }
        }
}


function existe_correo(){
    var email = document.getElementById('grupo_correo').value;
    var email_campo = document.getElementById('grupo_correo');
        var http = new XMLHttpRequest();
        http.open("POST", "validacion-email-ajax.jsp?email=" + email, true);
        http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        var params = "email=" +"email"; // probably use document.getElementById(...).value
        http.send(params);
        
        http.onload = function() {
            var cabecera = http.getResponseHeader("CORRECTO");
            console.log(cabecera);
            if(cabecera == "SI"){
                var error_1 = document.getElementById('error-correo');
                if(error_1.style.display == 'none'){
                    email_campo.style.borderColor = "green"
                }
                document.getElementById('error-email-2').style.display="none";
            }else{
                email_campo.style.borderColor = "red"
                document.getElementById('error-email-2').style.display="";

            }
        }
}




