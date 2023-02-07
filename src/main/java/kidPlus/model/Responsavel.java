package kidPlus.model;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;

public class Responsavel extends Pessoa {
	private static final DAO dao = new DAO();
	private String telefone;
	private String email;
	private String endereco;
	private ArrayList<Aluno> alunos = new ArrayList<Aluno>();

	public Responsavel() {
		super(null, null, 0);
	}

	public Responsavel(String nome, String telefone, String email, String endereco, int id) {
		super(nome, null, id);
		this.telefone = telefone;
		this.email = email;
		this.endereco = endereco;
	}

	public Responsavel(String nome, String cpf, String telefone, String email, String endereco) {
		super(nome, cpf, 0);
		this.telefone = telefone;
		this.email = email;
		this.endereco = endereco;
	}

	public Responsavel(String nome, String cpf, String telefone, String email, String endereco, int id) {
		super(nome, cpf, id);
		this.telefone = telefone;
		this.email = email;
		this.endereco = endereco;
	}

	public Responsavel(String nome, String cpf, String telefone, String email, String endereco,
			ArrayList<Aluno> alunos, int id) {
		super(nome, cpf, id);
		this.telefone = telefone;
		this.email = email;
		this.endereco = endereco;
		this.alunos = alunos;
	}

	public Responsavel(String nome, int id) {
		super(nome, null, id);
	}

	public static int getIdResp(String cpf) {
		return dao.getIdResp(cpf);
	}

	public Responsavel get(int id) {
		ArrayList<Aluno> alunos = dao.getArrayAluno();
		
		return dao.getResponsavel(id, alunos);
	}

	public void getResponsavel(int id, String a) {
		Responsavel resp = dao.getResponsavel(id, null);

		setNome(resp.getNome());
		setCpf(resp.getCpf());
		setTelefone(resp.getTelefone());
		setEmail(resp.getEmail());
		setEndereco(resp.getEndereco());
		setAlunos(resp.getAlunos());
		setId(resp.getId());
	}

	public static void deletar(int id) {
		dao.deletarResponsavel(id);
	}

	public void editarPerfil() {
		Responsavel resp = new Responsavel(getNome(), getTelefone(), getEmail(), getEndereco(), getId());

		dao.editarResp(resp);
	}

	public void cadastrar() {
		dao.setResponsavel(new Responsavel(getNome(), getCpf(), getTelefone(), getEmail(), getEndereco()));
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

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public static ArrayList<Responsavel> getArrayResponsavel() {
		return dao.getArrayResponsavel();
	}

	public ArrayList<Aluno> getAlunos() {
		return alunos;
	}

	public void setAlunos(ArrayList<Aluno> alunos) {
		this.alunos = alunos;
	}
}
