<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kidPlus.model.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/perfil-aluno.css">
<link rel="stylesheet" href="css/sideBar.css">
<link rel="stylesheet" href="css/perfil.css">
<link rel="icon" href="css/Img/Logo.png">
<title>Perfil Professor</title>
</head>
<body>
	<%
	Professor pro = (Professor) request.getAttribute("professor");
	%>
	<div class="container hidden" style="max-width: none;">
	<a href="editarProfessor?id=<%=pro.getId()%>" class="btEditar">Editar perfil</a>
		<div id="topoPg">
			<div id="divPefilPessoa">
				<a href="editarProfessor?id=<%=pro.getId()%>"><img src="css/Img/btn-Social.png" alt="" class="" id="perfilPessoa"></a>
			</div>
			<%
			if (pro != null) {
			%>
			<div>
				<h1 class="infos">
					NOME:
					<%=pro.getNome()%>
				</h1>
				<h1 class="infos">
					CPF:
					<%=pro.getCpf()%>
				</h1>
				<h1 class="infos">
					Telefone:	<%= pro.getTelefone() %>
				</h1>
				<h1 class="infos">
					ID: <%=pro.getId()%>
				</h1>
				<h1 class="infos">
					E-mail:	<%= pro.getEmail() %>
				</h1>
			</div>
		</div>
			<p align="center" id="topoTabelaObs">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alunos&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</p>
			<%
			if (pro.getAlunos() != null && pro.getAlunos().size() > 0) {
			for (int i = 0; i < pro.getAlunos().size(); i++) {
			%>
			<div id="topoPgp">
			<div id="divPefilPessoap">
				<a href="perfilAluno?id=<%=pro.getAlunos().get(i).getId()%>"><img src="css/Img/btn-Social.png" alt="" class=""
					id="perfilPessoap"></a>
		</div>
			<div>
				<h1 class="infosp">
					<a style="text-decoration: none;" href="perfilAluno?id=<%= pro.getAlunos().get(i).getId() %>">Aluno: <%=pro.getAlunos().get(i).getNome()%></a>
				</h1>
				<h1 class="infosp">
					ID:
					<%=pro.getAlunos().get(i).getId()%>
				</h1>
				<h1 class="infosp">
					<a style="color: red;" class="delBtn" href="deletarAluno?id=<%= pro.getAlunos().get(i).getId() %>">Deletar</a></td>
				</h1>
			</div>
		</div>
			<%
			}
			}
			}
			%>
		</div>
		<div id="sidebar" class="hidden">
			<div id="sidebar-perfil">
				<p class="userName">Adminer</p>
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
					<li><a href="ensino" class="ensino">Ensino</a></li>
					<a href="ensino"><img src="css/Img/btn-ensino.png" alt=""
						class="notTg btn-menu-img btn" id="ensino"></a>
				</ol>
				<ol>
					<li><a href="mudarDia" class="atv">Programa </a></li>
					<a href="mudarDia"><img
						src="css/Img/btn-AtividadeEstudantil.png" alt=""
						class="notTg btn-menu-img btn" id="atv"></a>
				</ol>
				<ol>
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
		<script src="css/sideBar.js"></script>
	</div>
</body>
</html>