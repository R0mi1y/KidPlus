<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="kidPlus.model.Professor"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Validar Professor</title>
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/tabelaProfessor.css">
<link rel="icon" href="css/Img/Logo.png">
</head>
<body>
	<div class="pro-container">
		<br>
		<%
		if (request.getAttribute("professores") != null) {
			ArrayList<Professor> pro = (ArrayList<Professor>) request.getAttribute("professores");
		%>
			<div id="tabelaAlunos" style="padding-top: 15px;">
				<table align="center" cellspacing="10" cellpadding="10"
					id="calendario">
					<caption align="top" id="topoCalendario"
						style="margin-top: 0px; border-radius: 10px;">
						<p style="font-size: 20px; letter-spacing: 3px;">VALIDAÇÃO DO
							PROFESSOR</p>
					</caption>
					<tr>
						<th>ID</th>
						<th>Professor</th>
						<th>Escolha</th>
					</tr>
					<%
					for (int i = 0; i < pro.size(); i++) {
					%>
						<tr style="text-align: center;">
							<td><p style="color: black;"><%=pro.get(i).getId()%></p></td>
							<td><p style="color: black;"><%=pro.get(i).getNome()%></p></td>
							<td><a style="padding: 3px;"
								href="<%if(request.getAttribute("mudar") != null){ %>mudarProfessor<%} else {%>cadastrarAluno<%}%>?id_professor=<%=pro.get(i).getId()%>">&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
						</tr>
					<%
					}
					%>
				</table>
			</div>
		<%
		}
		%>
	</div>
</body>
</html>