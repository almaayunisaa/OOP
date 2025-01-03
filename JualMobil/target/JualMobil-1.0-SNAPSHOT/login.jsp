<%-- 
    Document   : login
    Created on : 5 Dec 2024, 10.35.56
    Author     : Aqila Hasya Nafisah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!DOCTYPE html>
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
                <h1>Login sebagai</h1>
            </div>
            <button onclick="window.location.href='loginSales.jsp'">Sales</button>
            <button onclick="window.location.href='loginPetugas.jsp'">Petugas</button>
        </div>
    </body>
</html>