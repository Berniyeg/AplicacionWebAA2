<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.svalero.artmarket.domain.Artwork" %>
<%@ page import="com.svalero.artmarket.dao.Database" %>
<%@ page import="com.svalero.artmarket.dao.ArtworkDao" %>

<%@include file="includes/header-style.jsp"%>
<%@include file="includes/edit-artwork-ajax.jsp"%>

<%
    if (!role.equals("admin") && !role.equals("user")) {
        response.sendRedirect("/ArtMarket");
        return;
    }

    int id;
    Artwork artwork = null;
    if (request.getParameter("id") == null) {
        // Se accede al formulario para crear una nueva actividad
        id = 0;
    } else {
        // Se accede al formulario para editar una actividad existente
        id = Integer.parseInt(request.getParameter("id"));
        Database.connect();
        artwork = Database.jdbi.withExtension(ArtworkDao.class, dao -> dao.getArtwork(id));
    }
%>

<body>
<div class="container mt-5">
    <% if (id == 0) { %>
    <h2>Create New Artwork</h2>
    <% } else { %>
    <h2>Modify Artwork</h2>
    <% } %>
    <form id="artwork-form" enctype="multipart/form-data">
        <!-- Title -->
        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="Starry Night"
                <% if (id != 0) { %> value="<%= artwork.getTitle() %>"<% } %> required maxlength="100">
        </div>

        <!-- Description -->
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" placeholder="A famous painting by Vincent van Gogh" rows="3"
                      maxlength="255"> <% if (id != 0) { %> <%= artwork.getDescription() %><% } %>
            </textarea>
        </div>

        <!-- Price -->
        <div class="form-group">
            <label for="price">Price</label>
            <input type="number" step="0.01" class="form-control" id="price" name="price" placeholder="1500.00"
                <% if (id != 0) { %> value="<%= artwork.getPrice() %>"<% } %> required>
        </div>

        <!-- Picture -->
        <div class="form-group">
            <label for="picture">Picture</label>
            <input type="file" class="form-control" id="picture"
                   name="picture" placeholder="starry_night.jpg" maxlength="50">
        </div>

        <!-- Submit and Back Buttons -->
        <div class="form-group mt-4">
            <button type="submit" class="btn btn-primary" id="edit-button">
                <% if (id == 0) { %>
                Submit
                <% } else { %>
                Modify
                <% } %>
            </button>
            <a href="javascript:history.back()" class="btn btn-secondary ml-2">Back</a>
        </div>

        <input type="hidden" name="id" value="<%= id %>"/>
    </form>

    <div id="result"></div>
</div>
</body>


<%@include file="includes/footer.jsp"%>