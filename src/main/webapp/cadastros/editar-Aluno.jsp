<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kidPlus.model.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Aluno</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/cadastro_aluno.css">
    <link rel="stylesheet" href="css/sideBar.css">
    <link rel="icon" href="css/Img/Logo.png">
</head>
<body>

	<%
	Aluno aluno = (Aluno) request.getAttribute("aluno");
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
        <form action="editarAluno">
            <h1 class="titulo">
                EDITAR<br>ALUNO
            </h1>
            <div class="cad-input-single">
                <input name="nome" value="<%= aluno.getNome()%>" type="text" id="cad-nome" class="cad-input" style="width: 200px;" required>
                <label for="cad-nome" >Nome</label>
            </div>
            <div class="cad-input-single">
                <input name="dataMatricula" type="date" id="cad-telefone" value="<%= aluno.getData_matricula().toString() %>" class="cad-input" required style="width: 200px; left: 35px;">
                <label for="cad-telefone" >Data de Matrícula</label>
            </div>
            <div class="cad-input-single">
                <input name="dataNascimento" type="date" id="cad-telefone" value="<%= aluno.getData_nascimento().toString() %>" class="cad-input" required style="width: 200px; left: 35px;">
                <label for="cad-telefone" >Data de Nascimento</label>
            </div>
            <div class="cad-input-single">
                <input name="faltas" type="number" id="faltas" value="<%= aluno.getFaltas() %>" class="cad-input" required style="width: 200px; left: 35px;">
                <label for="faltas" >Faltas</label>
            </div>
            <button type="submit" style="margin: 40px 0px 20px 0px;">
                →
            </button>
            <div class="down-side">
                <a href="mudarProfessor?idAluno=<%= aluno.getId()%>">Mudar Professor</a>
            </div>
        </form>
        
    </div>
</body>
<script src="css/sideBar.js"></script>
</html>