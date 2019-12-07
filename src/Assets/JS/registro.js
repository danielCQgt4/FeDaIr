(function () {
    var btnRegistro = document.getElementById('btnRegistro');
    var cedula = document.getElementById('ced');
    var nombre = document.getElementById('nombre'); 
    var usuario = document.getElementById('usuario');
    var telefono = document.getElementById('telefono');
    var pass = document.getElementById('password');
    var passC = document.getElementById('password_confirmation');
    
    btnRegistro.addEventListener('click', registro);
    btnRegistro.addEventListener('keyup', function (e) {
        if (e.keyCode == 13) {
            registro();
        }
    });
    
    function registro() {
        if (pass.value != passC.value){           
            var loginForm = document.getElementById('loginForm');
            errorMessage('Las contraseñas deben ser iguales', loginForm);
        }else{
            var data = 'addUsers=1&cedula=' + cedula.value + '&usuario=' + usuario.value + '&contra=' + pass.value + '&nombre=' + nombre.value + '&telefono=' + telefono.value;
            console.log(data);
            postAjaxRequest(apiURL, data, function (result) {
                if (result != 'Error' || result != '[]') {
                    var json = result;
                    if (json.add == 1) {
                        window.location.href = "/Views/login.html";
                    } else {
                        var loginForm = document.getElementById('loginForm');
                        errorMessage('Error al Registrarse', loginForm);
                    }
                }
            });
        }
       
    }
})();



