<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kidPlus.model.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Responsável</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/cadastro_aluno.css">
    <link rel="stylesheet" href="css/sideBar.css">
    <link rel="icon" href="css/Img/Logo.png">
</head>
<body>

	<%
	Responsavel resp = (Responsavel) request.getAttribute("responsavel");
	%>
    <div class="container hidden" style="max-width: none;">
        <div id="sidebar" class="hidden">
            <div id="sidebar-perfil">
                <p class="userName">Adminer</p>
                <img src="css/Img/btn-Social.png" alt="" class="" id="perfil">
            </div>
            <div class="btn-menu">
                <ol>
                    <li><a href="menu" class="home">Home</a></li>
                    <a href="menu"><img src="css/Img/btn-home.png" alt="" class="notTg btn-menu-img btn" id="home"></a>
                </ol>
                <ol>
                    <li><a href="cadastros/valid-Resp.jsp" class="cadastro-bar">Cadastros</a></li>
                    <a href="cadastros/valid-Resp.jsp"><img src="css/Img/btn-cadastro.png" alt="" class="notTg btn-menu-img btn" id="cadastro"></a>
                </ol>
                <ol>
                    <li><a href="ensino" class="ensino">Ensino</a></li>
                    <a href="ensino"><img src="css/Img/btn-ensino.png" alt="" class="notTg btn-menu-img btn" id="ensino"></a>
                </ol>
                <ol>
                    <li><a href="mudarDia" class="atv">Programa </a></li>
                    <a href="mudarDia"><img src="css/Img/btn-AtividadeEstudantil.png" alt="" class="notTg btn-menu-img btn" id="atv"></a>
                </ol>
                <ol>
                    <li><a href="sair" class="social">Sair</a></li><br>
                    <a href="sair"><img src="css/Img/btn-sair.png" alt="" class="notTg btn-menu-img btn" id="social"></a>
                </ol>
                <ol>
                    <li><a class="" style="padding: 0px;">&nbsp;</a></li>
                </ol>
                <ol>
                    <li><a href="" class="minimizar toggle-sidebar bt1">Minimizar</a></li><br>
                    <a href="" class="bt2"><p class="notTg btn-menu-img btn" id="minimizar">↠</p></a>
                </ol>
            </div>
        </div>
        <form action="editarResponsavel">
            <h1 class="titulo">
                EDITAR<br>RESPONSAVEL
            </h1>
            <div class="cad-input-single">
                <input name="nome" value="<%= resp.getNome()%>" type="text" id="nome" class="cad-input" style="width: 200px;" required>
                <label for="nome" >Nome</label>
            </div>
            <div class="cad-input-single">
                <input name="nome" value="<%= resp.getEndereco() %>" type="text" id="endereco" class="cad-input" style="width: 200px;" required>
                <label for="endereco" >Endereco</label>
            </div>
            <div class="cad-input-single">
                <input name="telefone" type="text" id="telefone" value="<%= resp.getTelefone() %>" class="cad-input" required style="width: 200px; left: 35px;">
                <label for="telefone" >Telefone</label>
            </div>
            <div class="cad-input-single">
                <input name="email" type="text" id="cad-telefone" value="<%= resp.getEmail() %>" class="cad-input" required style="width: 200px; left: 35px;">
                <label for="email" >E-mail</label>
            </div>
            <button type="submit" style="margin: 40px 0px 20px 0px;">
                →
            </button>
        </form>
        
    </div>
</body>
<script src="css/sideBar.js"></script>
</html>