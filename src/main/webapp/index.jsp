<%@ page contentType="text/html;charset=UTF-8" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - Mercado de Arte</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
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
        .card-title, .card-text {
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
<body>

<!-- Navegación -->
<nav class="navbar navbar-expand-lg navbar-light bg-dark">
    <a class="navbar-brand" href="#">Mercado de Arte</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link highlight" href="#">Subir Obra</a>
            </li>
            <li class="nav-item">
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Buscar obras" aria-label="Buscar">
                    <button class="btn btn-light my-2 my-sm-0" type="submit">Buscar</button>
                </form>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#" title="Registrar Usuario"><i class="fas fa-user-plus"></i> Registrar</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" title="Acceder al Perfil"><i class="fas fa-user"></i> Perfil</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Cabecera -->
<header class="header">
    <div class="container">
        <h1 class="display-4">Bienvenido al Mercado de Arte</h1>
        <p class="lead">Descubre y compra obras de arte únicas de artistas talentosos.</p>
    </div>
</header>

<!-- Cuerpo -->
<main role="main" class="container">
    <div class="artwork py-5">
        <div class="container">
            <div class="row">
                <!-- Ejemplo de una obra de arte -->
                <div class="col-md-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/350x200" class="card-img-top" alt="Obra de Arte 1">
                        <div class="card-body">
                            <h5 class="card-title">Título de Obra 1</h5>
                            <p class="card-text">Descripción breve de la obra de arte. Artista: Juan Pérez. Precio: $1000.</p>
                            <a href="#" class="btn btn-view">Ver</a>
                            <a href="#" class="btn btn-edit">Modificar</a>
                            <a href="#" class="btn btn-delete">Eliminar</a>
                        </div>
                    </div>
                </div>
                <!-- Otra obra de arte -->
                <div class="col-md-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/350x200" class="card-img-top" alt="Obra de Arte 2">
                        <div class="card-body">
                            <h5 class="card-title">Título de Obra 2</h5>
                            <p class="card-text">Descripción breve de la obra de arte. Artista: María Gómez. Precio: $750.</p>
                            <a href="#" class="btn btn-view">Ver</a>
                            <a href="#" class="btn btn-edit">Modificar</a>
                            <a href="#" class="btn btn-delete">Eliminar</a>
                        </div>
                    </div>
                </div>
                <!-- Otra obra de arte -->
                <div class="col-md-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/350x200" class="card-img-top" alt="Obra de Arte 3">
                        <div class="card-body">
                            <h5 class="card-title">Título de Obra 3</h5>
                            <p class="card-text">Descripción breve de la obra de arte. Artista: Carlos López. Precio: $300.</p>
                            <a href="#" class="btn btn-view">Ver</a>
                            <a href="#" class="btn btn-edit">Modificar</a>
                            <a href="#" class="btn btn-delete">Eliminar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Pie de página -->
<footer class="footer">
    <div class="container">
        <p>&copy; 2024 Mercado de Arte. Todos los derechos reservados.</p>
    </div>
</footer>

<!-- Bootstrap JS, Popper.js, jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
