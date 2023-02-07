<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro Responsável</title>
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="../css/sideBar.css">
    <link rel="stylesheet" href="../css/cadastro_aluno.css">
    <link rel="icon" href="../css/Img/Logo.png">
</head>
<body>
    <div class="cad-container">
        <form action="../cadastrarResponsavel">
            <h1 class="titulo">
                CADASTRO<br>DO<br> RESPONSÁVEL
            </h1>
            <div class="cad-input-single">
                <input name="nome_resp" style="width: 200px;" type="text" id="cad-nome" class="cad-input" required>
                <label for="cad-nome">Nome completo</label>
            </div>
            <div class="cad-input-single">
                <input name="telefone" type="text" id="cad-telefone" class="cad-input" required style="width: 200px; left: 35px;">
                <label for="cad-telefone" >Telefone</label>
            </div>
            <div class="cad-input-single">
                <input name="endereco" type="text" id="endereco" class="cad-input" required style="width: 200px; left: 35px;">
                <label for="endereco" >Endereço</label>
            </div>
            <div class="cad-input-single">
                <input name="email" type="text" id="cad-email" class="cad-input" required style="width: 200px; left: 35px;">
                <label for="cad-email" >Email</label>
            </div>
            <button type="submit" style="margin: 40px 0px 20px 0px;">
                →
            </button>
        </form>
    </div>
</body>
<script src="../css/sideBar.js"></script>
</html>