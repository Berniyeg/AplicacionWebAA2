<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.svalero.artmarket.dao.Database" %>
<%@ page import="com.svalero.artmarket.domain.Sculpture" %>
<%@ page import="com.svalero.artmarket.dao.SculptureDao" %>

<%@include file="includes/header-style.jsp"%>
<%@include file="includes/edit-sculpture-ajax.jsp"%>

<%
    if (!role.equals("admin") && !role.equals("user")) {
        response.sendRedirect("/ArtMarket");
        return;
    }

    int id;
    Sculpture sculpture = null;
    if (request.getParameter("id") == null) {
        // Se accede al formulario para crear una nueva actividad
        id = 0;
    } else {
        // Se accede al formulario para editar una actividad existente
        id = Integer.parseInt(request.getParameter("id"));
        Database.connect();
        sculpture = Database.jdbi.withExtension(SculptureDao.class, dao -> dao.getSculpture(id));
    }
%>

<body>
<div class="container mt-5">
    <% if (id == 0) { %>
        <h2>Create New Sculpture</h2>
    <% } else { %>
        <h2>Modify Sculpture</h2>
    <% } %>
    <form id="sculpture-form" enctype="multipart/form-data">
        <!-- Title -->
        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="Sculpture name"
                <% if (id != 0) { %> value="<%= sculpture.getTitle() %>"<% } %> required maxlength="100">
        </div>

        <!-- Description -->
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" placeholder="A famous painting by Vincent van Gogh" rows="3"
                      maxlength="255"> <% if (id != 0) { %> <%= sculpture.getDescription() %><% } %>
            </textarea>
        </div>

        <!-- Price -->
        <div class="form-group">
            <label for="price">Price</label>
            <input type="number" step="0.01" class="form-control" id="price" name="price" placeholder="1000.00"
                <% if (id != 0) { %> value="<%= sculpture.getPrice() %>"<% } %> required>
        </div>

        <!-- Picture -->
        <div class="form-group">
            <label for="picture">Picture</label>
            <input type="file" class="form-control" id="picture"
                   name="picture" placeholder="starry_night.jpg" maxlength="50">
        </div>

        <!-- Material -->
        <div class="form-group">
            <label for="material">Material</label>
            <input type="text" class="form-control" id="material" name="material" placeholder="Sculpture material"
                <% if (id != 0) { %> value="<%= sculpture.getMaterial() %>"<% } %> required maxlength="100">
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-primary" id="edit-button">
            <% if (id == 0) { %>
                Submit
            <% } else { %>
                Modify
            <% } %>
        </button>
        <input type="hidden" name="id" value="<%= id %>"/>
    </form>

    <div id="result-sculpture"></div>

</div>
</body>

<%@include file="includes/footer.jsp"%>