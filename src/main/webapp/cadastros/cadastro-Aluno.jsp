<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro Aluno</title>
    <link rel="stylesheet" href="css/tabelas.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/sideBar.css">
    <link rel="stylesheet" href="css/cadastro_aluno.css">
    <link rel="icon" href="css/Img/Logo.png">
</head>
<body>
<% request.setAttribute("id_professor", request.getAttribute("id_professor")); %>
    <div class="cad-container">
        <form action="cadastrarAluno">
            <h1 class="titulo">
                CADASTRO<br>DO<br>ALUNO
            </h1>
            <div class="cad-input-single">
                <input name="nome_aluno" type="text" id="cad-nome" class="cad-input" required>
                <label for="cad-nome">Nome completo</label>
            </div>
            <div class="cad-input-single">
                <input name="cpf_aluno" type="text" id="cad-cpf" class="cad-input" required>
                <label for="cad-cpf">CPF</label>
            </div>
            <% if(request.getAttribute("msm") != null){ %>
            	<p style="color: red; font-size: 15px;"><%=  request.getAttribute("msm") %></p>
            <%} %>
            <div class="cad-input-single">
                <label for="cad-data"  style="bottom: 34px; color: rgb(197, 197, 197); font-size: 13px;">Data de Nascimento</label>
                <input name="data_nascimento" style="width: 235px;" type="date" id="cad-data" class="cad-input" required style="width: 200px; left: 35px;">
            </div>
            <button type="submit" style="margin: 40px 0px 20px 0px;">
                →
            </button>
            <br>
            <input style="color: transparent; background: transparent; border: 0px;" name="id_professor" type="text" value="<%= request.getAttribute("id_professor") %>">
        </form>
    </div>
</body>
</html>