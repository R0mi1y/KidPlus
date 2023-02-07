package kidPlus.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Pessoa {
	private static final DAO dao = new DAO();
	private String nome;
	private String cpf;
	private int id;

	public Pessoa(String nome, String cpf, int id) {
		super();
		this.nome = nome;
		this.cpf = cpf;
		this.id = id;
	}

	public Pessoa(String nome, int id) {
		super();
		this.nome = nome;
		this.id = id;
	}
	

	public static ArrayList<Professor> getProfessores() {
		return dao.getPessoaProfessor();
	}

	public static boolean validarCpf(String cpf) { // POLIMORFISMO PURO DE PROFESSOR
		return dao.validarCpf(cpf);
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
