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
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrapValidator.css"/>

    <title>Intranet</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />

<div class="container" style="margin-top: 200px">
<table class="table table-responsive" id="mitabla">
    <thead>
    <tr>
        <th scope="col">Duracion</th>
        <th scope="col" style="text-align: center">S/.150</th>
        <th scope="col" style="text-align: center">S/.200</th>
        <th scope="col" style="text-align: center">S/.300</th>
        <th scope="col" style="text-align: center">S/.400</th>
        <th scope="col" style="text-align: center">S/.500</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">15 dias</th>
        <td><button type="button" class="btn btn-light" >S/.154.11</button></td>
        <td><button type="button" class="btn btn-light" >S/.205.49</button></td>
        <td><button type="button" class="btn btn-light">S/.308.23</button></td>
        <td><button type="button" class="btn btn-light">S/.410.98</button></td>
        <td><button type="button" class="btn btn-light">S/.513.72</button></td>
    </tr>
    <tr>
        <th scope="row">20 dias</th>
        <td><button type="button" class="btn btn-light" onclick="mostrarContenido()">S/.155.49</button></td>
        <td><button type="button" class="btn btn-light">S/.207.32</button></td>
        <td><button type="button" class="btn btn-light">S/.310.98</button></td>
        <td><button type="button" class="btn btn-light">S/.414.64</button></td>
        <td><button type="button" class="btn btn-light">S/.518.30</button></td>
    </tr>
    <tr>
        <th scope="row">25 dias</th>
        <td><button type="button" class="btn btn-light">S/.156.86</button></td>
        <td><button type="button" class="btn btn-light">S/.209.15</button></td>
        <td><button type="button" class="btn btn-light">S/.313.72</button></td>
        <td><button type="button" class="btn btn-light">S/.414.64</button></td>
        <td><button type="button" class="btn btn-light">S/.522.88</button></td>
    </tr>
    <tr>
        <th scope="row">30 dias</th>
        <td><button type="button" class="btn btn-light">S/.157.23</button></td>
        <td><button type="button" class="btn btn-light">S/.210.98</button></td>
        <td><button type="button" class="btn btn-light">S/.316.47</button></td>
        <td><button type="button" class="btn btn-light">S/.421.98</button></td>
        <td><button type="button" class="btn btn-light">S/.527.48</button></td>
    </tr>
    <tr>
        <th scope="row">35 dias</th>
        <td><button type="button" class="btn btn-light">S/.159.61</button></td>
        <td><button type="button" class="btn btn-light">S/.212.81</button></td>
        <td><button type="button" class="btn btn-light">S/.319.22</button></td>
        <td><button type="button" class="btn btn-light">S/.425.62</button></td>
        <td><button type="button" class="btn btn-light">S/.532.03</button></td>
    </tr>
    </tbody>
</table>
</div>




















<div class="modal fade" id="id_div_modal_solicita" >
    <div class="modal-dialog" style="width: 60%">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="padding: 35px 50px">
<div class="container" style="margin-top: 4%"><h4>Registro Prestamo</h4></div>

<div class="container" style="margin-top: 1%">
    <!-- Agregar aqu� -->
    <form  id="id_form" method="post">
        <div class="col-md-12" style="margin-top: 2%">
            <div class="row">
                <div class="form-group">
                    <div class="panel-body">
                    <div class="form-group">

                        <label class="col-lg-3 control-label" for="id_reg_monto">Monto</label>
                        <div class="col-lg-8">
                            <input class="form-control" id="id_reg_monto" name="monto" placeholder="Ingrese el monto" type="text" maxlength="20" READONLY/>
                        </div>
                    </div>
                        <input class="form-control" type="hidden"  id="id_reg_montoprest" name="montoPrest">
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
                        <label class="col-lg-3 control-label" for="id_reg_pagoDiario">PagoDiario</label>
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
        </div>

    </form>
                </div>
            </div>
        </div>
    </div>
</div>




<script type="text/javascript">
    <!--FECHAYMONTO-->
    document.getElementById('id_reg_fechaInicio').addEventListener('change', function() {
        var fechaInicio = new Date(this.value);
        var dias= parseInt(($("#id_reg_dias").val()).match(/^\d+/)[0]);
        fechaInicio.setDate(fechaInicio.getDate() + dias);
        var fechaFin = fechaInicio.toISOString().split('T')[0]; // Formato YYYY-MM-DD
        document.getElementById('id_reg_fechaFin').value = fechaFin;
        calculaPago();
    });


        function calculaPago() {
        var montoTexto = document.getElementById('id_reg_monto').value;
            var matches = montoTexto.match(/\d+\.\d+/);
            var monto = matches ? parseFloat(matches[0]) : 0;
            var fechaInicio = new Date(document.getElementById('id_reg_fechaInicio').value);
        var fechaFin = new Date(document.getElementById('id_reg_fechaFin').value);

        var dLaborales = 0;
        while (fechaInicio<=fechaFin) {
            if (fechaInicio.getDay() !== 0 && fechaInicio.getDay() !== 6) {
                dLaborales++;
            }
            fechaInicio.setDate(fechaInicio.getDate() + 1); // Avanzar un día completo


            // Calcular interés
            var montoConInteres = monto * 1.1; // 10% de interés
            // Calcular pago diario
            var pagoDiario = montoConInteres / dLaborales;

            $('#id_reg_pagoDiario').val(pagoDiario.toFixed(2));
            $('#id_reg_monto').val(monto);
        }
    }


    <!--ABRIR MODAL-->
    function mostrarContenido() {
        var tr = this.closest('tr');

        if (tr) {
            // Obtener el contenido del <th> dentro del <tr>
            var thContent = tr.querySelector('th').innerText;
            var dias=parseInt(thContent.match(/\d+/)[0]);
            var buttonCellIndex = this.parentNode.cellIndex;

            var tdContent = tr.querySelectorAll('td')[buttonCellIndex-1].innerText
            var thColumnContent = tr.closest('table').querySelectorAll('th')[buttonCellIndex].innerText;
            var montoprest = parseInt(thColumnContent.replace(/\D/g, ''), 10);


            $('#id_reg_monto').val(tdContent);
            $('#id_reg_dias').val(dias);
            $('#id_reg_montoprest').val(montoprest);
            $('#id_div_modal_solicita').modal("show");


        } else {
            console.error("No se pudo encontrar el elemento <tr>.");
        }
    }




    document.querySelectorAll('#mitabla button').forEach(function(button) {
        button.addEventListener('click', mostrarContenido);
    });


<!--REGISTRAR-->
    $("#id_registrar").click(function (){
        var validator = $('#id_form').data('bootstrapValidator');
        validator.validate();

        if (validator.isValid()){
            $.ajax({
                type: "POST",
                url: "registraSolicitudPrestamo",
                data: $('#id_form').serialize(),
                success: function(data){
                    mostrarMensaje(data.mensaje);
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
                        regexp: /^[0-9]{8}$/,
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


</body>
</html>










