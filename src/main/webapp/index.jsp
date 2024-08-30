<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.svalero.artmarket.domain.Artwork" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.artmarket.util.CurrencyUtils" %>
<%@ page import="com.svalero.artmarket.domain.Sculpture" %>
<%@ page import="com.svalero.artmarket.domain.User" %>
<%@ page import="com.svalero.artmarket.dao.*" %>

<%@include file="includes/header-style.jsp" %>

<script>
    $(document).ready(function () {
        $("#search-input").focus();
    });
</script>


<header class="header">
    <div class="container">
        <h1 class="display-4">Welcome to the Art Market</h1>
        <p class="lead">Discover and buy unique artworks by talented artists.</p>
    </div>
    <div class="d-flex justify-content-center">
        <div class="nav-item d-flex">
            <%
                if (role.equals("admin")) {
            %>
            <a class="nav-link highlight" href="edit-artwork.jsp">Upload Artwork</a>
            <a class="nav-link highlight ml-3" href="edit-sculpture.jsp">Upload Sculpture</a>
            <a class="nav-link highlight ml-3" href="register-user.jsp">Create User</a>
            <%
            } else if (role.equals("user")) {
            %>
            <a class="nav-link highlight" href="edit-artwork.jsp">Upload Artwork</a>
            <a class="nav-link highlight ml-3" href="edit-sculpture.jsp">Upload Sculpture</a>
            <%
            } else if (role.equals("anonymous")) {
            %>
            <a class="nav-link highlight" href="register-user.jsp">Upload Artwork</a>
            <a class="nav-link highlight ml-3" href="register-user.jsp">Upload Sculpture</a>
            <%
                }
            %>
        </div>


    </div>
    <br>
    <div class="d-flex justify-content-center">
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" name="search" id="search-input" placeholder="Search"
                   aria-label="Search">
            <button class="btn btn-light my-2 my-sm-0" type="submit" id="search-button">Search</button>
        </form>
    </div>
</header>

