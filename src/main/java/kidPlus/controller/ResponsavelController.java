package kidPlus.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kidPlus.model.DAO;
import kidPlus.model.Responsavel;

@WebServlet(urlPatterns = { "/cadastrarResponsavel", "/perfilResponsavel", "/deletarResp", "/editarResponsavel",
		"/setCpfResp" })
public class ResponsavelController extends HttpServlet {
	private static final DAO dao = new DAO();
	private static final long serialVersionUID = 1L;
	String cpfResp;
	int idResp = 0;

	public ResponsavelController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		if (action.equals("/cadastrarResponsavel")) // CADASTRO Responsavel
		{
			cadastrarResponsavel(request, response);
		} else if (action.equals("/deletarResp")) // DELETAR Responsavel
		{
			deletarResponsavel(response, request);
		} else if (action.equals("/perfilResponsavel")) // PERFIL Responsavel
		{
			perfilResponsavel(request, response);
		} else if (action.equals("/editarResponsavel")) // EDITAR Responsavel
		{
			editarResponsavel(idResp, response, request);
		} else if (action.equals("/setCpfResp")) {
			setCpfResp(response, request);
		}
	}

	private void setCpfResp(HttpServletResponse response, HttpServletRequest request) throws IOException {
		this.cpfResp = request.getParameter("cpfResp");
		response.sendRedirect("cadastros/cadastro-Responsavel.jsp");
	}

	private void editarResponsavel(int idProf2, HttpServletResponse response, HttpServletRequest request)
			throws IOException, ServletException {
		if (request.getParameter("nome") == null) {
			idResp = Integer.parseInt(request.getParameter("id"));

			Responsavel resp = new Responsavel().get(idResp);
			request.setAttribute("responsavel", resp);
			RequestDispatcher rd = request.getRequestDispatcher("cadastros/editar-Responsavel.jsp");
			rd.forward(request, response);
		} else {
			Responsavel resp = new Responsavel(request.getParameter("nome"), request.getParameter("telefone"),
					request.getParameter("email"), request.getParameter("endereco"), idResp);

			resp.editarPerfil();
			response.sendRedirect("perfilResponsavel?id=" + idResp);
		}
	}

	private void deletarResponsavel(HttpServletResponse response, HttpServletRequest request)
			throws ServletException, IOException {
		if (dao.getArrayAlunoResp(Integer.parseInt(request.getParameter("id"))).size() == 0) {
			Responsavel.deletar(Integer.parseInt(request.getParameter("id")));
			response.sendRedirect("ensino");
		} else {
			request.setAttribute("msmR", "Este responsavel está vinculado a um aluno!");

			RequestDispatcher rd = request.getRequestDispatcher("ensino");
			rd.forward(request, response);
		}
	}

	private void perfilResponsavel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Responsavel resp = new Responsavel().get(id);

		request.setAttribute("responsavel", resp);

		RequestDispatcher rd = request.getRequestDispatcher("perfil/perfil-Responsavel.jsp");
		rd.forward(request, response);
	}

	private void cadastrarResponsavel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Responsavel resp = new Responsavel(request.getParameter("nome_resp"), cpfResp,
				request.getParameter("telefone"), request.getParameter("email"),
				request.getParameter("endereco"));

		resp.cadastrar();
		idResp = dao.getIdResp(cpfResp);

		response.sendRedirect("setIdResp?idResp=" + idResp);
	}
}
