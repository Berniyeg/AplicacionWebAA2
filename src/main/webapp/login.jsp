<%@ page contentType="text/html;charset=UTF-8" %>

<head>
    <title>Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #343a40; /* Dark background */
            color: #f8f9fa; /* Text color */
        }
        .login-container {
            margin-top: 50px;
        }
        .login-card {
            background-color: #495057; /* Dark background for the card */
            border: 1px solid #6c757d; /* Light gray border */
            padding: 20px;
            border-radius: 8px;
        }
        .form-control {
            background-color: #6c757d; /* Gray background for form fields */
            color: #f8f9fa; /* Text color in form fields */
        }
        .btn-primary {
            background-color: #007bff; /* Color for the login button */
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3; /* Darker color for the button on hover */
        }
        .card-title {
            color: #f8f9fa; /* Text color in the card title */
        }
    </style>
</head>
<body>

<div class="container login-container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card login-card">
                <div class="card-body">
                    <h5 class="card-title text-center">Login</h5>
                    <form id="login-form">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" name="username" class="form-control" id="username" placeholder="Enter your username">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" name="password" class="form-control" id="password" placeholder="Enter your password">
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                        <br/>
                        <a href="javascript:history.back()" class="btn btn-secondary ">Back</a>
                    </form>
                    <br/>
                    <div id="result"></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<%@include file="includes/login-ajax.jsp"%>
