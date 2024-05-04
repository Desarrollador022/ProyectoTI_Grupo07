<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="esS">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="esS">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Expires" content="-1"/>
    <meta http-equiv="Cache-Control" content="private"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>

    <title>Sistema Prestamos</title>

    <!-- CSS -->
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="css/form-elements.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrapValidator.css">

    <!-- JS -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrapValidator.js"></script>
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <script src="assets/js/settings.js"></script>
    <script src="assets/js/todolist.js"></script>
</head>
<body>
<%--        <div class="top-content">--%>
<%--            <div class="inner-bg">--%>
<%--                <div class="container">--%>
<%--                	<c:if test="${requestScope.mensaje != null}">--%>
<%--               		<div class="alert alert-danger fade in" id="success-alert">--%>
<%--				        <a href="#" class="close" data-dismiss="alert">&times;</a>--%>
<%--				        <strong>${requestScope.mensaje}</strong>--%>
<%--				    </div>--%>
<%--				    </c:if>--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-sm-6 col-sm-offset-3 form-box">--%>
<%--                        	<div class="form-top">--%>
<%--                        		<div class="form-top-left">--%>
<%--                        			<h3>Ingreso al Sistema Prestamos</h3>--%>
<%--                            		<p>Ingrese su Usuario y Contrase�a:</p>--%>
<%--                        		</div>--%>
<%--                            </div>--%>
<%--                            <div class="form-bottom">--%>
<%--			                    <form id="id_form"  action="login" method="post" class="login-form">--%>
<%--			                    	<div class="form-group">--%>
<%--			                    		<label class="sr-only" for="form-username">Usuario</label>--%>
<%--			                        	<input type="text" name="dni" placeholder="Ingrese Usuario" class="form-username form-control" id="form-username" maxlength="20" >--%>
<%--			                        </div>--%>
<%--			                        <div class="form-group">--%>
<%--			                        	<label class="sr-only" for="form-password">Contrase�a</label>--%>
<%--			                        	<input type="password" name="password" placeholder="Ingrese Contrase�a" class="form-password form-control" id="form-password" maxlength="20" >--%>
<%--			                        </div>--%>
<%--			                        <button type="submit" class="btn btn-primary">Ingresar</button>--%>
<%--			                    </form>--%>
<%--		                    </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                </div>--%>
<%--            </div>--%>

<%--        </div>--%>

<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="row w-100 m-0">
            <div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
                <div class="card col-lg-4 mx-auto">
                    <div class="card-body px-5 py-5">
                        <c:if test="${requestScope.mensaje != null}">
                            <div class="alert alert-danger fade in" id="success-alert">
                                <a href="#" class="close" data-dismiss="alert">&times;</a>
                                <strong>${requestScope.mensaje}</strong>
                            </div>
                        </c:if>
                        <h3 class="card-title text-left mb-3">Login</h3>
                        <form id="id_form" action="login" method="post" class="login-form">
                            <div class="form-group">
                                <label class="custom-label" style="color: #ffffff; font-weight: bold; font-size: 1.5em; text-align: left;">DNI *</label>
                                <input type="text" name="dni" class="form-username form-control" id="form-control p_input" maxlength="20">
                            </div>
                            <div class="form-group">
                                <label class="custom-label" style="color: #ffffff; font-weight: bold; font-size: 1.5em; text-align: left;">PASSWORD *</label>
                                <input type="password" name="password" class="form-control p_input" id="form-password" maxlength="20">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary btn-block enter-btn">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
        </div>
        <!-- row ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>


<%--        Scripst y validaciones--%>
<script type="text/javascript">
    $("#success-alert").fadeTo(1000, 500).slideUp(500, function () {
        $("#success-alert").slideUp(500);
    });
</script>


<script type="text/javascript">
    $(document).ready(function () {
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
                        stringLength: {
                            message: 'El usuario es de 3 a 20 caracteres',
                            min: 3,
                            max: 20
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: 'La contrase�a es obligatorio'
                        },
                        stringLength: {
                            message: 'La contrase�a es de 3 a 20 caracteres',
                            min: 3,
                            max: 20
                        }
                    }
                }
            }
        });

        $('#validateBtn').click(function () {
            $('#id_form').bootstrapValidator('validate');
        });
    });
</script>

</body>
</html>