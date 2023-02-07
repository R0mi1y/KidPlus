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
<title>Perfil Aluno</title>
</head>
<body>
	<%
	Aluno aluno = (Aluno) request.getAttribute("aluno");
	%>
	<div class="container hidden" style="max-width: none;">
	<a href="editarAluno?id=<%=aluno.getId()%>" class="btEditar">Editar perfil</a>
		<div id="topoPg">
			<div id="divPefilPessoa">
				<a href="editarAluno?id=<%=aluno.getId()%>" class="delBtn"><img
					src="css/Img/btn-Social.png" alt="" class="" id="perfilPessoa"></a>
			</div>
			<%
			if (aluno != null) {
			%>
			<div>
				<h1 class="infos">
					NOME:
					<%=aluno.getNome()%>
				</h1>
				<h1 class="infos">
					CPF:
					<%=aluno.getCpf()%>
				</h1>
				<h1 class="infos">
					IDADE:
					<%=aluno.getIdade()%>
				</h1>
				<h1 class="infos" style="">
					ID:
					<%=aluno.getId()%></h1>
			</div>
		</div>
		<div
			style="position: top;margin-left: 80px;margin-right: 45px; margin-top: 20px; font-size: 10px; background: white; border-radius: 5px; box-shadow:  20px 20px 40px #0d0d0d;">
			<h1 style="margin-left: 15px;padding-top: 15px;padding-bottom: 4px;">
				Data de Nascimento: &nbsp;
				<%=aluno.getData_nascimento().toString()%>
			</h1>
			<h1 style="margin-left: 15px;padding-bottom: 15px; ">
				Data de Matricula: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%=aluno.getData_matricula().toString()%>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp; Faltas:
				<%=aluno.getFaltas()%></h1>
		</div>
		<div id="topoPgp">
			<div id="divPefilPessoap">
				<a href="perfilResponsavel?id=<%=aluno.getResponsavel().getId()%>"><img src="css/Img/btn-Social.png" alt="" class=""
					id="perfilPessoap"></a>
		</div>
			<div>
				<h1 class="infosp">
					Responsavel:
					<%=aluno.getResponsavel().getNome()%>
				</h1>
				<h1 class="infosp">
					CPF:
					<%=aluno.getResponsavel().getCpf()%>
				</h1>
				<h1 class="infosp">
					ID:
					<%=aluno.getResponsavel().getId()%>
				</h1>
			</div>
		</div>
		<div id="topoPgp" style="margin-left: 10px;">
			<div id="divPefilPessoap">
				<a href="perfilProfessor?id=<%=aluno.getProfessor().getId()%>"><img src="css/Img/btn-Social.png" alt="" class=""
					id="perfilPessoap"></a>
			</div>
			<h1 class="infosp">
				Professor:
				<%=aluno.getProfessor().getNome()%>
			</h1>
			<h1 class="infosp">
				CPF:
				<%=aluno.getProfessor().getCpf()%>
			</h1>
			<h1 class="infosp">
				ID:
				<%=aluno.getProfessor().getId()%>
			</h1>
		</div>
		<div id="divtabelaObs">

			<p align="center" id="topoTabelaObs">
				<a href="addObs?id=<%=aluno.getId()%>" class="adicionar">Adicionar</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Observações&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="deletar">Deletar</a>
			</p>
			<%
			if (aluno.getObservacoes() != null && aluno.getObservacoes().size() > 0) {
				for (int i = 0; i < aluno.getObservacoes().size(); i++) {
			%>
			<table align="center" cellspacing="5" id="tabelaObs">
				<tr>
					<td><a><%=aluno.getObservacoes().get(i).getObservacao()%></a></td>
					<td
						style="width: 100px; background: rgb(228, 18, 18); border-radius: 200px; text-align: center;"
						class="delBtn"><a class="delBtn"
						href="deletarObs?id=<%=aluno.getObservacoes().get(i).getId()%>">Deletar</a></td>
				</tr>
			</table>
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