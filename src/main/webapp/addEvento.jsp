<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kidPlus.model.DAO"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/sideBar.css">
<link rel="icon" href="css/Img/Logo.png">
<title>Adicionar Evento</title>
</head>
<body>
	<div id="sidebar" class="hidden">
		<div id="sidebar-perfil">
			<h1 class="userName">Adminer</h1>
			<img src="css/Img/btn-Social.png" alt="" class="" id="perfil">
		</div>
		<div class="btn-menu">
			<ol>
				<li><a href="menu" class="home">Home</a></li>
				<a href="menu"><img src="css/Img/btn-home.png" alt=""
					class="notTg btn-menu-img btn" id="home"></a>
			</ol>
			<ol>
				<li><a href="cadastros/valid-Resp.jsp" class="cadastro-bar">Cadastros</a></li>
				<a href="cadastros/valid-Resp.jsp"><img
					src="css/Img/btn-cadastro.png" alt=""
					class="notTg btn-menu-img btn" id="cadastro"></a>
			</ol>
			<ol>
				<li><a href="" class="ensino">Ensino</a></li>
				<a href=""><img src="css/Img/btn-ensino.png" alt=""
					class="notTg btn-menu-img btn" id="ensino"></a>
			</ol>
			<ol>
				<li><a href="mudarDia" class="atv">Programa </a></li>
				<a href="mudarDia"><img
					src="css/Img/btn-AtividadeEstudantil.png" alt=""
					class="notTg btn-menu-img btn" id="atv"></a>
			</ol>
			<ol>
				<li><a href="sair" class="social">Sair</a></li>
				<br>
				<a href="sair"><img src="css/Img/btn-sair.png" alt=""
					class="notTg btn-menu-img btn" id="social"></a>
			</ol>
			<ol>
                    <li><a class="" style="padding: 0px;">&nbsp;</a></li>
                </ol>
			<ol>
				<li><a href="" class="minimizar toggle-sidebar bt1">Minimizar</a></li>
				<br>
				<a href="" class="bt2"><p class="notTg btn-menu-img btn"
						id="minimizar">↠</p></a>
			</ol>
		</div>
	</div>
	<div class="container">
		<form action="addEvento" style="max-width: 565px;">
			<h1 class="login" style="margin-bottom: 50px; letter-spacing: 6px;">
				ADICIONAR<br>EVENTO<br>NO DIA
				<%=request.getAttribute("dia")%>
			</h1>
			<div class="input-single">
				<input name="nomeEvento" id="nomeEvento" class="input" type="text"
					required> <label for="nomeEvento">Nome do Evento</label>
			</div>
			<div class="input-single">
				<textarea style=" max-width: 505px; min-width: 235px;" name="evento" id="evento" class="input" type="text" value="<%= new DAO().getCardapio(Integer.parseInt(request.getAttribute("dia").toString())) %>"
					required></textarea> <label for="evento">Evento</label>
			</div>
			<br>
			<button type="submit"
				style="margin: 20px 0px 50px 0px; box-shadow: 6px 6px 12px #362318;">
				→</button>
		</form>
		<script src="css/sideBar.js"></script>
	</div>
</body>
</html>