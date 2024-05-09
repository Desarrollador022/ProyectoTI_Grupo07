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

    <title>Intranet</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%"><h4>Registro Prestamo</h4></div>

<div class="container" style="margin-top: 1%">
    <!-- Agregar aqu� -->
    <form  id="id_form" method="post">
        <div class="col-md-12" style="margin-top: 2%">
            <div class="row">
                <div class="form-group">

                    <div class="form-group">
                        <label class="col-lg-3 control-label" for="id_reg_monto">Monto</label>
                        <div class="col-lg-8">
                            <input class="form-control" id="id_reg_monto" name="monto" placeholder="Ingrese el monto" type="text" maxlength="20"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label" for="id_reg_fechaInicio">Fecha de Inicio</label>
                        <div class="col-lg-3">
                            <input class="form-control" type="date" id="id_reg_fechaInicio" name="fechaInicio" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label" for="id_reg_fechaFin">Fecha fin</label>
                        <div class="col-lg-3">
                            <input class="form-control" type="date" id="id_reg_fechaFin" readonly="readonly" name="fechaFin"  />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label" for="id_reg_dias">Dias</label>
                        <div class="col-lg-3">
                            <input class="form-control" type="text" id="id_reg_dias" name="dias"   readonly="readonly" value="30"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label" for="id_reg_pagoDiario">Dias</label>
                        <div class="col-lg-3">
                            <input class="form-control" type="text" id="id_reg_pagoDiario" name="pagoDiario" readonly="readonly"  />
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-12" align="center">
                    <button id="id_registrar" type="button" class="btn btn-primary" >Solicita</button>
                </div>
            </div>
        </div>
    </form>
</div>




<script type="text/javascript">
    <!-- Agregar aqu� -->


    $("#id_registrar").click(function (){
        var validator = $('#id_form').data('bootstrapValidator');
        validator.validate();

        if (validator.isValid()){
            $.ajax({
                type: "POST",
                url: "registraSolicitudPrestamo",
                data: $('#id_form').serialize(),
                success: function(data){
                    mostrarMensaje(data.MENSAJE);
                    validator.resetForm();
                    limpiarFormulario();
                },
                error: function(){
                    mostrarMensaje(MSG_ERROR);
                }
            });
        }
    });


    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },

        fields:{
            nombres : {
                selector: "#id_nombre",
                validators : {
                    notEmpty: {
                        message: 'El nombre del alumno es requerido'
                    },
                    stringLength: {
                        min: 2,
                        max: 40,
                        message: 'El nombre debe tener de 2 a 40 caracteres'
                    },
                    remote:{
                        delay:1000,
                        url:'buscaAlumnoPorNombre',
                        message:'El nombre ya existe'
                    }
                }
            },
            apellidos : {
                selector: "#id_apellido",
                validators : {
                    notEmpty: {
                        message: 'El apellido del alumno es requerido'
                    },
                    stringLength: {
                        min: 2,
                        max: 40,
                        message: 'El apellido debe tener entre 3 a 40 caracteres'
                    }
                }
            },
            telefono : {
                selector: "#id_telefono",
                validators : {
                    notEmpty: {
                        message: 'El telefono es requerido'
                    },
                    regexp: {
                        regexp: /^[0-9]{9}$/,
                        message: 'El tel�fono debe tener 9 d�gitos'
                    }
                }
            },

            dni : {
                selector: "#id_dni",
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
                selector: "#id_correo",
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
            fechaNacimiento : {
                selector: "#id_fecha",
                validators : {
                    notEmpty: {
                        message: 'La fecha es requerida'
                    },
                }
            },
            pais : {
                selector: "#id_pais",
                validators : {
                    notEmpty: {
                        message: 'El Pais es requerido'
                    },
                }
            },
            modalidad : {
                selector: "#id_modalidad",
                validators : {
                    notEmpty: {
                        message: 'La modalidad es requerida'
                    },
                }
            },
        }
    });
</script>


<script>

</script>

<script>
    document.getElementById('id_reg_fechaInicio').addEventListener('change', function() {
        var fechaInicio = new Date(this.value);
        fechaInicio.setDate(fechaInicio.getDate() + 30);
        var fechaFin = fechaInicio.toISOString().split('T')[0]; // Formato YYYY-MM-DD
        document.getElementById('id_reg_fechaFin').value = fechaFin;
    });


    document.getElementById('id_reg_monto').addEventListener('change', function() {
        var monto = parseFloat(document.getElementById('id_reg_monto').value);
        var fechaInicio = new Date(document.getElementById('id_reg_fechaInicio').value);
        var fechaFin = new Date(document.getElementById('id_reg_fechaFin').value);
        var dias = parseInt(document.getElementById('id_reg_dias').value);

        // Calcular interés
        var montoConInteres = monto * 1.1; // 10% de interés

        // Calcular cantidad de cuotas
        var cuotas = 30;

        // Calcular pago diario
        var pagoDiario = montoConInteres / cuotas;






        document.getElementById('id_reg_pagoDiario').value = pagoDiario.toFixed(2);
    });
</script>
</body>
</html>










