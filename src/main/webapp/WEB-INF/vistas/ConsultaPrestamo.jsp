<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="js/global.js"></script>

    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrapValidator.css"/>
    <title></title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%"><h4>Consulta Prestamo</h4></div>

<div class="container" style="margin-top: 1%">
    <!-- Agregar aqu� -->

    <div class="col-md-23" >

        <div class="row" style="height: 70px">
            <input type="hidden" id="id_txt_usureg" value=${sessionScope.objUsuario.idUsuario}>
            <div class="col-md-6" >
                <input class="form-control" id="id_txt_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
            </div>
            <div class="col-md-3" >
                <button type="button" class="btn btn-primary" id="id_btn_filtrar" style="width: 150px">FILTRA</button>
            </div>


        </div>
        <div class="row" style="margin-bottom: 50px">
            <label class="col-lg-2 control-label" for="id_txt_filtroF">Desde:</label>

            <div class="col-md-3" >
                <input class="form-control" id="id_txt_filtroF"  name="filtro" placeholder="Ingrese el nombre" type="date" maxlength="30"/>

            </div>
            <label class="col-lg-2 control-label" for="id_txt_filtroFF">Hasta:</label>

            <div class="col-md-3" >
                <input class="form-control" id="id_txt_filtroFF"  name="filtro" placeholder="Ingrese el nombre" type="date" maxlength="30"/>

            </div>

        </div>


        <div class="row" >
            <div class="col-md-12">
                <div class="content" >

                    <table id="id_table" class="table table-striped table-bordered" >
                        <thead>
                        <tr>
                            <th style="width: 5%" >ID</th>
                            <th style="width: 10%">Monto a Pagar</th>
                            <th style="width: 10%">Monto Prestado</th>
                            <th style="width: 5%">Fecha Inicio</th>
                            <th style="width: 10%">Fecha Fin</th>
                            <th style="width: 10%">Dias</th>
                            <th style="width: 10%">Pago Diario</th>
                            <th style="width: 10%">ID prestatario</th>
                            <th style="width: 10%">Actualizar</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="id_div_modal_registra" >
        <div class="modal-dialog" style="width: 60%">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="padding: 35px 50px">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-ok-sign"></span> Revisa Solicitud</h4>
                </div>
                <div class="modal-body" style="padding: 30px 20px;">
                    <form id="id_form_registra" accept-charset="UTF-8" class="form-horizontal" method="post">
                        <div class="panel-group" id="steps">
                            <!-- Step 1 -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Prestamo</a></h4>
                                </div>
                                <div id="stepOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_reg_prestatario">Prestatario</label>
                                            <div class="col-lg-8">
                                                <input class="form-control" id="id_reg_prestatario" name="prestatario"  type="text" maxlength="20" readonly/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_reg_prestamista">Prestamista</label>
                                            <div class="col-lg-8">
                                                <input class="form-control" id="id_reg_prestamista" name="prestamista" value="${sessionScope.objUsuario.nombre} ${sessionScope.objUsuario.apellido}"  type="text" maxlength="20" readonly/>
                                            </div>
                                        </div>
                                        <input class="form-control" id="id_solicitud" type="hidden" name="soli">
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_reg_monto">Monto</label>
                                            <div class="col-lg-3">
                                                <input class="form-control" type="text" id="id_reg_monto" name="monto" readonly/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_reg_pagod">Pago Diario</label>
                                            <div class="col-lg-3">
                                                <input class="form-control" type="text" id="id_reg_pagod" name="pago"  placeholder="Ingrese su Contraseña" readonly/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-lg-6 col-lg-offset-3">
                                                <button type="button" class="btn btn-success" id="id_btn_aprueba">APROBAR</button>
                                            </div>
                                            <BR><BR>
                                            <div class="col-lg-6 col-lg-offset-3">
                                                <button type="button" class="btn btn-danger" id="id_btn_desaprueba">RECHAZAR</button>
                                            </div>
                                        </div>





                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>






</div>

