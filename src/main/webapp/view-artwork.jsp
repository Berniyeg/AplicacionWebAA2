<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.svalero.artmarket.dao.Database" %>
<%@ page import="com.svalero.artmarket.domain.Artwork" %>
<%@ page import="com.svalero.artmarket.dao.ArtworkDao" %>
<%@ page import="com.svalero.artmarket.util.CurrencyUtils" %>

<head>
    <title>Detail of artwork</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <%@include file="includes/view-style.jsp"%>
</head>

<body>
<div class="container">
    <h1 class="page-title">Detail of artwork</h1>
</div>
<%
    // Validar el parámetro "id"
    String idViewArtwork = request.getParameter("id");
    if (idViewArtwork != null && !idViewArtwork.isEmpty()) {
        try {
            int id = Integer.parseInt(idViewArtwork);

            Database.connect();
            Artwork artwork = Database.jdbi.withExtension(ArtworkDao.class, dao -> dao.getArtwork(id));
            if (artwork != null) {
%>
<div class="container">
    <div class="card">
        <div class="row no-gutters">
            <div class="col-md-4">
                <img src="../artmarket_pictures/artwork/<%= artwork.getPicture() %>" class="card-img" alt="Detail of artwork">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h2 class="card-title"><strong><%= artwork.getTitle() %></strong></h2>
                    <br>
                    <p class="card-text"><strong>Description:  </strong><%= artwork.getDescription() %></p>
                    <p class="card-text"><strong>Price:  </strong><%= CurrencyUtils.format(artwork.getPrice()) %></p>
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
        La obra de arte con ID <%= id %> no se encontró.
    </div>
</div>
<%
    }
} catch (NumberFormatException e) {
%>
<div class="container">
    <div class="alert alert-danger" role="alert">
        El ID proporcionado no es válido. Por favor, intenta de nuevo.
    </div>
</div>
<%
    }
} else {
%>
<div class="container">
    <div class="alert alert-danger" role="alert">
        No se proporcionó un ID válido. Por favor, intenta de nuevo.
    </div>
</div>
<%
    }
%>

<%@include file="includes/footer.jsp" %>
</body>
