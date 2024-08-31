<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.svalero.artmarket.dao.Database" %>
<%@ page import="com.svalero.artmarket.util.CurrencyUtils" %>
<%@ page import="com.svalero.artmarket.domain.Sculpture" %>
<%@ page import="com.svalero.artmarket.dao.SculptureDao" %>

<head>
    <title>Detail of the Sculpture</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <%@include file="includes/view-style.jsp"%>
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
                    <h2 class="card-title"><strong><%= sculpture.getTitle() %></strong></h2>
                    <br>
                    <p class="card-text"><strong>Description:  </strong><%= sculpture.getDescription() %></p>
                    <p class="card-text"><strong>Price:  </strong><%= CurrencyUtils.format(sculpture.getPrice()) %></p>
                    <p class="card-text"><strong>Material:  </strong><%= sculpture.getMaterial() %></p>
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
</div>
<%
    }
} catch (NumberFormatException e) {
%>
<div class="container">
    <div class="alert alert-danger" role="alert">
        The provided ID is invalid. Please try again.
    </div>
</div>
<%
    }
} else {
%>
<div class="container">
    <div class="alert alert-danger" role="alert">
        No valid ID was provided. Please try again.
    </div>
</div>
<%
    }
%>

<%@include file="includes/footer.jsp" %>

</body>
