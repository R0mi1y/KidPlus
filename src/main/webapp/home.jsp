<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kidPlus.model.Evento" %>
<%@ page import="java.util.ArrayList" %>

<%
	ArrayList<Evento> eventosList = (ArrayList<Evento>) request.getAttribute("eventosList");
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
    <title>Home</title>
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
                    <li><a href="#body" class="home">Home</a></li>
                    <a href="#body"><img src="css/Img/btn-home.png" alt="" class="notTg btn-menu-img btn" id="home"></a>
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
        <div class="corpo" style="max-width: none;">
            <div id="cabecalho">
                <table align="center" id="cardapio">
                	<caption align="top" id="topoCalendario" style="margin-top: 0px;	border-radius: 10px;">
                           <p style="font-size: 20px; letter-spacing: 3px;">Cardapio </p>
                           <p style="backdrop-filter: brightness(70%);	border-radius: 10px;font-size: 15px; letter-spacing: 3px;">Fevereiro</p>
                       </caption>
                     <tr>
                         <th><h2 style="color: black; font-size: 20px; padding: 10px; ">Dia <%= request.getAttribute("diaC").toString() %></h2></th>
                     </tr>
                     <tr>
                         <td><p style="color: black;"><%= request.getAttribute("cardapio").toString() %></p></td>
                     </tr>
				</table>
            </div>
            <!-- <div style="float: left;"> -->
                <div id="tabelaAlunos" style="width: 685px; padding-top: 0px;">
                    <br>
                    <!-- calendário -->
                    <table align="center" cellspacing="21" cellpadding="21" id="calendario">
                        
                        <caption align="top" id="topoCalendario" style="margin-top: 0px;	border-radius: 10px;">
                            <p style="font-size: 20px; letter-spacing: 3px;">Calendario de Eventos</p>
                            <p style="backdrop-filter: brightness(70%);	border-radius: 10px;font-size: 15px; letter-spacing: 3px;">Fevereiro</p>
                        </caption>
                            <tr >
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
                                <td><a href="dia?dia=1">&nbsp;1&nbsp;</a></td>
                                <td><a href="dia?dia=2">&nbsp;2&nbsp;</a></td>
                                <td><a href="dia?dia=3">&nbsp;3&nbsp;</a></td>
                                <td><a href="dia?dia=4">&nbsp;4&nbsp;</a></td>
                            </tr>
                            <tr>
                                <td><a href="dia?dia=5">&nbsp;5&nbsp;</a></td>
                                <td><a href="dia?dia=6">&nbsp;6&nbsp;</a></td>
                                <td><a href="dia?dia=7">&nbsp;7&nbsp;</a></td>
                                <td><a href="dia?dia=8">&nbsp;8&nbsp;</a></td>
                                <td><a href="dia?dia=9">&nbsp;9&nbsp;</a></td>
                                <td><a href="dia?dia=10">10</a></td>
                                <td><a href="dia?dia=11">11</a></td>
                            </tr>
                            <tr>
                                <td><a href="dia?dia=12">12</a></td>
                                <td><a href="dia?dia=13">13</a></td>
                                <td><a href="dia?dia=14">14</a></td>
                                <td><a href="dia?dia=15">15</a></td>
                                <td><a href="dia?dia=16">16</a></td>
                                <td><a href="dia?dia=17">17</a></td>
                                <td><a href="dia?dia=18">18</a></td>
                            </tr>
                            <tr>
                                <td><a href="dia?dia=19">19</a></td>
                                <td><a href="dia?dia=20">20</a></td>
                                <td><a href="dia?dia=21">21</a></td>
                                <td><a href="dia?dia=22">22</a></td>
                                <td><a href="dia?dia=23">23</a></td>
                                <td><a href="dia?dia=24">24</a></td>
                                <td><a href="dia?dia=25">25</a></td>
                            </tr>
                            <tr>
                                <td><a href="dia?dia=26">26</a></td>
                                <td><a href="dia?dia=27">27</a></td>
                                <td><a href="dia?dia=28">28</a></td>
                                <td class="passado">1</td>
                                <td class="passado">2</td>
                                <td class="passado">3</td>
                                <td class="passado">4</td>
                            </tr>
                    </table>
                    <!-- calendário -->
                    <div id="eventos" style="width: 640px;	border-radius: 10px;">
                    <%for (int i = 0; i < eventosList.size(); i++) { %>
	                        <table align="center" cellspacing="21" cellpadding="21" id="calendario" style="	border-radius: 10px;">
	                            <tr>
	                                <th style="display: flex; align-items: center;">
								        <p style="font-weight: normal; font-size: 20px; text-align: left; flex: 1;">
								            <%= eventosList.get(i).getNome() %>
								        </p>
								        <p style="font-weight: normal; font-size: 20px; text-align: right;">
								            <a href="deletarEvento?id=<%= eventosList.get(i).getId() %>">Deletar</a>
								        </p>
								    </th>
	                            </tr>
	                            <tr>
	                                <td><p style="font-size: 15px;"><%= eventosList.get(i).getEvento() %></p></td>
	                            </tr>
	                        </table>
	                    <%}%>
                        </table>
                    </div> <!-- eventos -->
                </div> <!-- calendario -->
            <!-- </div>coluna2 -->
        </div><!-- corpo -->
    </div> <!-- container -->
    
    <script src="css/sideBar.js"></script>
</body>
</html>