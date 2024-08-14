<%@ page import="com.svalero.artmarket.dao.Database" %>
<%@ page import="com.svalero.artmarket.domain.Artwork" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.artmarket.dao.ArtworkDao" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@include file="includes/header-style.jsp"%>

<!-- Cuerpo -->
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
                <div class="col-md-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/350x200" class="card-img-top" alt="Obra de Arte 1">
                        <div class="card-body">
                            <h5 class="card-title"><%= artwork.getTitle()%></h5>
                            <p class="card-text"><%= artwork.getDescription()%></p>
                            <p class="card-artist">Artista: Juan Pérez.</p>
                            <p class="card-price">Price: <%= artwork.getPrice()%></p>
                            <a href="view-artwork.jsp" class="btn btn-view">Ver</a>
                            <a href="#" class="btn btn-edit">Modificar</a>
                            <a href="#" class="btn btn-delete">Eliminar</a>
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


<%@include file="includes/footer.jsp"%>
