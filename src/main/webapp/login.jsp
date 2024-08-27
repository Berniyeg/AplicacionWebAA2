<%@ page contentType="text/html;charset=UTF-8"%>

<head>
    <title>Iniciar Sesión</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #343a40; /* Fondo oscuro */
            color: #f8f9fa; /* Color del texto */
        }
        .login-container {
            margin-top: 50px;
        }
        .login-card {
            background-color: #495057; /* Fondo oscuro para la tarjeta */
            border: 1px solid #6c757d; /* Borde gris claro */
            padding: 20px;
            border-radius: 8px;
        }
        .form-control {
            background-color: #6c757d; /* Fondo gris para los campos del formulario */
            color: #f8f9fa; /* Color del texto en los campos del formulario */
        }
        .btn-primary {
            background-color: #007bff; /* Color del botón de inicio de sesión */
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3; /* Color más oscuro del botón al pasar el cursor */
        }
        .card-title {
            color: #f8f9fa; /* Color del texto en el título de la tarjeta */
        }
    </style>
</head>
<body>

<div class="container login-container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card login-card">
                <div class="card-body">
                    <h5 class="card-title text-center">Iniciar Sesión</h5>
                    <form id="login-form">
                        <div class="form-group">
                            <label for="username">Nombre de Usuario</label>
                            <input type="text" name="username" class="form-control" id="username" placeholder="Introduce tu nombre de usuario">
                        </div>
                        <div class="form-group">
                            <label for="password">Contraseña</label>
                            <input type="password" name="password" class="form-control" id="password" placeholder="Introduce tu contraseña">
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Iniciar Sesión</button>
                        <br/>
                        <a href="index.jsp" class="btn btn-outline-light back-button">Volver</a>
                    </form>
                    <br/>
                    <div id="result"></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<%@include file="includes/login-ajax.jsp"%>
