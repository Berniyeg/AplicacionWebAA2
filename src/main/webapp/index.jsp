<%@ page import="com.svalero.artmarket.dao.Database" %>
<%@ page import="com.svalero.artmarket.domain.Artwork" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.artmarket.dao.ArtworkDao" %>
<%@ page import="com.svalero.artmarket.util.CurrencyUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@include file="includes/header-style.jsp"%>

<!-- Cabecera -->
<header class="header">
    <div class="container">
        <h1 class="display-4">Bienvenido al Mercado de Arte</h1>
        <p class="lead">Descubre y compra obras de arte únicas de artistas talentosos.</p>
    </div>
    <div class="nav-item">
        <%
            if (role.equals("admin")) {
        %>
        <a class="nav-link highlight" href="edit-artwork.jsp">Subir Obra</a>
        <%
            }
        %>
    </div>
</header>

<main role="main" class="container">
    <div class="artwork py-5">
        <div class="container">
            <div class="row">
                <%
                    Database.connect();
                    List<Artwork> artworks = Database.jdbi.withExtension(ArtworkDao.class, dao -> dao.getAllArtworks());
                    for (Artwork artwork : artworks) {
                %>
                <!-- Ejemplo de una obra de arte -->
                <div class="col-md-4" id="artwork-<%= artwork.getId()%>">
                    <div class="card">
                        <img src="../artmarket_pictures/<%= artwork.getPicture() %>" class="card-img-top" alt="Obra de Arte 1">
                        <div class="card-body">
                            <h5 class="card-title"><%= artwork.getTitle() %></h5>
                            <p class="card-text"><%= artwork.getDescription() %></p>
                            <p class="card-artist">Artista: Juan Pérez.</p>
                            <p class="card-price">Price: <%= CurrencyUtils.format(artwork.getPrice()) %></p>
                            <a href="view-artwork.jsp?id=<%= artwork.getId() %>" class="btn btn-view">Ver</a>
                            <%
                                if (role.equals("admin")) {
                            %>
                            <a href="edit-artwork.jsp?id=<%= artwork.getId() %>" class="btn btn-edit">Modificar</a>
                            <a href="javascript:void(0);" class="btn btn-delete"
                               onclick="eliminarArtwork(<%= artwork.getId()%>)">Eliminar</a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <div>
    </div>
</main>

<%@include file="includes/remove-ajax.jsp"%>

 <%@include file="includes/footer.jsp"%>
