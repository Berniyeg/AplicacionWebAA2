<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.svalero.artmarket.dao.Database" %>
<%@ page import="com.svalero.artmarket.dao.UserDao" %>
<%@ page import="com.svalero.artmarket.domain.User" %>


<head>
    <title>User profile</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <%@include file="includes/profile-style.jsp"%>
    
</head>
<%
    HttpSession currentSession = request.getSession();
    String role = "";

    if (currentSession.getAttribute("role") != null) {
        role = currentSession.getAttribute("role").toString();
    }

    String idProfile = request.getParameter("id");
    if (idProfile != null && !idProfile.isEmpty()) {
        try {
            int id = Integer.parseInt(idProfile);

            Database.connect();
            User user = Database.jdbi.withExtension(UserDao.class, dao -> dao.getUser(id));
            if (user != null) {
%>
<body>

<div class="container profile-container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card profile-card">
                <div class="card-body">
                    <h4 class="card-title text-center">User profile</h4>
                    <p class="card-text"><strong>User: </strong> <%= user.getUsername() %></p>
                    <p class="card-text">
                        <strong>Name: </strong> <%= user.getName() %>
                    </p>
                    <p class="card-text">
                        <strong>Phone: </strong> <%= user.getPhone() %>
                    </p>
                    <p class="card-text">
                        <strong>Email: </strong> <%= user.getEmail() %>
                    </p>
                    <div class="btn-group-center">
                        <%
                            if (!role.equals("admin")) {
                        %>
                        <a href="register-user.jsp?id=<%= user.getId() %>" class="btn btn-edit">Modificar</a>
                        <%
                            }
                        %>
                        <a href="javascript:history.back()" class="btn btn-view">Volver</a>
                    </div>
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

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
