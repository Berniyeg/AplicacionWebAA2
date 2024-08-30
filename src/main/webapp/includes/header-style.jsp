<%@ page contentType="text/html;charset=UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Art Market</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        /* General */
        body {
            background-color: #343a40; /* Fondo oscuro */
            color: #f8f9fa; /* Color del texto */
            font-family: 'Arial', sans-serif; /* Fuente moderna */
        }

        /* Cabecera */
        .header {
            background: #495057; /* Fondo oscuro */
            color: #f8f9fa; /* Color del texto */
            padding: 40px 0;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Sombra sutil */
        }

        .header h1 {
            font-size: 2.5rem; /* Tamaño de fuente más grande para el título */
            margin-bottom: 10px;
        }

        .header p {
            font-size: 1.1rem; /* Tamaño de fuente para la descripción */
        }

        /* Pie de página */
        .footer {
            background: #495057; /* Fondo oscuro */
            color: #f8f9fa; /* Color del texto */
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 -4px 6px rgba(0, 0, 0, 0.1); /* Sombra sutil */
        }

        /* Barra de navegación */
        .navbar-light .navbar-nav .nav-link,
        .navbar-light .navbar-brand {
            color: #f8f9fa; /* Color del texto en la barra de navegación */
        }

        .navbar-nav .nav-item {
            margin-left: 15px; /* Espaciado entre los ítems de navegación */
        }

        .navbar-nav .nav-item .nav-link {
            display: flex;
            align-items: center;
            transition: color 0.3s; /* Transición suave para el cambio de color */
        }

        .navbar-nav .nav-item .nav-link:hover {
            color: #adb5bd; /* Color de texto al pasar el cursor */
        }

        /* Resaltado */
        .highlight {
            background-color: #435bf4; /* Fondo azul para resaltar */
            color: #ffffff; /* Color del texto */
            border-radius: 20px; /* Bordes redondeados */
            padding: 8px 16px; /* Espaciado más amplio */
            text-decoration: none;
            font-weight: bold;
        }

        /* Estilos para las pestañas */
        .tab {
            overflow: hidden;
            border-bottom: 1px solid #ccc;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Botones de pestañas */
        .tab button {
            background-color: inherit;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            transition: 0.3s;
            font-size: 17px;
            margin: 0 5px;
        }

        /* Botones de pestañas activos */
        .tab button.active {
            background-color: #ccc;
        }

        /* Contenido de las pestañas */
        .tabcontent {
            display: none;
        }

        /* Mostrar contenido activo */
        .tabcontent.active {
            display: block;
        }


        /* Secciones */
        .artwork, .sculpture {
            margin: 30px 0; /* Margen más amplio */
        }

        .card {
            margin-bottom: 20px;
            background: #495057; /* Fondo oscuro para las tarjetas */
            border: none; /* Sin borde */
            border-radius: 10px; /* Bordes redondeados */
            overflow: hidden; /* Asegura que el contenido no sobresalga */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Sombra de tarjeta */
            transition: box-shadow 0.3s; /* Transición suave para la sombra */
        }

        .card:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); /* Sombra más pronunciada */
        }

        .card-img-top {
            border-bottom: 2px solid #6c757d; /* Borde inferior en la imagen */
        }

        .card-body {
            padding: 20px;
            display: flex;
            flex-direction: column; /* Disposición en columna para alinear elementos */
            align-items: center; /* Alinea horizontalmente al centro */
        }

        .card-title {
            font-size: 1.25rem; /* Tamaño de fuente del título */
            margin-bottom: 10px;
        }

        .card-text {
            font-size: 1rem; /* Tamaño de fuente del texto */
            margin-bottom: 10px;
        }

        .card-price {
            font-weight: bold;
            margin-bottom: 15px; /* Espacio debajo del precio */
        }

        /* Botones */
        .btn {
            margin: 5px 0; /* Espaciado vertical entre botones */
            border-radius: 20px; /* Bordes redondeados */
            padding: 10px 20px; /* Tamaño de botones */
            font-weight: bold;
            text-decoration: none; /* Elimina el subrayado */
            transition: background-color 0.3s, transform 0.3s; /* Transiciones suaves */
        }

        .btn:hover {
            transform: none; /* Elimina el efecto de elevación */
        }

        .btn-delete {
            background-color: #dc3545; /* Rojo para eliminar */
            color: #ffffff;
        }

        .btn-delete:hover {
            background-color: #c82333; /* Rojo más oscuro al pasar el cursor */
        }

        .btn-edit {
            background-color: #6c757d; /* Gris para modificar */
            color: #ffffff;
        }

        .btn-edit:hover {
            background-color: #5a6268; /* Gris más oscuro al pasar el cursor */
        }

        .btn-view {
            background-color: #28a745; /* Verde para ver */
            color: #ffffff;
        }

        .btn-view:hover {
            background-color: #218838; /* Verde más oscuro al pasar el cursor */
        }

        /* Contenedor de botones */
        .btn-container {
            display: flex;
            justify-content: center; /* Centra los botones horizontalmente */
            gap: 10px; /* Espaciado entre botones */
            flex-wrap: wrap; /* Permite que los botones se envuelvan si es necesario */
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
    <a class="navbar-brand" href="/ArtMarket/">Art Market</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <%
                if (role.equals("anonymous")) {
            %>
            <li class="nav-item">
                <a class="nav-link" href="register-user.jsp" title="Register new user"><i class="fas fa-user-plus"></i>
                    Sign up</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp" title="Access profile"><i class="fas fa-user"></i> Login</a>
            </li>
            <%
            } else {
            %>
            <li class="nav-item">
                <span class="nav-link nav-link-saludo">Welcome, <%= username %>!</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="profile.jsp?id=2" title="Profile"><i class="fas fa-user"></i>
                    Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout" title="Logout"><i class="fas fa-sign-out-alt"></i> Logout </a>
            </li>
            <%
                }
            %>
        </ul>
    </div>
</nav>
</body>

