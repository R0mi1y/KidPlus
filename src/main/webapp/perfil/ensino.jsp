<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kidPlus.model.*"%>
<%@ page import="java.util.ArrayList"%>

<%
ArrayList<Aluno> alunos = (ArrayList<Aluno>) request.getAttribute("alunos");
ArrayList<Professor> profs = (ArrayList<Professor>) request.getAttribute("profs");
ArrayList<Responsavel> resps = (ArrayList<Responsavel>) request.getAttribute("resps");
%>

<!DOCTYPE html>
<html lang="pt-br">
<head id="body">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="widlu=device-widlu, initial-scale=1.0">
<link rel="stylesheet" href="css/sideBar.css">
<link rel="stylesheet" href="css/tabelas.css">
<link rel="stylesheet" href="css/home.css">
<link rel="icon" href="css/Img/Logo.png">
<title>Ensino</title>
<style type="text/css">
a {
	font-size: 15px;
}
</style>
</head>
<body style="max-width: 1500px;">
	<div class="container hidden" style="max-width: none;">
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
					<a class="bt2"><p class="notTg btn-menu-img btn"
							id="minimizar">↠</p></a>
				</ol>
			</div>
		</div>
		<div class="corpo" style="max-width: none;">
			<div id="cabecalho">
				<%
				if (profs != null) {
				%>
				<table align="center" cellspacing="21" cellpadding="21"
					id="calendario" style="border-radius: 10px;">
					<caption align="top" id="topoCalendario"
						style="margin-top: 0px; border-radius: 10px;">
						<p style="font-size: 20px; letter-spacing: 3px;">Professores</p>
					</caption>
					<tr>
						<th><p style="color: black; font-weight: normal; font-size: 20px; letter-spacing: 1px;">Código</p></th>
						<th><p style="color: black; font-weight: normal; font-size: 20px; letter-spacing: 1px;">Nome</p></th>
						<th><p style="color: black; font-weight: normal; font-size: 20px; letter-spacing: 1px;">Deletar</p></th>
					</tr>
					<% if(request.getAttribute("msmP") != null){ %>
		            	<p style="color: red; font-size: 15px;"><br><%=  request.getAttribute("msmP") %></p>
		            <%} %>
					<%
					for (int i = 0; i < profs.size(); i++) {
					%>
					<tr>
						<td><p style="font-size: 15px; color: black; text-align: center;"><%=profs.get(i).getId()%></p></td>
						<td style="text-align: center;"><a
							href="perfilProfessor?id=<%=profs.get(i).getId()%>"><%=profs.get(i).getNome()%></a></td>
							<td style="text-align: center;"><a
								href="deletarProf?id=<%=profs.get(i).getId()%>"
								style="background-color: red;">Deletar</a></td>
					</tr>
				<%}}%>
				</table>
				<%
				if (resps != null) {
				%>
				<table align="center" cellspacing="21" cellpadding="21"
					id="calendario" style="border-radius: 10px;">
					<caption align="top" id="topoCalendario"
						style="margin-top: 0px; border-radius: 10px;">
						<p style="font-size: 20px; letter-spacing: 3px;">Responsaveis</p>
					</caption>
					<tr>
						<th><p style="color: black; font-weight: normal; font-size: 20px; letter-spacing: 1px;">Código</p></th>
						<th><p style="color: black; font-weight: normal; font-size: 20px; letter-spacing: 1px;">Nome</p></th>
						<th><p style="color: black; font-weight: normal; font-size: 20px; letter-spacing: 1px;">Deletar</p></th>
					</tr>
					<% if(request.getAttribute("msmR") != null){ %>
		            	<p style="color: red; font-size: 15px;"><br><%=  request.getAttribute("msmR") %></p>
		            <%} %>
					<%
					for (int i3 = 0; i3 < resps.size(); i3++) {
					%>
					<tr>
						<td><p style="font-size: 15px; color: black; text-align: center;"><%=resps.get(i3).getId()%></p></td>
						<td style="text-align: center;"><a
							href="perfilResponsavel?id=<%=resps.get(i3).getId()%>"><%=resps.get(i3).getNome()%></a></td>
						<td style="text-align: center;"><a
							href="deletarResp?id=<%=resps.get(i3).getId()%>"
							style="background-color: red;">Deletar</a></td>
					</tr>
				<%}}%>
				</table>
			</div>
			<!-- <div style="float: left;"> -->
			<div id="tabelaAlunos" style="width: 685px; padding-top: 0px;">
				<br>
				<div id="eventos" style="width: 640px; border-radius: 10px;">
					<table align="center" cellspacing="21" cellpadding="21"
						id="calendario" style="border-radius: 10px;">
						<caption align="top" id="topoCalendario"
							style="margin-top: 0px; border-radius: 10px;">
							<p style="font-size: 20px; letter-spacing: 3px;">Alunos e
								seus Responsaveis</p>
						</caption>
						<tr>
							<th><p
									style="font-weight: normal; font-size: 20px; letter-spacing: 1px;">ID</p></th>
							<th><p
									style="font-weight: normal; font-size: 20px; letter-spacing: 1px;">Nome</p></th>
							<th><p
									style="font-weight: normal; font-size: 20px; letter-spacing: 1px;">Responsavel</p></th>
							<th><p
									style="font-weight: normal; font-size: 20px; letter-spacing: 1px;">Professor</p></th>
							<th><p
									style="font-weight: normal; font-size: 20px; letter-spacing: 1px;">Deletar</p></th>
						</tr>
						<% if(request.getAttribute("msmA") != null){ %>
		            	<p style="color: red; font-size: 15px;"><br><%=  request.getAttribute("msmA") %></p>
		            <%} %>
					<%
					if (alunos != null) {
						for (int i2 = 0; i2 < alunos.size(); i2++) {
					%>
						<tr>
							<td style="text-align: center;"><p
									style="font-size: 15px; text-align: center;"><%=alunos.get(i2).getId()%></p></td>
							<td style="text-align: center;"><a
								href="perfilAluno?id=<%=alunos.get(i2).getId()%>"><%=alunos.get(i2).getNome()%></a></td>
							<td style="text-align: center;"><a
								href="perfilResponsavel?id=<%=alunos.get(i2).getResponsavel().getId()%>"><%=alunos.get(i2).getResponsavel().getNome()%></a></td>
							<td style="text-align: center;"><a
								href="perfilProfessor?id=<%=alunos.get(i2).getProfessor().getId()%>"><%=alunos.get(i2).getProfessor().getNome()%></a></td>
							<td style="text-align: center;"><a
								href="deletarAluno?id=<%=alunos.get(i2).getId()%>"
								style="background-color: red;">Deletar</a></td>
						</tr>
					<%}}%>
					</table>
					</table>
				</div>
				<!-- eventos -->
			</div>
			<!-- calendario -->
			<!-- </div>coluna2 -->
		</div>
		<!-- corpo -->
	</div>
	<!-- container -->

	<script src="css/sideBar.js"></script>
</body>
</html>