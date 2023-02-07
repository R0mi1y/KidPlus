package kidPlus.model;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.Date;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Aluno extends Pessoa {
	private static final DAO dao = new DAO();
	private Responsavel responsavel;
	private java.util.Date data_nascimento;
	private java.util.Date data_matricula;
	private Professor professor;
	private int faltas;
	private ArrayList<Observacoes> observacoes = new ArrayList<Observacoes>();

	public Aluno(String nome, java.util.Date data_nascimento, java.util.Date data_matricula, int faltas, int id) {
		super(nome, null, id);

		this.responsavel = null;
		this.data_nascimento = data_nascimento;
		this.data_matricula = data_matricula;
		this.faltas = faltas;
		this.professor = null;
		this.observacoes = null;
	}

	public Aluno(String nome, String cpf, Responsavel responsavel, java.util.Date data_nascimento,
			java.util.Date data_matricula, int faltas, int id) {
		super(nome, cpf, id);

		this.responsavel = responsavel;
		this.data_nascimento = data_nascimento;
		this.data_matricula = data_matricula;
		this.faltas = faltas;
		this.professor = null;
	}

	public Aluno(String nome, String cpf, Responsavel responsavel, java.util.Date data_matricula,
			java.util.Date data_nascimento, Professor pro) {
		super(nome, cpf, 0);

		this.responsavel = responsavel;
		this.data_nascimento = data_nascimento;
		this.data_matricula = data_matricula;
		this.faltas = 0;
		this.professor = pro;
	}

	public Aluno(String nome, String cpf, Responsavel responsavel, java.util.Date data_nascimento,
			java.util.Date data_matricula, int faltas, Professor pro, ArrayList<Observacoes> obs, int id) {
		super(nome, cpf, id);

		this.responsavel = responsavel;
		this.data_nascimento = data_nascimento;
		this.data_matricula = data_matricula;
		this.faltas = faltas;
		this.professor = pro;
		this.observacoes = obs;
	}

	public Aluno() {
		super(null, null, 0);

		this.responsavel = null;
		this.data_nascimento = null;
		setData_matricula(null);
		this.faltas = 0;
	}

	public Aluno get(int id) {
		return dao.getAluno(id);
	}

	public void cadastrar(int idResp, int idProf) {
		Aluno aluno = new Aluno(getNome(), getCpf(), getResponsavel(), getData_matricula(), getData_nascimento(),
				getProfessor());

		dao.setAluno(aluno, idProf);
	}

	public java.sql.Date getData_nascimento() {
		java.sql.Date data = new java.sql.Date(this.data_nascimento.getTime());
		return data;
	}

	public java.sql.Date getData_matricula() {
		java.sql.Date data = new java.sql.Date(this.data_matricula.getTime());
		return data;
	}

	public int getIdade() {
		java.util.Date dataAtual = new java.util.Date();
		int idade = 0;

		if (this.data_nascimento.getMonth() > dataAtual.getMonth()
				|| this.data_nascimento.getMonth() == dataAtual.getMonth()
						&& this.data_nascimento.getDay() > dataAtual.getDay()) {
			idade = (dataAtual.getYear() - this.data_nascimento.getYear()) - 1;
		} else {
			idade = dataAtual.getYear() - this.data_nascimento.getYear();
		}

		return idade;
	}

	public void editarPerfil() throws Exception {

		Aluno aluno = new Aluno(getNome(), getCpf(), getResponsavel(), getData_matriculaUtil(),
				getData_nascimentoUtil(), getFaltas(), getId());

		dao.editarAluno(aluno);
	}

	public static void mudarProfessor(int idProf, int idAluno) {
		dao.mudarProf(idProf, idAluno);
	}

	public static ArrayList<Aluno> getArrayAluno() {
		return dao.getArrayAluno();
	}

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	public void setData_matricula(java.util.Date data) {
		this.data_matricula = data;
	}

	public int getFaltas() {
		return faltas;
	}

	public Date getData_matriculaUtil() {
		return this.data_matricula;
	}

	public Date getData_nascimentoUtil() {
		return this.data_nascimento;
	}

	public Responsavel getResponsavel() {
		return responsavel;
	}

	public void setResponsavel(Responsavel responsavel) {
		this.responsavel = responsavel;
	}

	public void setData_nascimento(java.util.Date data) {
		this.data_nascimento = data;
	}

	public void setFaltas(int faltas) {
		this.faltas = faltas;
	}

	public static void deletar(int id) {
		dao.deletarAluno(id);
	}

	public ArrayList<Observacoes> getObservacoes() {
		return observacoes;
	}

	public void setObservacoes(ArrayList<Observacoes> observacoes) {
		this.observacoes = observacoes;
	}

}
