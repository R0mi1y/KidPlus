<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/login.css">
    <link rel="icon" href="../css/Img/Logo.png">
    <title>Adicionar Observação</title>
</head>
<body>
    <img src="../css/Img/Logo.png" id="logo">
    
    <div class="container">
        <form action="../addObs">
            <h1 class="login" style="margin-bottom: 50px; letter-spacing: 6px;">
                <a style="text-decoration: none;">Adicionar<br>Observação</a>
            </h1>
            <div class="input-single">
                <input name="obs" id="userName" class="input" type="text" required>
                <label for="userName">Observação</label>
            </div>            
            <br>
            <button type="submit" style="margin: 20px 0px 50px 0px; box-shadow: 6px 6px 12px #362318;">
                →
            </button>
        </form>
    </div>
</body>
</html>