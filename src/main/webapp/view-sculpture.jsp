<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.svalero.artmarket.dao.Database" %>
<%@ page import="com.svalero.artmarket.util.CurrencyUtils" %>
<%@ page import="com.svalero.artmarket.domain.Sculpture" %>
<%@ page import="com.svalero.artmarket.dao.SculptureDao" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail of the Sculpture</title>
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
    <h1 class="page-title">Detail of the Sculpture</h1>
</div>

<%
    // Validar el parámetro "id"
    String idViewSculpture = request.getParameter("id");
    if (idViewSculpture != null && !idViewSculpture.isEmpty()) {
        try {
            int id = Integer.parseInt(idViewSculpture);

            Database.connect();
            Sculpture sculpture = Database.jdbi.withExtension(SculptureDao.class, dao -> dao.getSculpture(id));
            if (sculpture != null) {
%>
<div class="container">
    <div class="card">
        <div class="row no-gutters">
            <div class="col-md-4">
                <img src="../artmarket_pictures/sculpture/<%= sculpture.getPicture() %>" class="card-img" alt="Sculpture Detail">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h3 class="card-title"><strong><%= sculpture.getTitle() %></strong></h3>
                    <p class="card-text"><%= sculpture.getDescription() %></p>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Price: <%= CurrencyUtils.format(sculpture.getPrice()) %></li>
                    </ul>
                    <p class="card-text"><%= sculpture.getMaterial() %></p>
                    <a href="javascript:history.back()" class="btn btn-secondary ">Back</a>
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
        The sculpture with ID <%= id %> was not found.
    </div>
    <a href="javascript:history.back()" class="btn btn-outline-light back-button">Back</a>
</div>
<%
    }
} catch (NumberFormatException e) {
%>
<div class="container">
    <div class="alert alert-danger" role="alert">
        The provided ID is invalid. Please try again.
    </div>
    <a href="javascript:history.back()" class="btn btn-outline-light back-button">Back</a>
</div>
<%
    }
} else {
%>
<div class="container">
    <div class="alert alert-danger" role="alert">
        No valid ID was provided. Please try again.
    </div>
    <a href="javascript:history.back()" class="btn btn-outline-light back-button">Back</a>
</div>
<%
    }
%>

<%@include file="includes/footer.jsp" %>

</body>
