(function () {

    var loginForm = document.getElementById('loginForm');
    var btnRegistro = document.getElementById('btnRegistro');
    var cedula = document.getElementById('ced');
    var nombre = document.getElementById('nombre');
    var usuario = document.getElementById('usuario');
    var telefono = document.getElementById('telefono');
    var pass = document.getElementById('password');
    var passC = document.getElementById('password_confirmation');
    var errors = {
        cant: 0,
        msg: ''
    };

    btnRegistro.addEventListener('click', registro);
    document.addEventListener('keyup', function (e) {
        if (e.keyCode == 13) {
            registro();
        }
    });

    function registro() {
        if (validaciones()) {
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
        } else {
            errorMessage(errors.msg, loginForm);
        }
    }
    /*--Cambio--*/
    //Validaciones 
    function validaciones() {
        errors.cant = 0;
        if (cedula.value == '') {
            errors.cant++;
            errors.msg = 'Ingresa una cedula valida';
            inputFail(cedula, true);
        } else {
            errors.msg = '';
            inputFail(cedula, false);
        }

        if (usuario.value == '') {
            errors.cant++;
            errors.msg = 'Ingresa un usuario valido';
            inputFail(usuario, true);
        } else {
            errors.msg = '';
            inputFail(usuario, false);
        }

        if ((pass.value != passC.value) || (pass.value == '' || passC.value == '')) {
            errors.cant++;
            errors.msg = (pass.value != passC.value)?'Las contraseñas deben ser iguales':'Las contraseñas deben ser validas';
            inputFail(passC, true);
            inputFail(pass, true);
        } else {
            errors.msg = '';
            inputFail(pass, false);
            inputFail(passC, false);
        }

        if (errors.cant > 0) {
            errors.msg = errors.cant === 1 ? errors.msg : 'Corrige los campos';
        }
        return errors.cant == 0;
    }
})();



