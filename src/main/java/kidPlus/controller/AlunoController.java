package kidPlus.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kidPlus.model.*;

@WebServlet(urlPatterns = { "/cadastrarAluno", "/deletarAluno", "/perfilAluno", "/editarAluno", "/mudarProfessor",
		"/validarProfessor", "/validarResponsavel", "/setIdResp" })
public class AlunoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private int idAluno = 0, idResp = 0;
	private static final DAO dao = new DAO();
	public AlunoController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		if (action.equals("/cadastrarAluno")) // CADASTRO Aluno
		{
			cadastrarAluno(request, response);
		} else if (action.equals("/deletarAluno")) // DELETAR Aluno
		{
			deletarAluno(request, response);
		} else if (action.equals("/perfilAluno")) // PERFIL Aluno
		{
			perfilAluno(response, request);
		} else if (action.equals("/editarAluno")) // EDITAR Aluno
		{
			try {
				editarPerfilAluno(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (action.equals("/mudarProfessor")) { // MUDAR Professor do Aluno
			mudarProfessor(request, response);
		} else if (action.equals("/validarResponsavel")) // VALIDAR Responsavel
		{
			validarResponsavel(request, response);
		} else if (action.equals("/setIdResp")) {
			setIdResp(request, response);
		}
	}

	private void setIdResp(HttpServletRequest request, HttpServletResponse response) throws IOException {
		this.idResp = Integer.parseInt(request.getParameter("idResp"));

		response.sendRedirect("cadastrarAluno");
	}

	private void mudarProfessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("idAluno") != null) {
			idAluno = Integer.parseInt(request.getParameter("idAluno"));

			request.setAttribute("professores", Professor.getProfessores());
			request.setAttribute("mudar", "");
			RequestDispatcher rd = request.getRequestDispatcher("cadastros/valid-Prof.jsp");
			rd.forward(request, response);
		} else {
			int idProf = Integer.parseInt(request.getParameter("id_professor"));
			Aluno.mudarProfessor(idProf, idAluno);
			response.sendRedirect("perfilAluno?id=" + idAluno);
			idAluno = 0;
		}
	}

	private void deletarAluno(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Aluno.deletar(Integer.parseInt(request.getParameter("id")));

		RequestDispatcher rd = request.getRequestDispatcher("ensino");
		rd.forward(request, response);
	}

	private void editarPerfilAluno(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getParameter("nome") == null) {
			Aluno aluno = new Aluno().get(Integer.parseInt(request.getParameter("id")));

			request.setAttribute("aluno", aluno);
			RequestDispatcher rd = request.getRequestDispatcher("cadastros/editar-Aluno.jsp");
			rd.forward(request, response);

			idAluno = Integer.parseInt(request.getParameter("id"));
		} else {
			Aluno aluno = new Aluno(request.getParameter("nome"),
					new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dataNascimento")),
					new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dataMatricula")),
					Integer.parseInt(request.getParameter("faltas")), idAluno);

			aluno.editarPerfil();
			response.sendRedirect("perfilAluno?id=" + idAluno);
			idAluno = 0;
		}
	}

	private void cadastrarAluno(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("id_professor") == null) {
			request.setAttribute("professores", Professor.getProfessores());

			RequestDispatcher rd = request.getRequestDispatcher("cadastros/valid-Prof.jsp");
			rd.forward(request, response);
		} else if (!(Pessoa.validarCpf(request.getParameter("cpf_aluno")))
				&& request.getParameter("cpf_aluno") != null) {

			java.util.Date data = null;
			java.util.Date dataAgora = new java.util.Date();

			try {
				data = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data_nascimento"));
				System.out.println(data);
			} catch (Exception e) {
				System.out.println("Aluno.cadastrar = falha!!!");
				e.printStackTrace();
			}

			Aluno aluno = new Aluno(request.getParameter("nome_aluno"), request.getParameter("cpf_aluno"),
					dao.getResponsavel(idResp, dao.getArrayAlunoResp(idResp)), dataAgora, data,
					dao.getProfessor(Integer.parseInt(request.getParameter("id_professor"))));

			aluno.cadastrar(idResp, Integer.parseInt(request.getParameter("id_professor")));

			idResp = -1;
			response.sendRedirect("menu");
		} else if (Pessoa.validarCpf(request.getParameter("cpf_aluno"))) {
			request.setAttribute("msm", "CPF já cadastrado!");
			request.setAttribute("id_professor", request.getParameter("id_professor"));

			RequestDispatcher rd = request.getRequestDispatcher("cadastros/cadastro-Aluno.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("id_professor", request.getParameter("id_professor"));

			RequestDispatcher rd = request.getRequestDispatcher("cadastros/cadastro-Aluno.jsp");
			rd.forward(request, response);
		}
	}

	private void perfilAluno(HttpServletResponse response, HttpServletRequest request)
			throws ServletException, IOException {

		idAluno = Integer.parseInt(request.getParameter("id"));
		response.sendRedirect("contSetIdAluno?id=" + idAluno);
	}

	private void validarResponsavel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(Professor.getProfessores());

		if (Professor.getProfessores().size() == 0) {
			request.setAttribute("msm", "Não há professores cadastrados.");

			RequestDispatcher rd = request.getRequestDispatcher("cadastros/valid-Resp.jsp");
			rd.forward(request, response);
		} else if (Pessoa.validarCpf(request.getParameter("cpf_responsavel"))) {
			idResp = Responsavel.getIdResp(request.getParameter("cpf_responsavel"));

			request.setAttribute("professores", Professor.getProfessores());

			RequestDispatcher rd = request.getRequestDispatcher("cadastros/valid-Prof.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("setCpfResp?cpfResp=" + request.getParameter("cpf_responsavel"));
		}
	}
}
