
function valores(){
    var nombre = document.getElementById('grupo_nombre').value;
    if(true_nombre == true){
        var http = new XMLHttpRequest();
        http.open("POST", "ajax.jsp?nick=" + nombre, true);
        http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        var params = "nick=" +"nombre"; // probably use document.getElementById(...).value
        http.send(params);
        http.onload = function() {
            alert(http.responseText);
        }
    }
}