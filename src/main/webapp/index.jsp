<%@ page import="com.svalero.artmarket.dao.Database" %>
<%@ page import="com.svalero.artmarket.domain.Artwork" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.artmarket.dao.ArtworkDao" %>
<%@ page import="com.svalero.artmarket.util.CurrencyUtils" %>
<%@ page import="com.svalero.artmarket.domain.Sculpture" %>
<%@ page import="com.svalero.artmarket.dao.SculptureDao" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@include file="includes/header-style.jsp"%>

<header class="header">
    <div class="container">
        <h1 class="display-4">Bienvenido al Mercado de Arte</h1>
        <p class="lead">Descubre y compra obras de arte únicas de artistas talentosos.</p>
    </div>
    <div class="d-flex justify-content-center">
        <div class="nav-item d-flex">
            <% if (role.equals("admin")) { %>
            <a class="nav-link highlight" href="edit-artwork.jsp">Subir Obra</a>
            <a class="nav-link highlight ml-3" href="edit-sculpture.jsp">Subir Sculpture</a>
            <% } %>
        </div>
    </div>
    <br>
    <div class="d-flex justify-content-center">
        <form class="form-inline my-2 my-lg-0" action="search.jsp" method="get">
            <input class="form-control mr-sm-2" type="search" name="query" placeholder="Buscar" aria-label="Buscar">
            <button class="btn btn-light my-2 my-sm-0" type="submit">Buscar</button>
        </form>
    </div>
</header>

<main role="main" class="container">
    <!-- Contenedor de pestañas -->
    <div class="tab">
        <button class="tablinks" onclick="openTab(event, 'artworks')">Artworks</button>
        <button class="tablinks" onclick="openTab(event, 'sculptures')">Sculptures</button>
    </div>

    <!-- Contenido de la pestaña Artworks -->
    <div id="artworks" class="tabcontent">
        <div class="artwork py-5">
            <div class="container">
                <div class="row">
                    <%
                        Database.connect();
                        List<Artwork> artworks = Database.jdbi.withExtension(ArtworkDao.class, dao -> dao.getAllArtworks());
                        for (Artwork artwork : artworks) {
                    %>
                    <div class="col-md-4" id="artwork-<%= artwork.getId() %>">
                        <div class="card">
                            <img src="../artmarket_pictures/artwork/<%= artwork.getPicture() %>" class="card-img-top" alt="Obra de Arte">
                            <div class="card-body">
                                <h3 class="card-title"><strong><%= artwork.getTitle() %></strong></h3>
                                <p class="card-text"><%= artwork.getDescription() %></p>
                                <p class="card-price">Price: <%= CurrencyUtils.format(artwork.getPrice()) %></p>
                                <a href="view-artwork.jsp?id=<%= artwork.getId() %>" class="btn btn-view">Ver</a>
                                <% if (role.equals("admin")) { %>
                                <a href="edit-artwork.jsp?id=<%= artwork.getId() %>" class="btn btn-edit">Modificar</a>
                                <a href="javascript:void(0);" class="btn btn-delete" onclick="eliminarArtwork(<%= artwork.getId() %>)">Eliminar</a>
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <!-- Contenido de la pestaña Sculptures -->
    <div id="sculptures" class="tabcontent">
        <div class="sculpture py-5">
            <div class="container">
                <div class="row">
                    <%
                        List<Sculpture> sculptures = Database.jdbi.withExtension(SculptureDao.class, dao -> dao.getAllSculptures());
                        for (Sculpture sculpture : sculptures) {
                    %>
                    <div class="col-md-4" id="sculpture-<%= sculpture.getId() %>">
                        <div class="card">
                            <img src="../artmarket_pictures/sculpture/<%= sculpture.getPicture() %>" class="card-img-top" alt="Escultura">
                            <div class="card-body">
                                <h3 class="card-title"><strong><%= sculpture.getTitle() %></strong></h3>
                                <p class="card-text"><%= sculpture.getDescription() %></p>
                                <p class="card-text"><%= sculpture.getMaterial() %></p>
                                <p class="card-price">Price: <%= CurrencyUtils.format(sculpture.getPrice()) %></p>
                                <a href="view-sculpture.jsp?id=<%= sculpture.getId() %>" class="btn btn-view">Ver</a>
                                <% if (role.equals("admin")) { %>
                                <a href="edit-sculpture.jsp?id=<%= sculpture.getId() %>" class="btn btn-edit">Modificar</a>
                                <a href="javascript:void(0);" class="btn btn-delete" onclick="eliminarSculpture(<%= sculpture.getId() %>)">Eliminar</a>
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</main>

<%@include file="includes/script-tab.jsp"%>
<%@include file="includes/remove-sculpture-ajax.jsp"%>
<%@include file="includes/remove-artwork-ajax.jsp"%>

 <%@include file="includes/footer.jsp"%>
