package kidPlus.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Professor extends Pessoa {
	private static final DAO dao = new DAO();
	private String telefone, email;
	ArrayList<Aluno> alunos = new ArrayList<Aluno>();

	public Professor() {
		super(null, null, 0);
	}

	public Professor(String nome, String cpf, String telefone, String email, int id) {
		super(nome, cpf, id);
		this.telefone = telefone;
		this.email = email;
	}

	public Professor(String nome, int id) {
		super(nome, null, id);
	}

	public Professor(String nome, String telefone, String email, int id) {
		super(nome, null, id);

		this.email = email;
		this.telefone = telefone;
	}

	public Professor(String nome, String cpf, String telefone, String email) {
		super(nome, cpf, 0);

		this.telefone = telefone;
		this.email = email;
	}

	public void cadastrar() {
		dao.setProfessor(new Professor(getNome(), getCpf(), getTelefone(), getEmail()));
	}

	public static void deletar(int id) throws ServletException, IOException {
		dao.deletarProfessor(id);
	}

	public void editar() {
		dao.editarProf(new Professor(getNome(), getTelefone(), getEmail(), getId()));
	}

	public static ArrayList<Professor> getProfessores() {
		return dao.getArrayProfessor();
	}
	
	public static Professor get(int id) {
		return dao.getProfessor(id);
	}
	
	public static boolean validarCpf(String cpf) { // POLIMORFISMO PURO DE PESSOA
		return dao.validarCpfProfessor(cpf);
	}

	public ArrayList<Aluno> getAlunos() {
		return alunos;
	}

	public void setAlunos(ArrayList<Aluno> alunos) {
		this.alunos = alunos;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