<script type="text/javascript">




    function limpiarFormulario(){
        $("#id_reg_prestamista").val(' ');
        $("#id_reg_prestatario").val(' ');
        $("#id_reg_montoprest").val(' ');
        $("#id_reg_monto").val(' ');
        $("#id_reg_pagod").val(' ');

    }
    function agregarGrilla(lista){
        $('#id_table').DataTable().clear();
        $('#id_table').DataTable().destroy();
        $('#id_table').DataTable({
            data: lista,
            searching: false,
            ordering: true,
            processing: true,
            pageLength: 10,
            lengthChange: false,
            columns:[
                {data: "idSolicitudPrestamos"},
                {data: "monto"},
                {data: "montoprest"},
                {data: "fechaInicio"},
                {data: "fechaFin"},
                {data: "dias"},
                {data: "pagodiario"},
                {data: "usureg"},
                {data: function(row, type, val, meta){
                        var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+ row.idSolicitudPrestamos +'\',\''+ row.usureg +'\',\''+row.monto + '\',\'' + row.pagodiario +'\')">Editar</button>';
                        return salida;
                    },className:'text-center'},

            ]
        });
    }
    //boton filtro
    $("#id_btn_filtrar").click(function(){
        var fil=$("#id_txt_filtro").val();
        var usureg=$("#id_txt_usureg").val();
        $.getJSON("consultaCrudSolicitudPrestamo",{"filtro":fil,"usureg":usureg}, function (lista){
            agregarGrilla(lista);
        });
    });


    //REGISTRAR
    $("#id_btn_aprueba").click(function(){
        var validator = $('#id_form_registra').data('bootstrapValidator');
        validator.validate();

        if (validator.isValid()) {
            $.ajax({
                type: "POST",
                url: "actualizaSolicitudPrestamos",
                data: $('#id_form_registra').serialize(),
                success: function(data){
                    agregarGrilla(data.lista);
                    $('#id_div_modal_registra').modal("hide");
                    mostrarMensaje(data.mensaje);
                    limpiarFormulario();
                    validator.resetForm();
                },
                error: function(){
                    mostrarMensaje(MSG_ERROR);
                }
            });
        }
    });

 //ACTUALIZARRECHAZA
    $("#id_btn_desaprueba").click(function(){
        var validator = $('#id_form_registra').data('bootstrapValidator');
        validator.validate();
        if (validator.isValid()) {
            $.ajax({
                type: "POST",
                url: "actualizaSolicitudPrestamosRechaza",
                data: $('#id_form_registra').serialize(),
                success: function(data){
                    agregarGrilla(data.lista);
                    $('#id_div_modal_registra').modal("hide");
                    mostrarMensaje(data.mensaje);
                    limpiarFormulario();
                    validator.resetForm();
                },
                error: function(){
                    mostrarMensaje(MSG_ERROR);
                }
            });
        }



    });

    function accionEliminar(id){
        $.ajax({
            type: "POST",
            url: "eliminaCrudAlumno",
            data: {"id":id},
            success: function(data){
                agregarGrilla(data.lista);
            },
            error: function(){
                mostrarMensaje(MSG_ERROR);
            }
        });
    }
    function editar(idSolicitudPrestamos,usureg,monto,pagodiario){
        $('#id_solicitud').val(idSolicitudPrestamos);
        $('#id_reg_prestatario').val(usureg);
        $('#id_reg_monto').val(monto);
        $('#id_reg_pagod').val(pagodiario);
        $('#id_div_modal_registra').modal("show");
    }

    $('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            nombres: {
                selector : '#id_reg_nombres',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                        message:'El nombre es de 2 a 40 caracteres',
                        min : 3,
                        max : 100
                    },
                    /*
                                     remote :{
                                        delay   : 1000,
                                        url     : 'buscaAlumnoNombreApellidoRegistro',
                                        message : 'El alumno ya existe',
                                        data: {
                                                nombres: function() {
                                                    return $('#id_reg_nombres').val();
                                                },
                                                apellidos: function() {
                                                    return $('#id_reg_apellidos').val();
                                                }
                                        },
                                    }
                     */
                }
            },
            apellidos: {
                selector : '#id_reg_apellidos',
                validators: {
                    notEmpty: {
                        message: 'El apellido es un campo obligatorio'
                    },
                    stringLength :{
                        message: 'El apellido es de 2 a 40 caracteres',
                        min : 3,
                        max : 100
                    },
                    /*
                                     remote :{
                                        delay   : 1000,
                                        url     : 'buscaAlumnoNombreApellidoRegistro',
                                        message : 'El alumno ya existe',
                                        data: {
                                                nombres: function() {
                                                    return $('#id_reg_nombres').val();
                                                },
                                                apellidos: function() {
                                                    return $('#id_reg_apellidos').val();
                                                }
                                        },
                                    }
                     */
                }
            },

            dni : {
                selector: "#id_reg_dni",
                validators : {
                    notEmpty: {
                        message: 'El DNI es requerido'
                    },
                    regexp: {
                        regexp: /^[0-9]{8}$/,
                        message: 'El DNI debe tener 8 d�gitos'
                    }
                }
            },
            login: {
                selector : '#id_reg_login',
                validators: {
                    notEmpty: {
                        message: 'El login es un campo obligatorio'
                    },
                    stringLength :{
                        message:'El login es de 2 a 40 caracteres',
                        min : 3,
                        max : 100
                    },
                }
            },
            password: {
                selector : '#id_reg_password',
                validators: {
                    notEmpty: {
                        message: 'El password es un campo obligatorio'
                    },
                    stringLength :{
                        message:'El password es de 2 a 40 caracteres',
                        min : 3,
                        max : 100
                    },
                }
            },
            correo : {
                selector: "#id_reg_correo",
                validators : {
                    notEmpty: {
                        message: 'El correo es requerido'
                    },
                    regexp: {
                        regexp: /^[A-Za-z0-9+_.-]+@(.+)$/,
                        message: 'Ingrese un correo v�lido'
                    }
                }
            },
            fechaNacimiento: {
                selector : '#id_reg_fecha_nacimiento',
                validators: {
                    notEmpty: {
                        message: 'La fecha de Nacimiento es un campo obligatorio'
                    },
                    /*
                                     remote :{
                                        delay   : 1000,
                                        url     : 'buscaAutorMayorEdad',
                                        message : 'El empleado debe ser mayor de edad'
                                    }
                     */
                }
            },

            direccion: {
                selector: "#id_reg_direccion",
                validators : {
                    notEmpty: {
                        message: 'La direccion es requerida'
                    },
                }
            },
        }
    });

    $('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            nombres: {
                selector : '#id_act_nombres',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                        message:'El nombre es de 2 a 40 caracteres',
                        min : 3,
                        max : 100
                    },
                    remote :{
                        delay   : 1000,
                        url     : 'buscaAlumnoNombreApellidoActualiza',
                        message : 'El alumno ya existe',
                        data: {
                            nombres: function() {
                                return $('#id_act_nombres').val();
                            },
                            apellidos: function() {
                                return $('#id_act_apellidos').val();
                            },
                            id: function() {
                                return $('#id_ID').val();
                            }
                        },
                    }
                }
            },
            apellidos: {
                selector : '#id_act_apellidos',
                validators: {
                    notEmpty: {
                        message: 'El apellido es un campo obligatorio'
                    },
                    stringLength :{
                        message:'El apellido es de 2 a 40 caracteres',
                        min : 3,
                        max : 100
                    },
                    remote :{
                        delay   : 1000,
                        url     : 'buscaAlumnoNombreApellidoActualiza',
                        message : 'El alumno ya existe',
                        data: {
                            nombres: function() {
                                return $('#id_act_nombres').val();
                            },
                            apellidos: function() {
                                return $('#id_act_apellidos').val();
                            },
                            id: function() {
                                return $('#id_ID').val();
                            }
                        },
                    }
                }
            },
            telefono: {
                selector: "#id_act_telefono",
                validators : {
                    notEmpty: {
                        message: 'El Tel�fono es Requerido'
                    },
                    regexp: {
                        regexp: /^[0-9]{9}$/,
                        message: 'El Tel�fono debe tener 9 d�gitos'
                    },
                    //remote :{
                    //delay: 1000,
                    //url: 'buscaAutorPorTelefono' ,
                    //message: 'El Telefono ya Existe'
                    //}
                }
            },
            fechaNacimiento: {
                selector : '#id_act_fecha_nacimiento',
                validators: {
                    notEmpty: {
                        message: 'La fecha de Nacimiento es un campo obligatorio'
                    },
                    remote :{
                        delay   : 1000,
                        url     : 'buscaAutorMayorEdad',
                        message : 'El empleado debe ser mayor de edad'
                    }
                }
            },
            dni : {
                selector: "#id_act_dni",
                validators : {
                    notEmpty: {
                        message: 'El DNI es requerido'
                    },
                    regexp: {
                        regexp: /^[0-8]{8}$/,
                        message: 'El DNI debe tener 8 d�gitos'
                    }
                }
            },
            correo : {
                selector: "#id_act_correo",
                validators : {
                    notEmpty: {
                        message: 'El correo es requerido'
                    },
                    regexp: {
                        regexp: /^[A-Za-z0-9+_.-]+@(.+)$/,
                        message: 'Ingrese un correo v�lido'
                    }
                }
            },
            pais: {
                selector: "#id_act_pais",
                validators : {
                    notEmpty: {
                        message: 'El Pa�s es requerido'
                    },
                }
            },
            modalidad: {
                selector: "#id_act_modalidad",
                validators : {
                    notEmpty: {
                        message: 'La modalidad es requerida'
                    },
                }
            },
        }
    });





</script>
</body>
</html>