<%-- 
    Document   : login
    Created on : 5 Dec 2024, 10.35.56
    Author     : Aqila Hasya Nafisah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <style>
        body {
            margin: 0;
            font-family: inter;
            background-color: #1C1947;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            text-align: center;
            background-color: #1C1947;
            padding: 40px;
            border-radius: 20px;
        }

        .login-text {
            font-family: inter;
            color: white;
            margin-top: 20px;
        }

        .login-container input {
            display: block;
            width: 100%;
            max-width: 300px;
            margin: 10px auto;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 20px;
        }

        .login-container button {
            display: block;
            width: 100%;
            max-width: 300px;
            margin: 20px auto;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #C1D6FA;
            color: black;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .login-container button:hover {
            background-color: #6687BF;
        }
    </style>
</head>
<body>
    <div class="login-container">
        
        <div class="login-text">
            <h2>Login Sales</h2>
        </div>
        <!-- Form login dengan method POST -->
         <form action="salesController" method="get">
            <input type="hidden" name="action" value="verifikasi">
            <input type="text" name="username" id="username" placeholder="Username" required />
            <input type="password" name="password" id="password" placeholder="Password" required />
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>