<main role="main" class="container">
    <!-- Contenedor de pestañas -->
    <div class="tab">
        <button class="tablinks" onclick="openTab(event, 'artworks')">Artworks</button>
        <button class="tablinks" onclick="openTab(event, 'sculptures')">Sculptures</button>
        <% if (role.equals("admin")) { %>
        <button class="tablinks" onclick="openTab(event, 'users')">Users</button>
        <% } %>
    </div>

    <!-- Contenido de la pestaña Artworks -->
    <div id="artworks" class="tabcontent">
        <div class="artwork py-5">
            <div class="container">
                <div class="row">
                    <%
                        String search = "";
                        if (request.getParameter("search") != null)
                            search = request.getParameter("search");

                        Database.connect();
                        List<Artwork> artworks = null;
                        if (search.isEmpty()) {
                            artworks = Database.jdbi.withExtension(ArtworkDao.class, dao -> dao.getAllArtworks());
                        } else {
                            final String searchTerm = search;
                            artworks = Database.jdbi.withExtension(ArtworkDao.class, dao -> dao.searchArtworks(searchTerm));
                        }

                        for (Artwork artwork : artworks) {
                    %>
                    <div class="col-md-4" id="artwork-<%= artwork.getId() %>">
                        <div class="card">
                            <img src="../artmarket_pictures/artwork/<%= artwork.getPicture() %>" class="card-img-top"
                                 alt="Obra de Arte">
                            <div class="card-body">
                                <h3 class="card-title"><strong><%= artwork.getTitle() %>
                                </strong></h3>
                                <p class="card-text"><%= artwork.getDescription() %>
                                </p>
                                <p class="card-price">Price: <%= CurrencyUtils.format(artwork.getPrice()) %>
                                </p>
                                <a href="view-artwork.jsp?id=<%= artwork.getId() %>" class="btn btn-view">View</a>
                                <% if (role.equals("admin")) { %>
                                <a href="edit-artwork.jsp?id=<%= artwork.getId() %>" class="btn btn-edit">Modify</a>
                                <a href="javascript:void(0);" class="btn btn-delete"
                                   onclick="eliminarArtwork(<%= artwork.getId() %>)">Delete</a>
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
                        String searchSculpture = "";
                        if (request.getParameter("search") != null)
                            searchSculpture = request.getParameter("search");

                        Database.connect();
                        List<Sculpture> sculptures = null;
                        if (searchSculpture.isEmpty()) {
                            sculptures = Database.jdbi.withExtension(SculptureDao.class, dao -> dao.getAllSculptures());
                        } else {
                            final String searchTermSculpture = search;
                            sculptures = Database.jdbi.withExtension(SculptureDao.class, dao -> dao.searchSculptures(searchTermSculpture));
                        }
                        for (Sculpture sculpture : sculptures) {
                    %>

                    <div class="col-md-4" id="sculpture-<%= sculpture.getId() %>">
                        <div class="card">
                            <img src="../artmarket_pictures/sculpture/<%= sculpture.getPicture() %>"
                                 class="card-img-top" alt="Escultura">
                            <div class="card-body">
                                <h3 class="card-title"><strong><%= sculpture.getTitle() %>
                                </strong></h3>
                                <p class="card-text"><%= sculpture.getDescription() %>
                                </p>
                                <p class="card-text"><%= sculpture.getMaterial() %>
                                </p>
                                <p class="card-price">Price: <%= CurrencyUtils.format(sculpture.getPrice()) %>
                                </p>
                                <a href="view-sculpture.jsp?id=<%= sculpture.getId() %>" class="btn btn-view">View</a>
                                <% if (role.equals("admin")) { %>
                                <a href="edit-sculpture.jsp?id=<%= sculpture.getId() %>"
                                   class="btn btn-edit">Modify</a>
                                <a href="javascript:void(0);" class="btn btn-delete"
                                   onclick="eliminarSculpture(<%= sculpture.getId() %>)">Delete</a>
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <!-- Contenido de la pestaña Users -->
    <div id="users" class="tabcontent">
        <div class="user py-5">
            <div class="container">
                <div class="row">
                    <%
                        String searchUser = "";
                        if (request.getParameter("search") != null)
                            search = request.getParameter("search");

                        Database.connect();
                        List<User> users = null;
                        if (search.isEmpty()) {
                            users = Database.jdbi.withExtension(UserDao.class, dao -> dao.getAllUsers());
                        } else {
                            final String searchTermUser = search;
                            users = Database.jdbi.withExtension(UserDao.class, dao -> dao.searchUsers(searchTermUser));
                        }

                        for (User user : users) {
                    %>
                    <div id="user-<%= user.getId() %>">
                        <ul class="list-styled">
                            <li class="card mb-3 p-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="me-3"><strong>User: </strong> <%= user.getUsername() %></span>
                                    <span class="me-3"><strong>Name: </strong> <%= user.getName() %></span>
                                    <span class="me-3"><strong>Phone: </strong> <%= user.getPhone() %></span>
                                    <span class="me-3"><strong>Email: </strong> <%= user.getEmail() %></span>
                                    <span class="me-3"><strong>Rol: </strong> <%= user.getRole() %></span>
                                    <div class="user-actions">
                                        <a href="profile.jsp?id=<%= user.getId() %>" class="btn btn-secondary btn-sm me-2">View</a>
                                        <a href="register-user.jsp?id=<%= user.getId() %>" class="btn btn-secondary btn-sm me-2">Modify</a>
                                        <a href="javascript:void(0);" class="btn btn-delete" onclick="eliminarUser(<%= user.getId() %>)">Delete</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>


<%@include file="includes/script-tab.jsp" %>
<%@include file="includes/remove-artwork-ajax.jsp" %>
<%@include file="includes/remove-sculpture-ajax.jsp" %>
<%@include file="includes/remove-user-ajax.jsp" %>

<%@include file="includes/footer.jsp" %>
