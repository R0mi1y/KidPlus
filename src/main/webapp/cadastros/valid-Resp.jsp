<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Validando Responsavel</title>
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="../css/sideBar.css">
    <link rel="stylesheet" href="../css/cadastro_aluno.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/sideBar.css">
    <link rel="stylesheet" href="css/cadastro_aluno.css">
    <link rel="icon" href="css/Img/Logo.png">
</head>
<body>
    <div class="cad-container">
        <form action="<% if(request.getAttribute("msm") != null){ %>validarResponsavel<%} else {%>../validarResponsavel<%} %>">
            <h1 class="titulo">
                VALIDAÇÃO<br> DO <br>RESPONSÁVEL
            </h1>
            <div class="cad-input-single">
                <input name="cpf_responsavel" type="text" id="cad-cpf-resp" class="cad-input" required>
                <label for="cad-cpf-resp">CPF do responsavel</label>
            </div>
            <% if(request.getAttribute("msm") != null){ %>
            	<p style="color: red; font-size: 15px;"><%=  request.getAttribute("msm") %></p>
            <%} %>
            <button type="submit" style="margin: 40px 0px 20px 0px;">
                →
            </button>
            <div class="down-side">
            	<% if(request.getAttribute("msm") != null){ %>
            	 <a href="cadastrarProfessor">Cadastrar Professor</a>
            	<%} else {%>
                <a href="../cadastrarProfessor">Cadastrar Professor</a>
                <%} %>
            </div>
        </form>
    </div>
</body>
</html>