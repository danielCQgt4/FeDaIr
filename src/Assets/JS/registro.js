(function () {

    var loginForm = document.getElementById('loginForm');
    var btnRegistro = document.getElementById('btnRegistro');
    var cedula = document.getElementById('ced');
    var nombre = document.getElementById('nombre');
    var usuario = document.getElementById('usuario');
    var telefono = document.getElementById('telefono');
    var pass = document.getElementById('password');
    var passC = document.getElementById('password_confirmation');
    var userErrorInfo = document.getElementById('idErrorInfo');
    var errors = {
        cant: 0,
        msg: '',
        userValid: false
    };

    usuario.addEventListener('keyup', validateUser);

    btnRegistro.addEventListener('click', registro);
    document.addEventListener('keyup', function (e) {
        if (e.keyCode == 13) {
            registro();
        }
    });

    function registro() {
        var loginForm = document.getElementById('loginForm');
        if (validaciones()) {
            var data = 'addUsers=1&cedula=' + cedula.value + '&usuario=' + usuario.value + '&contra=' + pass.value + '&nombre=' + nombre.value + '&telefono=' + telefono.value;
            console.log(data);
            if (errors.userValid) {
                postAjaxRequest(apiURL, data, function (json) {
                    if (json.errorBody != 'Error' || json.error != '') {
                        if (json.add == 1) {
                            window.location.href = "/Views/login.html";
                        } else {
                            var loginForm = document.getElementById('loginForm');
                            errorMessage('Error al Registrarse', loginForm);
                        }
                    }
                });
            } else {
                errorMessage('El usuario ya esta en uso', loginForm);
            }
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
            errors.msg = (pass.value != passC.value) ? 'Las contraseñas deben ser iguales' : 'Las contraseñas deben ser validas';
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

    function validateUser() {
        if (usuario.value != '') {
            postAjaxRequest(apiURL, 'addUsers=2&userTemp=' + usuario.value, function (json) {
                if (json.errorBody != 'Error' || json.error != '') {
                    if (json[0].valid == 1) {
                        inputFail(usuario, true);
                        userErrorInfo.style.display = "block";
                        errors.userValid = false;
                        btnRegistro.style.display = 'none';
                    } else {
                        errors.userValid = true;
                        inputFail(usuario, false);
                        userErrorInfo.style.display = "none";
                        btnRegistro.style.display = 'block';
                    }
                }
            });
        } else {
            inputFail(usuario, false);
            userErrorInfo.style.display = "none";
        }
    }

    validateUser();
})();



