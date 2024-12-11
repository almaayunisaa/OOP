<%-- 
    Document   : loginPetugas
    Created on : 5 Dec 2024, 13.25.33
    Author     : Aqila Hasya Nafisah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Sales</title>
        <style>
            body {
                margin: 0;
                font-family: inter;
                background-color: #1C1947;
            }
            
            .tabs button{
                padding: 20px 40px;
                font-size: 15px;
                cursor: pointer;
                border: none;
                background-color: #C1D6FA;
                color: black;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            
            .tabs button.active{
                background-color: #6687BF;
            }
            
            .container{
                display: flex;
                
            }
           
        </style>
    </head>
    <body>
    <div class="login-form">
        <div class="login-container">
            <div class="logo">
                <img src="src" width="width" height="height" alt="alt"/>
            </div>
            <div class="login-text">
                <span style="font-weight: bold; color: white"> 
                    <h2>Login Petugas</h2>
                <span/>
            </div>
            <form>
                <!-- Email input -->
               <div data-mdb-input-init class="form-outline mb-4">
                 <input type="username" id="form2Example1" class="form-control" />
                 <label class="form-label" for="form2Example1">Username</label>
               </div>

               <!-- Password input -->
               <div data-mdb-input-init class="form-outline mb-4">
                 <input type="password" id="form2Example2" class="form-control" />
                 <label class="form-label" for="form2Example2">Password</label>
               </div>   
                 <!-- Submit button -->
               <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-block mb-4">Log in</button>
            </form>
        </div>
    </div>
    </body>
</html>
