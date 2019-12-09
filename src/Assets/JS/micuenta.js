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
            mostrarTarjetas();
            mostrarHistorial();
            /*--Cambio--*/
            areaTarjetas();

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
                            if (json.errorBC != '1') {
                                if (json.add == '1') {
                                    mostrarTarjetas();
                                    tarjeta.value = "";
                                } else {
                                    var registerForm = document.getElementById('registerForm');
                                    errorMessage('Error al Insertar', registerForm);
                                }
                            } else {
                                dialogError('!Ha ocurrido un error inesperado, instenta mas tarde');
                            }
                        } else {
                            dialogError('!Error de comunicacion');
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
                        if (json.error == 1) {
                            var fila = newDOM("tr");
                            var celda1 = newDOM("td");
                            celda1.appendChild(newTextNode("Sin Registros"));
                            fila.appendChild(newDOM('td'));
                            fila.appendChild(celda1);
                            fila.appendChild(newDOM('td'));
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
                        dialogError('!Error de comunicacion');
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
                                const obj = json[i];
                                var fila = newDOM("tr");
                                fila.setAttribute("id", "factura")
                                var celda1 = newDOM("td");
                                var celda2 = newDOM("td");
                                var celda3 = newDOM("td");
                                var celda4 = newDOM("td");
                                var btnAction = newDOM('button');
                                btnAction.setAttribute('class', 'btn btn-accent d-block w-90 box-center-h table-micuenta-btn');
                                btnAction.appendChild(newTextNode('Ver mas'));
                                btnAction.addEventListener('click', function () {
                                    newDialogMoreHistory({
                                        idFacturaEncabezado: obj.idFacturaEncabezado,
                                        fecha: obj.fecha,
                                        referencia: obj.referencia,
                                        subTotal: obj.subTotal,
                                        IVA: obj.impuesto,
                                        total: obj.total
                                    });
                                });
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
                        dialogError('!Error de comunicacion');
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

            function newDialogMoreHistory(data) {
                var body = document.getElementById('body');
                var dialogBack = newDOM('div');
                dialogBack.setAttribute('class', 'dialog-error-back');
                dialogBack.setAttribute('id', 'dialog-resumen-history');
                dialogBack.addEventListener('click', function () {
                    removeMSG(dialogBack.id);
                });
                var content = newDOM('div');
                content.setAttribute('class', 'dialog-micuenta-content box-center-fixed p-1');
                var encabezado = newDOM('div'), // as parent
                    formaPago = newDOM('div'), // as parent
                    resumen = newDOM('div'), // as parent
                    totals = newDOM('div'); // as parent
                encabezado.setAttribute('class', 'p-1');
                formaPago.setAttribute('class', 'p-1');
                resumen.setAttribute('class', 'p-1');
                totals.setAttribute('class', 'p-1');
                var factura = newDOM('h5'),
                    fecha = newDOM('h5');
                factura.appendChild(newTextNode('Factura: ' + data.idFacturaEncabezado));
                fecha.appendChild(newTextNode('Fecha: ' + data.fecha));
                encabezado.appendChild(factura);//
                encabezado.appendChild(fecha);//
                var titleFormaPago = newDOM('h3'),
                    separator1 = newDOM('hr'),
                    tableFormaPago = newDOM('table'),
                    tbodyFormaPago = newDOM('tbody'),
                    trFormaPago = newDOM('tr'),
                    tdImg = newDOM('td'),
                    img = newImg({
                        src: '/Assets/IMG/card.png',
                        alt: 'Tarjeta',
                        width: '136px',
                        height: '136px'
                    }),
                    tdInfo = newDOM('td');
                titleFormaPago.appendChild(newTextNode('Forma de pago'));
                tableFormaPago.setAttribute('class', 'w-100');
                tableFormaPago.setAttribute('style', 'border-spacing: 0px;');
                trFormaPago.setAttribute('class', 'cart-pay-method-row');
                tdImg.setAttribute('class', 'p-1');
                tdImg.appendChild(img);
                tdInfo.appendChild(newTextNode('XXXX-' + data.referencia));
                trFormaPago.appendChild(tdImg);
                trFormaPago.appendChild(tdInfo);
                tbodyFormaPago.appendChild(trFormaPago);
                tableFormaPago.appendChild(tbodyFormaPago);
                formaPago.appendChild(titleFormaPago);//
                formaPago.appendChild(separator1);//
                formaPago.appendChild(tableFormaPago);//
                var titleResumen = newDOM('h3'),
                    separator2 = newDOM('hr'),
                    divResumen = newDOM('div');
                titleResumen.appendChild(newTextNode('Resumen'));
                divResumen.setAttribute('class', 'mb cart-resumen');
                //Get data from server
                postAjaxRequest(apiURL, 'historial=2&idFaturaEncabezado=' + data.idFacturaEncabezado, function (json) {
                    if (json.errorBody != 'Error' || json.error != '') {
                        if (json.errorBC != '1') {
                            for (i = 0; i < json.length; i++) {
                                var item = newResumenItem(json[i]);
                                divResumen.appendChild(item);
                            }
                        } else {
                            dialogError('!Ha ocurrido un error inesperado, intenta mas tarde');
                        }
                    } else {
                        dialogError('!Error de comunicacion');
                    }
                });
                resumen.appendChild(titleResumen);//
                resumen.appendChild(separator2);//
                resumen.appendChild(divResumen);//
                var separator3 = newDOM('hr'),
                    totalesContent = newTotalesContent(data);
                totals.appendChild(separator3);//
                totals.appendChild(totalesContent);//
                var close = newDOM('div');
                close.setAttribute('class', 'view-more-close');
                close.addEventListener('click', function () {
                    removeMSG(dialogBack.id);
                });
                content.appendChild(encabezado);
                content.appendChild(formaPago);
                content.appendChild(resumen);
                content.appendChild(totals);
                content.appendChild(close);
                dialogBack.appendChild(content);
                body.appendChild(dialogBack);
                return dialogBack;
            }

            function newTotalesContent(data) {
                var divTotal = newDOM('div'),
                    subTotalTitle = newTotalTitle({ title: 'SubTotal' }),
                    subTotalValue = newTotalValue({ value: data.subTotal }),
                    ivaTitle = newTotalTitle({ title: 'IVA' }),
                    ivaValue = newTotalValue({ value: data.IVA }),
                    totalTitle = newTotalTitle({ title: 'Total' }),
                    totalValue = newTotalValue({ value: data.total });
                divTotal.setAttribute('class', 'cart-purchase mt-1');
                divTotal.appendChild(subTotalTitle);
                divTotal.appendChild(subTotalValue);
                divTotal.appendChild(ivaTitle);
                divTotal.appendChild(ivaValue);
                divTotal.appendChild(totalTitle);
                divTotal.appendChild(totalValue);
                return divTotal;
            }

            function newTotalTitle(data) {
                var div = newDOM('div'),
                    text = newDOM('p');
                div.setAttribute('class', 'w-40 d-inline-block');
                text.setAttribute('class', 'text-right');
                text.appendChild(newTextNode(data.title));
                div.appendChild(text);
                return div;
            }

            function newTotalValue(data) {
                var div = newDOM('div'),
                    text = newDOM('p');
                div.setAttribute('class', 'w-58 d-inline-block');
                text.setAttribute('class', 'text-right');
                text.appendChild(newTextNode(data.value));
                div.appendChild(text);
                return div;
            }

            function newResumenItem(data) {
                var divPrincipal = newDOM('div');
                divPrincipal.setAttribute('class', 'cart-item p-1 mb');
                var divImg = newDOM('div');
                divImg.setAttribute('class', 'cart-item-img');
                divImg.setAttribute('style', 'background: url(/Assets/IMG/ProductsIMG/' + data.urlImg + ') no-repeat;background-size: contain;background-position: center center;');
                divPrincipal.appendChild(divImg);
                var description = newDOM('p');
                description.setAttribute('class', 'cart-item-name');
                description.appendChild(newTextNode(data.descripcion));
                divPrincipal.appendChild(description);
                var cant = newDOM('div');
                cant.setAttribute('class', 'cart-item-price');
                cant.appendChild(newTextNode(data.cant));
                divPrincipal.appendChild(cant);
                return divPrincipal;
            }

        } else {
            loginRedirect();
        }
    });
})();


