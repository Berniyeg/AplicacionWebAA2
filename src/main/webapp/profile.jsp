<%@ page import="com.svalero.artmarket.dao.Database" %>
<%@ page import="com.svalero.artmarket.dao.UserDao" %>
<%@ page import="com.svalero.artmarket.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil de Usuario</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #343a40; /* Fondo oscuro */
            color: #f8f9fa; /* Color del texto */
        }
        .profile-container {
            margin-top: 50px;
        }
        .profile-card {
            background: #495057; /* Fondo más oscuro para las tarjetas */
            border: 1px solid #6c757d; /* Borde gris claro */
            padding: 20px;
            border-radius: 8px;
        }
        .card-title {
            color: #f8f9fa; /* Color del texto en las tarjetas */
        }
        .card-text {
            color: #f8f9fa; /* Color del texto secundario */
            border-bottom: 1px solid #6c757d; /* Línea gris inferior */
            padding-bottom: 10px; /* Espaciado inferior */
            margin-bottom: 10px; /* Espaciado inferior */
        }
        .card-text:last-of-type {
            border-bottom: none; /* Quitar borde en el último campo */
        }
        .btn-view {
            background-color: #6c757d; /* Botón gris */
            color: white;
        }
        .btn-edit {
            background-color: #6c757d; /* Botón verde para modificar */
            color: white;
            margin-right: 10px; /* Espaciado a la derecha del botón */
        }
        .btn {
            border-radius: 20px; /* Bordes redondeados */
            padding: 10px 20px; /* Tamaño del botón */
            font-weight: bold; /* Negrita en el texto del botón */
            text-decoration: none; /* Elimina el subrayado */
            text-align: center; /* Texto centrado */
        }
        .btn-group-center {
            display: flex;
            justify-content: center; /* Centrando los botones */
            margin-top: 20px;
        }
    </style>
</head>
<%
    String idProfile = request.getParameter("id");
    if (idProfile != null && !idProfile.isEmpty()) {
        try {
            int id = Integer.parseInt(idProfile);

            Database.connect();
            User user = Database.jdbi.withExtension(UserDao.class, dao -> dao.getUser(id));
            if (user != null) {
%>
<body>

<div class="container profile-container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card profile-card">
                <div class="card-body">
                    <h5 class="card-title text-center">Perfil de Usuario</h5>
                    <p class="card-text"><strong>User:   </strong> <%= user.getUsername() %> </p>
                    <p class="card-text">
                        <strong>Name:   </strong> <%= user.getName() %>
                    </p>
                    <p class="card-text">
                        <strong>Phone:   </strong> <%= user.getPhone() %>
                    </p>
                    <p class="card-text">
                        <strong>Email:   </strong> <%= user.getEmail() %>
                    </p>
                    <div class="btn-group-center">
                        <a href="register-user.jsp?id=<%= user.getId() %>" class="btn btn-edit">Modificar</a>
                        <a href="index.jsp" class="btn btn-view">Volver</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%
} else {
%>
<div class="container">
    <div class="alert alert-danger" role="alert">
        La obra de arte con ID <%= id %> no se encontró.
    </div>
    <a href="index.jsp" class="btn btn-outline-light back-button">Volver</a>
</div>
<%
    }
} catch (NumberFormatException e) {
%>
<div class="container">
    <div class="alert alert-danger" role="alert">
        El ID proporcionado no es válido. Por favor, intenta de nuevo.
    </div>
    <a href="index.jsp" class="btn btn-outline-light back-button">Volver</a>
</div>
<%
    }
} else {
%>
<div class="container">
    <div class="alert alert-danger" role="alert">
        No se proporcionó un ID válido. Por favor, intenta de nuevo.
    </div>
    <a href="index.jsp" class="btn btn-outline-light back-button">Volver</a>
</div>
<%
    }
%>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
