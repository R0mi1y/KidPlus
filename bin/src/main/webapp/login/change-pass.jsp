<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Redefinir password</title>
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <form action="mudarPass">
        <h1 class="new-pass">
            Nova senha
        </h1>
        <div class="pinput-single">
            <input id="userName" class="input" type="password" required>
            <label for="userName">Nova Senha</label>
        </div>
        <div class="pinput-single">
            <input id="userPass" class="input" type="password" required>
            <label for="userPass">Nova Senha</label>
        </div>

        <div class="btn">
            <input type="submit" class="input-btn" value="→">
        </div>
    </form>
</body>
</html>