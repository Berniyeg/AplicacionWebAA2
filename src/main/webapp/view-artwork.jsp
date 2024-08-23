<%@ page import="com.svalero.artmarket.dao.Database" %>
<%@ page import="com.svalero.artmarket.domain.Artwork" %>
<%@ page import="com.svalero.artmarket.dao.ArtworkDao" %>
<%@ page import="com.svalero.artmarket.util.CurrencyUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle de la Obra de Arte</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #343a40; /* Fondo oscuro */
            color: #f8f9fa; /* Color del texto */
        }

        .container {
            margin-top: 20px;
        }

        .card {
            background-color: #495057; /* Fondo oscuro para la tarjeta */
            border: 1px solid #6c757d; /* Borde gris claro */
        }

        .card-title, .card-text, .list-group-item {
            color: #f8f9fa; /* Color del texto */
        }

        .list-group-item {
            background-color: #495057; /* Fondo oscuro para la lista */
            border: 1px solid #6c757d; /* Borde gris claro */
        }

        .back-button {
            margin-top: 20px;
        }

        .card-img {
            height: 100%; /* Imagen a la altura completa del contenedor */
            object-fit: cover; /* Cubrir completamente el espacio disponible */
        }

        .page-title {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>
<div class="container">
    <h1 class="page-title">Detalle de la Obra de Arte</h1>
</div>
    <%
    // Validar el parámetro "id"
    String idParam = request.getParameter("id");
    if (idParam != null && !idParam.isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);

            Database.connect();
            Artwork artwork = Database.jdbi.withExtension(ArtworkDao.class, dao -> dao.getArtwork(id));
            if (artwork != null) {
    %>
<div class="container">
    <div class="card">
        <div class="row no-gutters">
            <div class="col-md-4">
                <img src="../artmarket_pictures/artwork/<%= artwork.getPicture() %>" class="card-img" alt="Obra de Arte Detalle">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title"><%= artwork.getTitle() %>
                    </h5>
                    <p class="card-text"><%= artwork.getDescription() %>
                    </p>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><strong>Precio:</strong> <%= CurrencyUtils.format(artwork.getPrice()) %>
                        </li>
                    </ul>
                    <a href="index.jsp" class="btn btn-outline-light back-button">Volver</a>
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

<%@include file="includes/footer.jsp" %>