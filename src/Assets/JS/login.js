(function () {
    var btnLogin = document.getElementById('btnLogin');
    var user = document.getElementById('user'), pass = document.getElementById('pass');

    btnLogin.addEventListener('click', login);
    user.addEventListener('keyup', function (e) {
        if (e.keyCode == 13) {
            login();
        }
    });
    pass.addEventListener('keyup', function (e) {
        if (e.keyCode == 13) {
            login();
        }
    });

    function login() {
        var data = 'login=1&user=' + user.value + '&pass=' + pass.value;
        postAjaxRequest(apiURL, data, function (json) {
            if (json.errorBody != 'Error' || json.error != '') {
                if (json.status == '1') {
                    window.location.href = "/Views/productos.html";
                } else {
                    inputFail(user,true);
                    inputFail(pass,true);
                    var loginForm = document.getElementById('loginForm');
                    errorMessage('Error al iniciar sesion', loginForm);
                }
            } else {
                dialogError('!Error de comunicacion');
            }
        });
    }
})();