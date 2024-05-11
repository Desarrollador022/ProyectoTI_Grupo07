<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrapValidator.js"></script>



    <link rel="stylesheet" href="css/form-elements.css">

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap.css">


    <title>Sistema Prestamos</title>
</head>

<body>

<div class="container-fluid">
    <div class="container">
        <div class="row">
            <c:if test="${requestScope.mensaje != null}">
                <div class="alert alert-danger fade in" id="success-alert">
                    <a href="#" class="close" data-dismiss="alert">&times;</a>
                    <strong>${requestScope.mensaje}</strong>
                </div>
            </c:if>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 bg_section_login" style="margin-top: 100px">
                <img class="logo" src="images/bg_login_desk.png" alt=""/>
            </div>

            <div class="col-12 m_bg_section_login" style="margin-top: 150px">
                <img src="images/logoPrestamos.jpg" alt=""/>
            </div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 login_section">
                <form id="id_form" action="login" method="post" class="login-form">
                    <h3>Ingreso al Sistema Prestamos</h3>
                    <div class="form-group">
                        <label class="sr-only" for="form-username">Usuario</label>
                        <input type="text" name="dni" placeholder="Ingrese Usuario"
                               class="form-username form-control" id="form-username" maxlength="20">
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="form-password">Contrasena</label>
                        <input type="password" name="password" placeholder="Ingrese Contrasena"
                               class="form-password form-control" id="form-password" maxlength="20">
                    </div>
                    <button type="submit" class="btn btn-outline-primary">INGRESAR</button>
                </form>
            </div>
        </div>
    </div>

<!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

    <script src="js/index.js"></script>

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


