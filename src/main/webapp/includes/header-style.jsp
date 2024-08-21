<%@ page contentType="text/html;charset=UTF-8" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - Mercado de Arte</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        body {
            background-color: #343a40; /* Fondo más oscuro */
            color: #f8f9fa; /* Color del texto */
        }
        .header {
            background: #495057; /* Fondo más oscuro para la cabecera */
            padding: 30px 0;
            text-align: center;
            color: #f8f9fa; /* Color del texto en la cabecera */
        }
        .footer {
            background: #495057; /* Fondo más oscuro para el pie de página */
            color: white;
            padding: 10px 0;
            text-align: center;
        }
        .navbar-light .navbar-nav .nav-link {
            color: #f8f9fa; /* Color del texto en la barra de navegación */
        }
        .navbar-light .navbar-brand {
            color: #f8f9fa; /* Color del texto del nombre del sitio en la barra de navegación */
        }
        .navbar-nav .nav-item .nav-link {
            display: flex;
            align-items: center;
        }
        .navbar-nav .nav-item .nav-link, .navbar-nav .nav-item .nav-link {
            color: #f8f9fa; /* Color de texto amarillo al pasar el cursor */
        }

        .highlight {
            background-color: #435bf4; /* Fondo amarillo para resaltar */
            color: black; /* Color del texto */
            border-radius: 5px;
            padding: 5px 10px;
        }
        .artwork {
            margin: 20px 0;
        }
        .artwork .card {
            margin-bottom: 20px;
            background: #495057; /* Fondo más oscuro para las tarjetas */
            border: 1px solid #6c757d; /* Borde gris claro */
        }
        .card-title, .card-text, .card-artist, .card-price {
            color: #f8f9fa; /* Color del texto en las tarjetas */
        }
        .btn-delete {
            background-color: #dc3545; /* Rojo para eliminar */
            color: white;
        }
        .btn-edit {
            background-color: #9e9d9b; /* Amarillo para modificar */
            color: white;
        }
        .btn-view {
            background-color: #28a745; /* Verde para ver */
            color: white;
        }
        .btn {
            margin-right: 5px; /* Espaciado entre botones */
        }
        .navbar-nav .nav-item {
            margin-left: 10px; /* Espaciado entre los ítems de navegación */
        }
    </style>
</head>

<%
    HttpSession currentSession = request.getSession();
    String role = "anonymous";
    String username = "";

    if (currentSession.getAttribute("role") != null) {
        role = currentSession.getAttribute("role").toString();
    }

    if (currentSession.getAttribute("username") != null) {
        username = currentSession.getAttribute("username").toString();
    }
%>

<body>
<!-- Navegación -->
<nav class="navbar navbar-expand-lg navbar-light bg-dark">
    <a class="navbar-brand" href="/ArtMarket/">Mercado de Arte</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <%
                if (role.equals("anonymous")) {
            %>
            <li class="nav-item">
                <a class="nav-link" href="register-user.jsp" title="Registrar Usuario"><i class="fas fa-user-plus"></i> Registrar</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp" title="Acceder al Perfil"><i class="fas fa-user"></i> Perfil</a>
            </li>
            <%
            } else {
            %>
            <li class="nav-item">
                Welcome, <%= username %>!
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout" title="Cerrar Sesión"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
            </li>
            <%
                }
            %>
        </ul>
    </div>
</nav>
</body>

