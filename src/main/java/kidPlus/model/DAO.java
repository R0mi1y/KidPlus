package kidPlus.model;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class DAO {
	//String driver = "org.h2.Driver";
	//String url = "jdbc:h2:tcp://localhost/~/aaa";
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/creche?useTimezone=true&serverTimezone=UTC";
	String user = "root";
	String password = "root";
	/** modulo de conexão **/
	// Parâmetros de conexão
	public DAO(){};

	// Método de conexão
	public void gerarSql(){
		try {
			Connection con = conectar();
			String sqlResponsavel = "CREATE TABLE if not exists responsavel (id int auto_increment primary key, cpf varchar(14) not null, nome varchar(100), telefone varchar(25), email varchar(50), endereco varchar(1000))";
			String sqlProfessor = "CREATE TABLE if not exists professor (id int auto_increment primary key, nome varchar(100), cpf VARCHAR(14) NOT NULL, telefone varchar(25), email varchar(50))";
			String sqlAluno = "CREATE TABLE if not exists aluno (id int auto_increment primary key, nome varchar(100), cpf varchar(14) not null, id_responsavel int not null, foreign key (id_responsavel) references responsavel (id), id_professor int not null, foreign key (id_professor) references professor (id), data_nascimento date, data_matricula date, faltas INT NOT NULL)";
			String sqlObservacoes = "CREATE TABLE if not exists observacoes (id INTEGER auto_increment PRIMARY KEY, id_aluno int NOT NULL, observacao TEXT, FOREIGN KEY (id_aluno) REFERENCES aluno (id))";
			String sqlDias = "CREATE TABLE if not exists dias (dia int primary key, cardapio varchar(500) not null)";
			String sqlEventos = "CREATE TABLE if not exists eventos (id int auto_increment primary key, dia int not null, nome varchar(50) not null, evento varchar(1000))";
			try (Statement statement = con.createStatement()) {
				statement.executeUpdate(sqlResponsavel);
				statement.executeUpdate(sqlProfessor);
				statement.executeUpdate(sqlAluno);
				statement.executeUpdate(sqlObservacoes);
				statement.executeUpdate(sqlDias);
				statement.executeUpdate(sqlEventos);
			}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		private Connection conectar() {

			Connection con = null;

			try {
				Class.forName(this.driver);
				con = DriverManager.getConnection(this.url, this.user, this.password);
				return con;
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("Banco nao encontrado ou inexistente. Erro 404");
				return null;
			}
		}



	public boolean validarCpf(String cpf) {
		String sql1 = "SELECT cpf FROM aluno WHERE cpf = ?;";
		String sql2 = "SELECT cpf FROM professor WHERE cpf = ?;";
		String sql3 = "SELECT cpf FROM responsavel WHERE cpf = ?;";
		ResultSet rs;

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql1);
			pstm.setString(1, cpf);
			rs = pstm.executeQuery();

			if (rs.next()) {
				con.close();
				return true;
			} else {
					pstm = con.prepareStatement(sql2);
					pstm.setString(1, cpf);
					rs = pstm.executeQuery();

					if (rs.next()) {
							con.close();
							return true;
					} else {
							pstm = con.prepareStatement(sql3);
							pstm.setString(1, cpf);
							rs = pstm.executeQuery();

							if (rs.next()) {
									con.close();
									return true;
							}
					}
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return false;
	}

	public void setResponsavel(Responsavel resp) {
		String sql = "INSERT INTO responsavel (nome, cpf, telefone, email, endereco) VALUES (?,?,?,?,?);";

		try {
			// Abrir conexão
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);

			pstm.setString(1, resp.getNome());
			pstm.setString(2, resp.getCpf());
			pstm.setString(3, resp.getTelefone());
			pstm.setString(4, resp.getEmail());
			pstm.setString(5, resp.getEndereco());

			pstm.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public int getIdResp(String cpf) {
		String sql = "SELECT id FROM responsavel WHERE cpf = ?;";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setString(1, cpf);
			ResultSet rs = pstm.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			} else {
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public Responsavel getResponsavel(int id, ArrayList<Aluno> alunos) { ///
		String sql = "SELECT nome, cpf, telefone, email, endereco FROM responsavel WHERE id = ?;";
		Responsavel resp = new Responsavel();

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1, id);
			ResultSet rs = pstm.executeQuery();

			if (rs.next()) {
				String nome = rs.getString(1);
				String cpf = rs.getString(2);
				String telefone = rs.getString(3);
				String email = rs.getString(4);
				String endereco = rs.getString(5);

				resp = new Responsavel(nome, cpf, telefone, email, endereco, alunos, id);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return resp;
	}

	public ArrayList<Aluno> getArrayAlunoResp(int id) {
		String sql = "SELECT id FROM aluno WHERE id_responsavel = ?";
		ArrayList<Aluno> alunos = new ArrayList<Aluno>();

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1, id);

			ResultSet rs = pstm.executeQuery();

			if(rs.next()) {
				alunos.add(getAluno(rs.getInt(1)));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return alunos;
	}

	public ArrayList<Responsavel> getArrayResponsavel() {
		ArrayList<Responsavel> array = new ArrayList<Responsavel>();
		String sql = "SELECT id, cpf, nome, telefone, email, endereco FROM responsavel ORDER BY nome;";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();

			while (rs.next()) {
				int id = rs.getInt(1);
				String cpf = rs.getString(2);
				String nome = rs.getString(3);
				String telefone = rs.getString(4);
				String email = rs.getString(5);
				String endereco = rs.getString(6);

				array.add(new Responsavel(nome, cpf, telefone, email, endereco, id));
			}
			con.close();

			return array;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public void setAluno(Aluno aluno, int idProf) {
		String sql = "INSERT INTO aluno (nome, cpf, id_responsavel, faltas, data_nascimento, data_matricula, id_professor) VALUES (?,?,?,?,?,?,?);";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);

			pstm.setString(1, aluno.getNome());
			pstm.setString(2, aluno.getCpf());
			pstm.setInt(3, getIdResp(aluno.getResponsavel().getCpf()));
			pstm.setInt(4, 0);
			pstm.setDate(5, aluno.getData_nascimento());
			pstm.setDate(6, aluno.getData_matricula());
			pstm.setInt(7, idProf);

			pstm.executeUpdate(); // error
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public int getIdAluno(String cpf) {
		String sql = "SELECT id FROM aluno WHERE cpf = ?;";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setString(1, cpf);
			ResultSet rs = pstm.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			} else {
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public Aluno getAluno(int id) {
		String sql1 = "SELECT nome, cpf, id_responsavel, data_nascimento, data_matricula, faltas, id_professor FROM aluno WHERE id = ?;";
		String sql2 = "SELECT id, observacao FROM observacoes WHERE id_aluno = ?;";
		Aluno aluno = new Aluno();
		ArrayList<Observacoes> obs = new ArrayList<Observacoes>();

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql1);
			pstm.setInt(1, id);
			ResultSet rs = pstm.executeQuery();

			if (rs.next()) {
				String nome = rs.getString(1);
				String cpf = rs.getString(2);
				Professor pro = getProfessor(rs.getInt(7));
				Responsavel responsavel = new Responsavel().get(rs.getInt(3));

				Date data_nascimento = rs.getDate(4);
				Date data_matricula = rs.getDate(5);
				int faltas = rs.getInt(6);

				pstm = con.prepareStatement(sql2);
				pstm.setInt(1, id);
				rs = pstm.executeQuery();

				while(rs.next()) {
					Observacoes o = new Observacoes(rs.getString(2), rs.getInt(1));
					obs.add(o);
				}

				aluno = new Aluno(nome, cpf, responsavel, data_nascimento, data_matricula, faltas, pro, obs, id);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return aluno;
	}

	public ArrayList<Aluno> getArrayAluno() {
		ArrayList<Aluno> array = new ArrayList<Aluno>();
		String sql = "SELECT id, nome, cpf, id_responsavel, data_nascimento, data_matricula, faltas, id_professor FROM aluno ORDER BY nome;";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();

			while (rs.next()) {
				int id = rs.getInt(1);
				String nome = rs.getString(2);
				String cpf = rs.getString(3);
				Professor pro = Professor.get(rs.getInt(8));
				Responsavel resp = new Responsavel();
				resp.getResponsavel(rs.getInt(4), null);

				System.out.println(resp.getNome());
				System.out.println(resp.getId());

				Date data_nascimento = rs.getDate(5);
				Date data_matricula = rs.getDate(6);
				int faltas = rs.getInt(7);

				array.add(new Aluno(nome, cpf, resp, data_nascimento, data_matricula, faltas, pro, null, id));
			}
			con.close();
			return array;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public String getCardapio(int dia) {
		String sql = "SELECT cardapio FROM dias WHERE dia = ?;";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1, dia);

			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				String cardapio = rs.getString(1);
				con.close();
				return cardapio;
			} else {
				con.close();
				return "";
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return "";
	}

	public void setCardapio(int dia, String cardapio) {
		String sql1 = "UPDATE dias SET cardapio = ? WHERE dia = ?";
		String sql2 = "INSERT INTO dias (dia, cardapio) VALUES (?,?)";

		if (getCardapio(dia).equals("")) {
			try {
				Connection con = conectar();
				PreparedStatement pstm = con.prepareStatement(sql2);
				pstm.setInt(1, dia);
				pstm.setString(2, cardapio);
				pstm.executeUpdate();

				con.close();
			} catch (Exception e) {
				System.out.println(e);
			}

		} else {
			try {
				Connection con = conectar();
				PreparedStatement pstm = con.prepareStatement(sql1);
				pstm.setString(1, cardapio);
				pstm.setInt(2, dia);
				pstm.executeUpdate();

				con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}

	public void setEvento(int dia, String nome, String evento) {
		String sql = "INSERT INTO eventos (dia, evento, nome) VALUES (?,?,?)";

		System.out.println("Cardapio existente, sobrepondo");
		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1, dia);
			pstm.setString(2, evento);
			pstm.setString(3, nome);
			pstm.executeUpdate();

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<Evento> getEventos(int dia) {
		String sql = "SELECT evento, nome, id FROM eventos WHERE dia = ?;";
		ArrayList<Evento> array = new ArrayList<Evento>();

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1, dia);
			ResultSet rs = pstm.executeQuery();

			while (rs.next()) {
				array.add(new Evento(rs.getString(1), rs.getString(2), dia, rs.getInt(3)));
			}

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return array;
	}

	public void setProfessor(Professor pro) {
		String sql = "INSERT INTO professor (nome, cpf, telefone, email) VALUES (?,?,?,?);";

		try {
			// Abrir conexão
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);

			pstm.setString(1, pro.getNome());
			pstm.setString(2, pro.getCpf());
			pstm.setString(3, pro.getTelefone());
			pstm.setString(4, pro.getEmail());

			pstm.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public Professor getProfessor(int id) {
		String sql = "SELECT nome, cpf, telefone, email FROM professor WHERE id=?;";
		Professor pro;

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1, id);
			ResultSet rs = pstm.executeQuery();

			if(rs.next()) {
				pro = new Professor(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), id);
				con.close();
				return pro;
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public boolean validarCpfProfessor(String cpf) {
		String sql = "SELECT cpf FROM professor WHERE cpf = ?;";
		ResultSet rs;

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setString(1, cpf);
			rs = pstm.executeQuery();

			if (rs.next()) {
				con.close();
				return true;
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return false;
	}

	public ArrayList<Professor> getArrayProfessor() {
		String sql = "SELECT id, nome, cpf, telefone, email FROM professor;";
		ArrayList<Professor> professores = new ArrayList<Professor>();

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();

			while(rs.next()) {
				Professor pro = new Professor(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(1));
				professores.add(pro);
			}
			con.close();

			return professores;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public ArrayList<Professor> getPessoaProfessor() {
		String sql = "SELECT nome, id FROM professor;";
		ArrayList<Professor> profs = new ArrayList<Professor>();

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();

			while(rs.next()) {
				Professor pro = (Professor) new Professor(rs.getString(1), rs.getInt(2));
				profs.add(pro);
			}

			con.close();
			return profs;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public Responsavel getPessoaResponsavel(int id) {
		String sql = "SELECT nome, id FROM professor WHERE id = ?;";
		Responsavel profs;

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1, id);
			ResultSet rs = pstm.executeQuery();

			Responsavel pro = new Responsavel(rs.getString(1), rs.getInt(2));

			con.close();
			return pro;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public void deletarEvento(int id) {
		String sql = "DELETE FROM eventos WHERE id=?;";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1, id);
			pstm.executeUpdate();

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void deletarAluno(int id) {
		System.out.println(id);
		String sql1 = "DELETE FROM aluno WHERE id=?;";
		String sql2 = "DELETE FROM observacoes WHERE id_aluno=?;";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql2);
			pstm.setInt(1, id);
			pstm.executeUpdate();

			pstm = con.prepareStatement(sql1);
			pstm.setInt(1, id);
			pstm.executeUpdate();

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void addObs(int id, String obs) {
		String sql = "INSERT INTO observacoes (id_aluno, observacao) VALUES (?,?);";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);

			pstm.setInt(1, id);
			pstm.setString(2, obs);
			pstm.executeUpdate();

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void deletarObs(int id) {
		String sql = "DELETE FROM observacoes WHERE id = ?;";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);

			pstm.setInt(1, id);
			pstm.executeUpdate();

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void deletarResponsavel(int id) {
		String sql = "DELETE FROM responsavel WHERE id = ?";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1, id);

			pstm.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<Aluno> getArrayAlunoProf(int id) {
		String sql = "SELECT id FROM aluno WHERE id_professor = ?";
		ArrayList<Aluno> alunos = new ArrayList<Aluno>();

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1, id);

			ResultSet rs = pstm.executeQuery();

			if(rs.next()) {
				alunos.add(getAluno(rs.getInt(1)));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return alunos;
	}


	public void deletarProfessor(int id) {
		System.out.println(id);
		String sql = "DELETE FROM professor WHERE id=?;";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setInt(1, id);
			pstm.executeUpdate();

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}


	public void editarAluno(Aluno aluno) {
		String sql = "UPDATE aluno SET nome = ?, data_nascimento = ?, data_matricula = ?, faltas = ? WHERE id = ?;";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);
			pstm.setString(1, aluno.getNome());
			pstm.setDate(2, aluno.getData_nascimento());
			pstm.setDate(3, aluno.getData_matricula());
			pstm.setInt(4, aluno.getFaltas());
			pstm.setInt(5, aluno.getId());

			pstm.executeUpdate();

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void mudarProf(int idProf, int idAluno) {
		String sql = "UPDATE aluno SET id_professor = ? WHERE id = ?;";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);

			pstm.setInt(1, idProf);
			pstm.setInt(2, idAluno);
			pstm.executeUpdate();

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void editarProf(Professor pro) {
		String sql = "UPDATE professor SET nome = ?, telefone = ?, email = ? WHERE id = ?;";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);

			pstm.setString(1, pro.getNome());
			pstm.setString(2, pro.getTelefone());
			pstm.setString(3, pro.getEmail());
			pstm.setInt(4, pro.getId());

			pstm.executeUpdate();

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void editarResp(Responsavel resp) {
		String sql = "UPDATE responsavel SET nome = ?, telefone = ?, email = ?, endereco = ? WHERE id = ?;";

		try {
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(sql);

			pstm.setString(1, resp.getNome());
			pstm.setString(2, resp.getTelefone());
			pstm.setString(3, resp.getEmail());
			pstm.setString(4, resp.getEndereco());
			pstm.setInt(5, resp.getId());

			pstm.executeUpdate();

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
























