package kidPlus.model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Evento {
	private static final DAO dao = new DAO();
	private String Evento;
	private String nome;
	private int dia;
	private int id;

	public Evento(String evento, String nome, int dia, int id) {
		super();
		this.Evento = evento;
		this.nome = nome;
		this.dia = dia;
		this.id = id;
	}

	public Evento() {
	}

	public Evento(int dia, String nome, String evento) {
		this.Evento = evento;
		this.nome = nome;
		this.dia = dia;
	}

	public static void cadastrar(int dia, String nome, String evento) {
		dao.setEvento(dia, nome, evento);
	}

	public static void deletar(int id) {
		dao.deletarEvento(id);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEvento() {
		return Evento;
	}

	public void setEvento(String evento) {
		Evento = evento;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getDia() {
		return dia;
	}

	public void setDia(int dia) {
		this.dia = dia;
	}
}
