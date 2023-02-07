package kidPlus.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kidPlus.model.*;

@WebServlet(urlPatterns = { "/main", "/login", "/mudarPass", "/sair", "/dia", "/menu", "/mudarDia", "/addCardapio",
		"/addEvento", "/ensino", "/cadastrarProfessor", "/deletarEvento", "/perfilProfessor", "/addObs",
		"/contSetIdAluno", "/deletarObs", "/deletarProf", "/editarProfessor"})
public class Controller extends HttpServlet {
	private static final DAO dao = new DAO();
	private static final long serialVersionUID = 1L;
	private int idResp = -1;
	private String perfilPadrao = "admin";
	private String passPadrao = "admin";
	private boolean login = true;
	private String cpfResp;
	private int diaEditar = 0;
	private int idObs = 0, idAluno = 0, idProf = 0;
	boolean sql = false;

	public Controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		if (!sql){
			dao.gerarSql();
			sql = true;
		}

		if (login) {
			if (action.equals("/login")) { // login
				login = login(request, response);
			} else if (action.equals("/cadastrarProfessor")) // CADASTRO Professor
			{
				cadastrarProfessor(request, response);
			} else if (action.equals("/deletarProf")) // DELETAR Professor
			{
				deletarProfessor(Integer.parseInt(request.getParameter("id")), response, request);
			} else if (action.equals("/editarProfessor")) // EDITAR Professor
			{
				editarProfessor(response, request);
			} else if (action.equals("/perfilProfessor")) // PERFIL Professor
			{
				perfilProfessor(request, response);
			} else if (action.equals("/ensino")) // ensino
			{
				ensino(request, response);
			} else if (action.equals("/addObs")) // ADD Observação
			{
				addObs(request, response);
			} else if (action.equals("/deletarObs")) // Deletar Observação
			{
				deletarObs(response, request);
			} else if (action.equals("/deletarEvento")) // Deletar Evento
			{
				Evento.deletar(Integer.parseInt(request.getParameter("id")));
				response.sendRedirect("menu");
			} else if (action.equals("/mudarDia")) // mudar Dia
			{
				mudarDia(request, response);
			} else if (action.equals("/addCardapio")) // add Cardapio
			{
				addCardapio(request, response);
			} else if (action.equals("/addEvento")) // add Evento
			{
				addEvento(request, response, diaEditar);
				response.sendRedirect("menu");
			} else if (action.equals("/menu")) // menu
			{
				menu(request, response);
			} else if (action.equals("/mudarPass")) // mudar Pass
			{
				response.sendRedirect("menu");
			} else if (action.equals("/dia")) // dia
			{
				menuDia(request, response);
			} else if (action.equals("/contSetIdAluno")) // sair
			{
				contSetIdAluno(response, request);
			} else if (action.equals("/sair")) // sair
			{
				login = false;
				response.sendRedirect("index.jsp");
			} else if (action.equals("/main")) // main
			{
				Professor.get(1);
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}
		} else {
			if (action.equals("/login")) { // login
				login = login(request, response);
			} else if (action.equals("/main")) { // main
				Professor.get(1);
			} else {
				response.sendRedirect("index.jsp");
			}
		}
	}

	private void contSetIdAluno(HttpServletResponse response, HttpServletRequest request)
			throws IOException, ServletException {
		Aluno aluno = new Aluno().get(Integer.parseInt(request.getParameter("id")));

		request.setAttribute("aluno", aluno);

		this.idAluno = Integer.parseInt(request.getParameter("id"));

		RequestDispatcher rd = request.getRequestDispatcher("perfil/perfil-Aluno.jsp");
		rd.forward(request, response);
	}

	private void deletarObs(HttpServletResponse response, HttpServletRequest request) throws IOException {
		Observacoes.deletar(Integer.parseInt(request.getParameter("id")));
		response.sendRedirect("perfilAluno?id=" + idAluno);
	}

	private void editarProfessor(HttpServletResponse response, HttpServletRequest request)
			throws IOException, ServletException {
		if (request.getParameter("nome") == null) {
			idProf = Integer.parseInt(request.getParameter("id"));

			request.setAttribute("professor", Professor.get(idProf));
			RequestDispatcher rd = request.getRequestDispatcher("cadastros/editar-Professor.jsp");
			rd.forward(request, response);
		} else {
			Professor pro = new Professor(request.getParameter("nome"), request.getParameter("telefone"),
					request.getParameter("email"), idProf);
			pro.editar();
			response.sendRedirect("perfilProfessor?id=" + idProf);
		}
	}

	private void perfilProfessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Professor pro = Professor.get(id);

		pro.setAlunos(dao.getArrayAlunoProf(id));

		request.setAttribute("professor", pro);
		System.out.println(pro.getNome());
		System.out.println(pro.getId());

		RequestDispatcher rd = request.getRequestDispatcher("perfil/perfil-Professor.jsp");
		rd.forward(request, response);
	}

	private void deletarProfessor(int id, HttpServletResponse response, HttpServletRequest request)
			throws IOException, ServletException {
		if (dao.getArrayAlunoProf(id).size() == 0) {
			new Professor().deletar(id);

			response.sendRedirect("ensino");
		} else {
			request.setAttribute("msmP", "Algum aluno ainda está vinculado a este professor!");

			RequestDispatcher rd = request.getRequestDispatcher("ensino");
			rd.forward(request, response);
		}
	}

	private void cadastrarProfessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("cpf_professor") != null) {
			Professor pro = new Professor(request.getParameter("nome_professor"),
					request.getParameter("cpf_professor"), request.getParameter("telefone"),
					request.getParameter("email"), 0);

			if (Pessoa.validarCpf(request.getParameter("cpf_professor"))) {
				request.setAttribute("msm", "CPF já cadastrado!");

				RequestDispatcher rd = request.getRequestDispatcher("cadastros/cadastro-Professor.jsp");
				rd.forward(request, response);
			} else {
				pro.cadastrar();
				response.sendRedirect("menu");
			}
		} else if (request.getParameter("id_professor") == null) {
			RequestDispatcher rd = request.getRequestDispatcher("cadastros/cadastro-Professor.jsp");
			rd.forward(request, response);
		}
	}

	private void addObs(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (request.getParameter("obs") == null) {
			response.sendRedirect("cadastros/add-Obs.jsp");

			idObs = Integer.parseInt(request.getParameter("id"));
		} else {
			Observacoes obs = new Observacoes();
			obs.cadastrar(request.getParameter("obs"), idObs);

			response.sendRedirect("perfilAluno?id=" + idObs);
			idObs = 0;
		}
	}

	public static void addEvento(HttpServletRequest request, HttpServletResponse response, int diaEditar)
			throws IOException, ServletException {
		if (request.getParameter("evento") == null) {
			request.setAttribute("dia", diaEditar);

			RequestDispatcher rd = request.getRequestDispatcher("addEvento.jsp");
			rd.forward(request, response);
		} else if (!(request.getParameter("evento").toString().equals(""))) {
			Evento evento = new Evento();

			evento.cadastrar(diaEditar, request.getParameter("nomeEvento"), request.getParameter("evento"));
		}
	}

	public static void ensino(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("alunos", Aluno.getArrayAluno());
		request.setAttribute("profs", Pessoa.getProfessores());
		request.setAttribute("resps", Responsavel.getArrayResponsavel());

		if (request.getParameter("msmR") != null) {
			request.setAttribute("msmR", request.getParameter("msmR"));
		}

		RequestDispatcher rd = request.getRequestDispatcher("perfil/ensino.jsp");
		rd.forward(request, response);
	}

	private void addCardapio(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		if (request.getParameter("cardapio") != null) {
			System.out.println("setCardapio iniciando contato com o dao");
			dao.setCardapio(diaEditar, request.getParameter("cardapio"));

			response.sendRedirect("menu");
		} else {
			request.setAttribute("dia", diaEditar);

			RequestDispatcher rd = request.getRequestDispatcher("addCardapio.jsp");
			rd.forward(request, response);
		}
	}

	private void mudarDia(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		if (request.getParameter("dia") == null) {
			request.setAttribute("selecao", "0");

			RequestDispatcher rd = request.getRequestDispatcher("programacao.jsp");
			rd.forward(request, response);
		} else if (request.getParameter("dia") != null
				&& request.getParameter("selecao").toString().equals("0")) {
			request.setAttribute("selecao", "1");

			request.setAttribute("dia", Integer.parseInt(request.getParameter("dia")));
			diaEditar = Integer.parseInt(request.getParameter("dia"));

			RequestDispatcher rd = request.getRequestDispatcher("programacao.jsp");
			rd.forward(request, response);
		}
	}

	private void menuDia(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int dia = Integer.parseInt(request.getParameter("dia"));
		ArrayList<Evento> eventosList = dao.getEventos(dia);
		String cardapio = dao.getCardapio(dia);
		request.setAttribute("diaC", dia);
		request.setAttribute("cardapio", cardapio);
		request.setAttribute("eventosList", eventosList);

		RequestDispatcher rd = request.getRequestDispatcher("diasCalendario.jsp");
		rd.forward(request, response);
	}

	protected boolean login(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String perfil = request.getParameter("userName");
		String pass = request.getParameter("userPass");

		if ((perfilPadrao.equalsIgnoreCase(perfil)) && (passPadrao.equals(pass))) {
			menu(request, response);
			return true;
		} else {
			if (!(perfilPadrao.equalsIgnoreCase(perfil))) {
				request.setAttribute("msm", "Perfil incorreto");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");

				rd.forward(request, response);
			} else {
				request.setAttribute("msm", "Senha incorreto");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");

				rd.forward(request, response);
			}
			response.sendRedirect("index.jsp");
			return false;
		}
	}

	protected void menu(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		ArrayList<Evento> eventosList = dao.getEventos(new Date().getDate());
		String cardapio = dao.getCardapio(new Date().getDate());
		int dia = new Date().getDate();
		request.setAttribute("diaC", dia);
		request.setAttribute("cardapio", cardapio);
		request.setAttribute("eventosList", eventosList);

		RequestDispatcher rd = request.getRequestDispatcher("home.jsp");

		rd.forward(request, response);
	}
}