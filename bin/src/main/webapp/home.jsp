<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kidPlus.model.*" %>
<%@ page import="java.util.ArrayList" %>

<%
    ArrayList<Aluno> alunos = (ArrayList<Aluno>) request.getAttribute("listaAlunos");
    ArrayList<Responsavel> responsaveis = (ArrayList<Responsavel>) request.getAttribute("listaResponsaveis");
%>

<!DOCTYPE html>
<html lang="pt-br">
<head id="body">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="widlu=device-widlu, initial-scale=1.0">
    <link rel="stylesheet" href="css/sideBar.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/tabelas.css">
    <title>Home</title>
</head>
<body style="max-width: 1500px;">
    <div class="container hidden" style="max-width: none;">
        <div id="sidebar" class="hidden">
            <div id="sidebar-perfil">
                <h1 class="userName">Adminer</h1>
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
                    <li><a href="" class="ensino">Ensino</a></li>
                    <a href=""><img src="css/Img/btn-ensino.png" alt="" class="notTg btn-menu-img btn" id="ensino"></a>
                </ol>
                <ol>
                    <li><a href="" class="atv">Estudantis</a></li>
                    <a href=""><img src="css/Img/btn-AtividadeEstudantil.png" alt="" class="notTg btn-menu-img btn" id="atv"></a>
                </ol>
                <ol>
                    <li><a href="" class="social">Social</a></li>
                    <a href=""><img src="css/Img/btn-Social.png" alt="" class="notTg btn-menu-img btn" id="social"></a>
                </ol>
                <ol>
                    <li><a href="sair" class="sair">Sair</a></li><br>
                    <a href="sair"><img src="css/Img/btn-sair.png" alt="" class="notTg btn-menu-img btn" id="sair"></a>
                </ol>
                <ol>
                    <li><a href="" class="minimizar toggle-sidebar bt1">Minimizar</a></li><br>
                    <a href="" class="bt2"><p class="notTg btn-menu-img btn" id="minimizar">↠</p></a>
                </ol>
            </div>
        </div>
        <div class="corpo" style="max-width: none;">
            <div id="cabecalho">
                <br><br>
                Lorem, ipsum dolor sit amet consectetur adipisicing elit.                Nemo facere, delectus voluptatum non, unde voluptates <br>
                modi ab tempora tempore reiciendis, porro facilis aut!
                Veritatis minima ea enim maxime soluta? Modi!<br>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. <br>
                Aliquam error vel quaerat nobis accusamus voluptatum, eos<br>
                quo blanditiis vitae consequatur earum nesciunt, iste odit <br>
                accusantium doloribus eum expedita est officia.<br>
            </div>
            <!-- <div style="float: le;"> -->
                <div id="tabelaAlunos" style="width: 685px;">
                    <table id="tabelaAluno">
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>CPF</th>
                            <th>Nascimento</th>
                            <th>Matricula</th>
                            <th>Faltas</th>
                            <th>Responsavel</th>
                        </tr>
                        <% for(int i = 0; i < alunos.size(); i++){ %>
                            <tr>
                                <td class="id"><%= alunos.get(i).getId() %></td>
                                <td><%= alunos.get(i).getNome() %></td>
                                <td><%= alunos.get(i).getCpf() %></td>
                                <td><%= alunos.get(i).getData_nascimento() %></td>
                                <td><%= alunos.get(i).getData_matricula() %></td>
                                <td><%= alunos.get(i).getFaltas() %></td>
                                <td><a href=""><%= alunos.get(i).getResponsavel().getNome() %></a></td>
                            </tr>
                            <%}%>
                    </table>
                    <br>
                    <table align="center" cellspacing="21" cellpadding="21" id="calendario">
                
                        <caption align="top" id="topoCalendario">
                            <h1>Calendario de Eventos</h1>
                            <h4 style="backdrop-filter: brightness(70%);">Fevereiro</h4>
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
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>13</td>
                                <td>14</td>
                                <td>15</td>
                                <td>16</td>
                                <td>17</td>
                                <td>18</td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td>22</td>
                                <td>23</td>
                                <td>24</td>
                                <td>25</td>
                            </tr>
                            <tr>
                                <td>26</td>
                                <td>27</td>
                                <td>28</td>
                                <td class="passado">1</td>
                                <td class="passado">2</td>
                                <td class="passado">3</td>
                                <td class="passado">4</td>
                            </tr>
                    </table>
                    <div id="eventos" style="width: 640px;">
                        <table align="center" cellspacing="21" cellpadding="21" id="calendario">
                            <tr>
                                <th><h1>Data</h1></th>
                            </tr>
                            <tr>
                                <td><h1>Acontecimento</h1></td>
                            </tr>
                        </table>

                        <table align="center" cellspacing="21" cellpadding="21" id="calendario">
                            <tr>
                                <th><h1>Data</h1></th>
                            </tr>
                            <tr>
                                <td><h1>Acontecimento</h1></td>
                            </tr>
                        </table>
                    </div> <!-- eventos -->
                </div> <!-- calendario -->
            <!-- </div>coluna2 -->
        </div><!-- corpo -->
    </div> <!-- container -->
    
    <script src="css/sideBar.js"></script>
</body>
</html>