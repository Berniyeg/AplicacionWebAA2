<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.svalero.artmarket.domain.User" %>
<%@ page import="com.svalero.artmarket.dao.Database" %>
<%@ page import="com.svalero.artmarket.dao.UserDao" %>

<%@include file="includes/header-style.jsp"%>

<%
    int id;
    User user = null;
    if (request.getParameter("id") == null) {
        id = 0;
    } else {
        id = Integer.parseInt(request.getParameter("id"));
        Database.connect();
        user = Database.jdbi.withExtension(UserDao.class, dao -> dao.getUser(id));
    }
%>

<body>
<div class="container mt-5">

    <% if (id == 0) { %>
    <h2>Create New User</h2>
    <% } else { %>
    <h2>Modify User</h2>
    <% } %>

    <form id="register-user-form" enctype="multipart/form-data">

        <% if (id == 0) { %>
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required maxlength="100">
        </div>
        <% } %>

        <% if (id == 0) { %>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
        </div>
        <% } %>

        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name"
                <% if (id != 0) { %> value="<%= user.getName() %>"<% } %> maxlength="100">
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter Phone Number"
                <% if (id != 0) { %> value="<%= user.getPhone() %>"<% } %> >
        </div>

        <% if (id == 0) { %>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email Address" required maxlength="255">
        </div>
        <% } %>

        <% if (role.equals("admin")) { %>
        <% if (id == 0) { %>
        <div class="form-group">
            <label for="role">Role</label>
            <select class="form-control" id="role" name="role">
                <option value="" disabled selected>Select Role</option>
                <option value="user">User</option>
                <option value="admin">Admin</option>
            </select>
        </div>
        <% } %>
        <% } %>

        <!-- Submit and Back Buttons -->
        <div class="form-group">
            <button type="submit" class="btn btn-primary" id="submit-button">
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

<%@include file="includes/ajax/register-user-ajax.jsp"%>
<%@include file="includes/footer.jsp"%>

</body>
