<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login.css">
    <link rel="icon" href="css/Img/Logo.png">
    <title>Login</title>
</head>
<body>
    <img src="css/Img/Logo.png" id="logo">
    
    <div class="container">
        <form action="login">
            <h1 class="login" style="margin-bottom: 50px; letter-spacing: 6px;">
                <a href="main" style="text-decoration: none;">LOGIN</a>
            </h1>
            <div class="input-single">
                <input name="userName" id="userName" class="input" type="text" required>
                <label for="userName">Nome de Usuário</label>
            </div>
            <div class="input-single">
                <input name="userPass" id="userPass" class="input" type="password" required>
                <label for="userPass">Senha</label>
            </div>
            
            <% if(request.getAttribute("msm") != null){ %>
            	<p style="color: red; font-size: 15px;"><%=  request.getAttribute("msm") %></p>
            <%} %>
            <br>
            <button type="submit" style="margin: 20px 0px 50px 0px; box-shadow: 6px 6px 12px #362318;">
                →
            </button>
            <div class="down-side">
                <a href="login/email-send.html">Esqueceu a senha</a>
            </div>
        </form>
    </div>
</body>
</html>