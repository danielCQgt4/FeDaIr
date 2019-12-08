(function () {
    'use-strict';

    //Security redirect
    acceptedEntrance(function (result) {
        if (result) {
            document.getElementById('tarj').setAttribute("style", "display:none");
            document.getElementById('historial').setAttribute("style", "display:none");
            document.getElementById('pagos');
            var btnGuardarTarjeta = document.getElementById('btnGuardarTarjeta');
            var btnUno = document.getElementById('uno');
            var btnDos = document.getElementById('dos');
            var tarjeta = document.getElementById('tarjeta');
            var tipo = document.getElementsByName('tipo');

            btnUno.addEventListener('click', areaTarjetas);
            btnDos.addEventListener('click', areaHistorial);
            btnGuardarTarjeta.addEventListener('click', guardarTarjeta);
            btnGuardarTarjeta.addEventListener('keyup', function (e) {
                if (e.keyCode == 13) {
                    guardarTarjeta();
                }
            });

            function guardarTarjeta() {
                for (i = 0; i < tipo.length; i++) {
                    if (tipo[i].checked) {
                        //var memory=memo[i].checked;
                        var tip = tipo[i].value;
                    }
                }
                var data = 'addTarjeta=1&tarjeta=' + tarjeta.value + '&tipo=' + tip;
                console.log(data);
                if (validacionAddTarjeta()) {
                    postAjaxRequest(apiURL, data, function (json) {
                        if (json.errorBody != 'Error' || json.error != '') {
                            if (json.add == '1') {
                                mostrarTarjetas();
                                tarjeta.value = "";
                            } else {
                                var registerForm = document.getElementById('registerForm');
                                errorMessage('Error al Insertar', registerForm);
                            }
                        }
                    });
                }
            }

            function validacionAddTarjeta() {
                var add = false;
                var registerForm = document.getElementById('registerForm');
                if (tarjeta.value.length != 16) {
                    errorMessage('Ingrese una tarjeta valida', registerForm);
                    inputFail(tarjeta, true);
                    add = false;
                } else {
                    for (i = 0; i < tarjeta.value.length; i++) {
                        if (tarjeta.value.charAt(i) == 0 ||
                            tarjeta.value.charAt(i) == 1 ||
                            tarjeta.value.charAt(i) == 2 ||
                            tarjeta.value.charAt(i) == 3 ||
                            tarjeta.value.charAt(i) == 4 ||
                            tarjeta.value.charAt(i) == 5 ||
                            tarjeta.value.charAt(i) == 6 ||
                            tarjeta.value.charAt(i) == 7 ||
                            tarjeta.value.charAt(i) == 8 ||
                            tarjeta.value.charAt(i) == 9) {
                            inputFail(tarjeta, false);
                            add = true;
                        } else {
                            errorMessage('Corrige la informacion', registerForm);
                            inputFail(tarjeta, true);
                            add = false;
                            break;
                        }
                    }
                }
                for (i = 0; i < tipo.length; i++) {
                    if (tipo[i].checked) {
                        add = true;
                        break;
                    } else {
                        errorMessage('Corrige la informacion', registerForm);
                        add = false;
                    }
                }
                return add;
            }

            function mostrarTarjetas() {
                var tabla = document.getElementById("tarjetaBody");
                tabla.innerHTML = "";
                var data = 'addTarjeta=2';
                console.log(data);
                postAjaxRequest(apiURL, data, function (json) {
                    if (json.errorBody != 'Error' || json.error != '') {
                        console.log(json.length);
                        if (json.error == 1) {
                            var fila = newDOM("tr");
                            var celda1 = newDOM("td");
                            celda1.appendChild(newTextNode("Sin Registros"));
                            fila.appendChild(newDOM('td'));
                            fila.appendChild(celda1);
                            tabla.appendChild(fila);
                        } else {
                            for (var i = 0; i < json.length; i++) {
                                const obj = json[i];
                                var fila = newDOM("tr");
                                var celda1 = newDOM("td");
                                var celda2 = newDOM("td");
                                var celda3 = newDOM("td");
                                var btnAccion = newDOM('button');
                                btnAccion.setAttribute('class', 'btn btn-danger d-block w-90 box-center-h');
                                btnAccion.appendChild(newTextNode("Eliminar"));
                                btnAccion.addEventListener('click', function () {
                                    var msg = dialogConfirm('Esta segur@ de eliminar esta tarjeta', function (result) {
                                        if (result) {
                                            postAjaxRequest(apiURL, 'addTarjeta=3&idFormaPago=' + obj.idFormaPago, function (json) {
                                                if (json.errorBody != 'Error' || json.error != '') {
                                                    if (json.delete == 1) {
                                                        mostrarTarjetas();
                                                        removeMSG(msg.id);
                                                    } else {
                                                        removeMSG(msg.id);
                                                        dialogError('!Error, no se pudo eliminar');
                                                    }
                                                } else {
                                                    removeMSG(msg.id);
                                                    dialogError('!Error');
                                                }
                                            });
                                        }
                                    });
                                });
                                celda1.appendChild(newTextNode(json[i].numeroTarjeta));
                                celda2.appendChild(newTextNode(json[i].tipo));
                                celda3.appendChild(btnAccion);
                                fila.appendChild(celda1);
                                fila.appendChild(celda2);
                                fila.appendChild(celda3);
                                tabla.appendChild(fila);
                            }
                        }
                    } else {
                    }
                });
            }

            function mostrarHistorial() {
                var tabla = document.getElementById("historialBody");
                tabla.innerHTML = "";
                var data = 'historial=1';
                console.log(data);
                postAjaxRequest(apiURL, data, function (json) {
                    if (json.errorBody != 'Error' || json.error != '') {
                        console.log(json.length);
                        if (json.error == 1) {
                            var fila = newDOM("tr");
                            var celda1 = newDOM("td");
                            var textoCelda1 = document.createTextNode("Sin Registros");
                            celda1.appendChild(textoCelda1);
                            fila.appendChild(celda1);
                            tabla.appendChild(fila);
                        } else {
                            for (var i = 0; i < json.length; i++) {
                                var fila = newDOM("tr");
                                fila.setAttribute("id", "factura")
                                var celda1 = newDOM("td");
                                var celda2 = newDOM("td");
                                var celda3 = newDOM("td");
                                var celda4 = newDOM("td");
                                var btnAction = newDOM('button');
                                btnAction.setAttribute('class', 'btn btn-accent d-block w-90 box-center-h');
                                btnAction.appendChild(newTextNode('Ver mas'));
                                celda1.appendChild(newTextNode(json[i].idFacturaEncabezado));
                                celda1.setAttribute('class', 'table-id');
                                celda2.appendChild(newTextNode(json[i].fecha));
                                celda3.appendChild(newTextNode(json[i].subTotal));
                                celda4.appendChild(newTextNode(json[i].total));
                                fila.appendChild(celda1);
                                fila.appendChild(celda2);
                                fila.appendChild(celda3);
                                fila.appendChild(celda4);
                                fila.appendChild(btnAction);
                                tabla.appendChild(fila);
                            }
                        }
                    } else {
                        dialogError('Error de comunicacion');
                    }
                });
            }

            function areaTarjetas() {
                document.getElementById('tarj').setAttribute("style", "display:inline");
                document.getElementById('historial').setAttribute("style", "display:none");
            }

            function areaHistorial() {
                document.getElementById('tarj').setAttribute("style", "display:none");
                document.getElementById('historial').setAttribute("style", "display:inline");
            }

            mostrarTarjetas();
            mostrarHistorial();
            /*--Cambio--*/
            areaTarjetas();
        } else {
            loginRedirect();
        }
    });
})();


