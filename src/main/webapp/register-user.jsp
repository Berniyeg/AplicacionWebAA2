<%@ page contentType="text/html;charset=UTF-8" %>

<%@include file="includes/header-style.jsp"%>
<%@include file="includes/register-user-ajax.jsp"%>



<body>
<div class="container mt-5">

    <h2>Create New User</h2>

    <form id="register-user-form" enctype="multipart/form-data">

        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required maxlength="100">
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
        </div>

        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name"  maxlength="100">
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter Phone Number">
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email Address" required maxlength="255">
        </div>

        <div class="form-group">
            <label for="role">Role</label>
            <select class="form-control" id="role" name="role" required>
                <option value="" disabled selected>Select Role</option>
                <option value="user">User</option>
                <option value="admin">Admin</option>
            </select>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-primary" id="submit-button">
            Submit
        </button>
        <input type="hidden" name="id" />
    </form>

    <div id="result"></div>

</div>
</body>


<%@include file="includes/footer.jsp"%>