<%@ page contentType="text/html;charset=UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Art Market</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        body {
            background-color: #343a40;
            color: #f8f9fa;
            font-family: 'Arial', sans-serif;         }

        .header {
            background: #495057;
            color: #f8f9fa;
            padding: 40px 0;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }

        .header p {
            font-size: 1.1rem;
        }

        .footer {
            background: #495057;
            color: #f8f9fa;
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 -4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar-light .navbar-nav .nav-link,
        .navbar-light .navbar-brand {
            color: #f8f9fa;
        }

        .navbar-nav .nav-item {
            margin-left: 15px;
        }

        .navbar-nav .nav-item .nav-link {
            display: flex;
            align-items: center;
            transition: color 0.3s;
        }

        .navbar-nav .nav-item .nav-link:hover {
            color: #adb5bd;
        }

        .highlight {
            background-color: #435bf4;
            color: #ffffff;
            border-radius: 20px;
            padding: 8px 16px;
            text-decoration: none;
            font-weight: bold;
        }

        .tab {
            overflow: hidden;
            border-bottom: 1px solid #ccc;
            margin-bottom: 20px;
            text-align: center;
        }

        .tab button {
            background-color: inherit;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            transition: 0.3s;
            font-size: 17px;
            margin: 0 5px;
        }

        .tab button.active {
            background-color: #ccc;
        }

        .tabcontent {
            display: none;
        }

        .tabcontent.active {
            display: block;
        }


        .artwork, .sculpture {
            margin: 30px 0;
        }

        .card {
            margin-bottom: 20px;
            background: #495057;
            border: none;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: box-shadow 0.3s;
        }

        .card:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .card-img-top {
            border-bottom: 2px solid #6c757d;
        }

        .card-body {
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .card-title {
            font-size: 1.25rem;
            margin-bottom: 10px;
        }

        .card-text {
            font-size: 1rem;
            margin-bottom: 10px;
        }

        .card-price {
            margin-bottom: 15px;
        }

        .btn {
            margin: 5px 0;
            border-radius: 20px;
            padding: 10px 20px;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn:hover {
            transform: none;
        }

        .btn-delete {
            background-color: #dc3545;
            color: #ffffff;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }

        .btn-edit {
            background-color: #6c757d;
            color: #ffffff;
        }

        .btn-edit:hover {
            background-color: #5a6268;
        }

        .btn-view {
            background-color: #6d9a78;
            color: #ffffff;
        }

        .btn-view:hover {
            background-color: #218838;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            flex-wrap: wrap;
        }


    </style>
</head>

<%
    HttpSession currentSession = request.getSession();
    String role = "anonymous";
    String username = "";
    String idProfile = "";

    if (currentSession.getAttribute("role") != null) {
        role = currentSession.getAttribute("role").toString();
    }

    if (currentSession.getAttribute("username") != null) {
        username = currentSession.getAttribute("username").toString();
    }
    if (currentSession.getAttribute("id") != null) {
        idProfile = currentSession.getAttribute("id").toString();
    }
%>

<body>
<!-- Navegación -->
<nav class="navbar navbar-expand-lg navbar-light bg-dark">
    <a class="navbar-brand" href="/ArtMarket/">Art Market</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <%
                if (role.equals("anonymous")) {
            %>
            <li class="nav-item">
                <a class="nav-link" href="register-user.jsp" title="Register new user"><i class="fas fa-user-plus"></i>
                    Sign up</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp" title="Access profile"><i class="fas fa-user"></i> Login</a>
            </li>
            <%
            } else {
                boolean isAdmin = role.equals("admin");
            %>
            <li class="nav-item">
                <span class="nav-link nav-link-saludo">Welcome, <%= username %>!</span>
            </li>
            <%
                if (!isAdmin) {
            %>
            <li class="nav-item">
                <a class="nav-link" href="profile.jsp?id=<%= idProfile %>" title="Profile"><i class="fas fa-user"></i>
                    Profile</a>
            </li>
            <%
                }
            %>
            <li class="nav-item">
                <a class="nav-link" href="logout" title="Logout"><i class="fas fa-sign-out-alt"></i> Logout </a>
            </li>
            <%
                }
            %>
        </ul>
    </div>
</nav>
</body>
