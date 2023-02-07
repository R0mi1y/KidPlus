<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="kidPlus.model.Evento" %>

<% System.out.println(request.getAttribute("selecao")); %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/tabelas.css">
    <link rel="stylesheet" href="css/sideBar.css">
    <link rel="icon" href="css/Img/Logo.png">
    <title>Programações</title>
</head>
<body style="">
    <div class="container hidden" style="max-width: none;">
        <div id="sidebar" class="hidden">
            <div id="sidebar-perfil">
                <h1 class="userName">Adminer</h1>
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
                    <li><a href="" class="atv">Programa</a></li>
                    <a href=""><img src="css/Img/btn-AtividadeEstudantil.png" alt="" class="notTg btn-menu-img btn" id="atv"></a>
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
                    <li><a href="" class="minimizar toggle-sidebar bt1">Minimizar</a></li><br>
                    <a href="" class="bt2"><p class="notTg btn-menu-img btn" id="minimizar">↠</p></a>
                </ol>
            </div>
        </div>
        <div id="corpoProgramacao">
            <table align="center" cellspacing="21" cellpadding="21" id="calendario">
                <caption align="top" id="topoCalendario" style="margin-top: 0px; border-radius: 20px;">
                    <p style="font-size: 20px; letter-spacing: 3px; ">CALENDÁRIO</p>
                    <p style="backdrop-filter: brightness(70%);	border-radius: 10px;font-size: 15px; letter-spacing: 3px;">Fevereiro</p>
                </caption>
                <tr id="dias">
                    <th>Dom</th>
                    <th>Seg</th>
                    <th>Ter</th>
                    <th>Qua</th>
                    <th>Qui</th>
                    <th>Sex</th>
                    <th>Sab</th>
                </tr>
                <tr>
                    <td class="passado">29</td>
                    <td class="passado">30</td>
                    <td class="passado">31</td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=1">&nbsp;1&nbsp;</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=2">&nbsp;2&nbsp;</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=3">&nbsp;3&nbsp;</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=4">&nbsp;4&nbsp;</a></td>
                </tr>
                <tr>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=5">&nbsp;5&nbsp;</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=6">&nbsp;6&nbsp;</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=7">&nbsp;7&nbsp;</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=8">&nbsp;8&nbsp;</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=9">&nbsp;9&nbsp;</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=10">10</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=11">11</a></td>
                </tr>
                <tr>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=12">12</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=13">13</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=14">14</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=15">15</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=16">16</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=17">17</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=18">18</a></td>
                </tr>
                <tr>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=19">19</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=20">20</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=21">21</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=22">22</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=23">23</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=24">24</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=25">25</a></td>
                </tr>
                <tr>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=26">26</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=27">27</a></td>
                    <td><a href="mudarDia?selecao=<%= request.getAttribute("selecao") %>&dia=28">28</a></td>
                    <td class="passado">1</td>
                    <td class="passado">2</td>
                    <td class="passado">3</td>
                    <td class="passado">4</td>
                </tr>
            </table>
        </div>
    </div>
    
    <% if(request.getAttribute("selecao").toString().equals("1")){ 
    			System.out.println("entrou");
    %>
    	<div class="center-fixed">
		<caption align="top" id="topoCalendario" style="text-align: center;"">
			<h3>O que deseja adicionar?</h3>
        </caption style="color: white;">
        <% out.println(request.getAttribute("selecao")); %>
        <table style="width: 100%; margin-top: 20px;">
        	<tr style="text-align: center;">
        		<td style="width: 50px;">
					<a href="addCardapio" style="width: 40px;">cardapio</a>
        		</td>
        		<td style="width: 50px;">
					<a href="addEvento" style="width: 40px;">evento</a>        			
        		</td>
        	</tr>
        </table>
	</div>	
    <%} %>
    
    <script src="css/sideBar.js"></script>
</body>
</html>