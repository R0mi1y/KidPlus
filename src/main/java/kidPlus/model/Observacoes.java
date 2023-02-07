package kidPlus.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Observacoes {
	private static final DAO dao = new DAO();
	private String observacao;
	private int id;
	private Aluno aluno;


	public Observacoes(String observacao, int id) {
		super();
		this.observacao = observacao;
		this.id = id;
	}

	public void cadastrar(String obs, int id) throws IOException {
		dao.addObs(id, obs);
	}

	public static void deletar(int id) {
		dao.deletarObs(id);
	}

	public Observacoes() {
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Aluno getAluno() {
		return aluno;
	}
	
	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}
}
