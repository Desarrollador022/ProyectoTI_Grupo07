<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Expires" content="-1" />
	<meta http-equiv="Cache-Control" content="private" />
	<meta http-equiv="Cache-Control" content="no-store" />
	<meta http-equiv="Pragma" content="no-cache" />

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
<div class="container" style="margin-top: 4%"><h4>CRUD Prestamista</h4></div>

<div class="container" style="margin-top: 1%">
	<!-- Agregar aqu� -->

	<div class="col-md-23" >

		<div class="row" style="height: 70px">
			<input type="hidden" id="id_txt_usureg" value=${sessionScope.objUsuario.idUsuario}>
			<div class="col-md-6" >
				<input class="form-control" id="id_txt_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
			</div>
			<div class="col-md-2" >
				<button type="button" class="btn btn-primary" id="id_btn_filtrar" style="width: 150px">FILTRA</button>
			</div>
			<div class="col-md-2">
				<button type="button" data-toggle='modal'  data-target="#id_div_modal_registra"  class='btn btn-success' style="width: 150px">REGISTRA</button>
			</div>
		</div>
		<div class="row" >
			<div class="col-md-12">
				<div class="content" >

					<table id="id_table" class="table table-striped table-bordered" >
						<thead>
						<tr>
							<th style="width: 5%" >ID</th>
							<th style="width: 10%">Nombre</th>
							<th style="width: 10%">Apellidos</th>
							<th style="width: 5%">DNI</th>
							<th style="width: 10%">Password</th>
							<th style="width: 10%">Correo</th>
							<th style="width: 10%">Celular</th>
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registra prestamista</h4>
				</div>
				<div class="modal-body" style="padding: 30px 20px;">
					<form id="id_form_registra" accept-charset="UTF-8" class="form-horizontal" method="post">
						<div class="panel-group" id="steps">
							<!-- Step 1 -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Jefe</a></h4>
								</div>
								<div id="stepOne" class="panel-collapse collapse in">
									<div class="panel-body">
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_reg_nombres">Nombres</label>
											<div class="col-lg-8">
												<input class="form-control" id="id_reg_nombres" name="nombre" placeholder="Ingrese el nombre" type="text" maxlength="20"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_reg_apellido">Apellidos</label>
											<div class="col-lg-8">
												<input class="form-control" id="id_reg_apellido" name="apellido" placeholder="Ingrese el apellido" type="text" maxlength="20"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_reg_dni">DNI</label>
											<div class="col-lg-3">
												<input class="form-control" type="text" id="id_reg_dni" name="dni" onkeypress="return soloNumeros(event)" placeholder="Ingrese su DNI" maxlength="8"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_reg_password">Contraseña</label>
											<div class="col-lg-3">
												<input class="form-control" type="text" id="id_reg_password" name="password"  placeholder="Ingrese su Contraseña"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_reg_correo">Correo</label>
											<div class="col-lg-3">
												<input class="form-control" type="text" id="id_reg_correo" name="email"  placeholder="Ingrese su correo"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_reg_dni">Celular</label>
											<div class="col-lg-3">
												<input class="form-control" type="text" id="id_reg_celular" name="celular" onkeypress="return soloNumeros(event)" placeholder="Ingrese su Celular" maxlength="9"/>
											</div>
										</div>
										<div class="form-group">
											<input type="hidden" id="id_reg_usureg" name="usureg" value=${sessionScope.objUsuario.idUsuario}></div>

										<div class="form-group">
											<div class="col-lg-9 col-lg-offset-3">
												<button type="button" class="btn btn-primary" id="id_btn_registra">REGISTRA</button>
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




	<!-- modal actualisa -->
	<div class="modal fade" id="id_div_modal_actualiza" >
		<div class="modal-dialog" style="width: 60%">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualizar Prestamistas</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
					<form id="id_form_actualiza" accept-charset="UTF-8" class="form-horizontal"     method="post">
						<div class="panel-group" id="stepsA">
							<!-- Step 1 -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Tesis</a></h4>
								</div>
								<div id="stepOneA" class="panel-collapse collapse in">
									<div class="panel-body">


										<div class="panel-body"><div class="form-group">
											<div class="col-lg-3">
												<input class="form-control" type="hidden" id="id_act_idA" name="idUsuario" maxlength="8"  />
											</div>
										</div>

											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_nombresA">Nombres</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_act_nombresA" name="nombre" placeholder="Ingrese el nombre" type="text" maxlength="20"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_apellidoA">Apellidos</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_act_apellidoA" name="apellido" placeholder="Ingrese el apellido" type="text" maxlength="20"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_dniA">DNI</label>
												<div class="col-lg-3">
													<input class="form-control" type="text" id="id_act_dniA" name="dni" onkeypress="return soloNumeros(event)" placeholder="Ingrese su DNI" maxlength="8" readonly />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_passwordA">Contraseña</label>
												<div class="col-lg-3">
													<input class="form-control" type="text" id="id_act_passwordA" name="password"  placeholder="Ingrese su Contraseña"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_correoA">Correo</label>
												<div class="col-lg-3">
													<input class="form-control" type="text" id="id_act_correoA" name="email"  placeholder="Ingrese su correo"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_celularA">Celular</label>
												<div class="col-lg-3">
													<input class="form-control" type="text" id="id_act_celularA" name="celular" onkeypress="return soloNumeros(event)" placeholder="Ingrese su Celular" maxlength="9"/>
												</div>
											</div>

											<div class="form-group">
												<input type="hidden" id="id_act_usureg" name="usureg" value=${sessionScope.objUsuario.idUsuario}></div>

											<div class="form-group">
												<div class="col-lg-9 col-lg-offset-3">
													<button type="button" class="btn btn-primary" id="id_btn_actualiza">ACTUALIZAR</button>
												</div>
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
	<!-- Agregar aqu� -->
	$.getJSON("listaZona", {}, function(data){
		$.each(data, function(index,item){
			$("#id_reg_zona").append("<option value="+item.idZona +">"+ item.nombre +"</option>");
		});
	});


	function soloNumeros(e) {
		var key = window.Event ? e.which : e.keyCode;
		return (key >= 48 && key <= 57);
	}
	function limpiarFormulario(){
		$("#id_nombre").val(' ');
		$("#id_apellido").val(' ');
		$("#id_telefono").val(' ');
		$("#id_dni").val(' ');
		$("#id_correo").val(' ');
		$("#id_fecha").val(' ');
		$("#id_modalidad").val('');
		$("#id_pais").val(' ');
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
				{data: "idUsuario"},
				{data: "nombre"},
				{data: "apellido"},
				{data: "dni"},
				{data: "password"},
				{data: "email"},
				{data: "celular"},
				{data: function(row, type, val, meta){
						var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+ row.idUsuario +'\',\''+row.nombre + '\',\'' + row.apellido +'\',\'' + row.dni +'\',\'' +  row.password + '\',\'' + row.email+ '\',\'' + row.celular + '\')">Editar</button>';
						return salida;
					},className:'text-center'},

			]
		});
	}
	//boton filtro
	$("#id_btn_filtrar").click(function(){
		var fil=$("#id_txt_filtro").val();
		var usureg=$("#id_txt_usureg").val();
		$.getJSON("consultaCrudPrestamista",{"filtro":fil,"usureg":usureg}, function (lista){
			agregarGrilla(lista);
		});
	});


	//REGISTRAR
	$("#id_btn_registra").click(function(){
		var validator = $('#id_form_registra').data('bootstrapValidator');
		validator.validate();

		if (validator.isValid()) {
			$.ajax({
				type: "POST",
				url: "registraCrudPrestamista",
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

	//ACTUALIZAR
	$("#id_btn_actualiza").click(function(){
		var validator = $('#id_form_actualiza').data('bootstrapValidator');
		validator.validate();
		if (validator.isValid()) {
			$.ajax({
				type: "POST",
				url: "actualizaCrudPrestamista",
				data: $('#id_form_actualiza').serialize(),
				success: function(data){
					agregarGrilla(data.lista);
					$('#id_div_modal_actualiza').modal("hide");
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
	function editar(idUsuario,nombre,apellido,dni,password,email,celular){
		$('#id_act_idA').val(idUsuario);
		$('#id_act_nombresA').val(nombre);
		$('#id_act_apellidoA').val(apellido);
		$('#id_act_dniA').val(dni);
		$('#id_act_passwordA').val(password);
		$('#id_act_correoA').val(email);
		$('#id_act_celularA').val(celular);
		$('#id_div_modal_actualiza').modal("show");
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