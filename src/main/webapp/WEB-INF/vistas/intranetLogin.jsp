<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="es" >
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/form-elements.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.css">


<title>Sistema Prestamos</title>
</head>   
<body>

<div class="top-content">
	<div class="inner-bg">
		<div class="container">
			<c:if test="${requestScope.mensaje != null}">
				<div class="alert alert-danger fade in" id="success-alert">
					<a href="#" class="close" data-dismiss="alert">&times;</a>
					<strong>${requestScope.mensaje}</strong>
				</div>
			</c:if>
			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="form-top">
						<div class="form-top-left">
							<h3>Ingreso al Sistema Prestamos</h3>
							<p>Ingrese su Usuario y Contraseña:</p>
						</div>
					</div>
					<div class="form-bottom">
						<form id="id_form" action="login" method="post" class="login-form">
							<div class="form-group">
								<label class="sr-only" for="form-username">Usuario</label>
								<input type="text" name="dni" placeholder="Ingrese Usuario" class="form-username form-control" id="form-username" maxlength="20">
							</div>
							<div class="form-group">
								<label class="sr-only" for="form-password">Contraseña</label>
								<input type="password" name="password" placeholder="Ingrese Contraseña" class="form-password form-control" id="form-password" maxlength="20">
							</div>
							<button type="submit" class="btn btn-success">Ingresar</button> <!-- Cambia el color del botón a verde -->
						</form>
					</div>
				</div>
				<div class="col-md-6">
					<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp" class="img-fluid" alt="Sample image">
				</div>
			</div>
		</div>
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>


<script type="text/javascript">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	dni: {
                validators: {
                    notEmpty: {
                        message: 'El usuario es obligatorio'
                    },
                    stringLength :{
                    	message: 'El usuario es de 3 a 20 caracteres',
                    	min : 3,
                    	max : 20
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'La contrase�a es obligatorio'
                    },
                    stringLength :{
                    	message: 'La contrase�a es de 3 a 20 caracteres',
                    	min : 3,
                    	max : 20
                    }
                }
            }
        }   
    });

    $('#validateBtn').click(function() {
        $('#id_form').bootstrapValidator('validate');
    });
});
</script>

</body>
</html>


