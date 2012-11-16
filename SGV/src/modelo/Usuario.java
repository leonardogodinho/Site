package modelo;

import javax.persistence.*;

@Entity
@Table(name="usuario")
@SequenceGenerator(name="seq_id_usuario", sequenceName="seq_id_usuario")
@Inheritance(strategy = InheritanceType.JOINED)
public class Usuario {

	@Id
	@Column(name="id_usuario")
	@GeneratedValue(strategy=GenerationType.AUTO, generator="seq_id_usuario")
	private int id_usuario;
	
	@Column(name="nr_cpf")
	private int cpf;
	
	@Column(name="nm_usuario")
	private String nome;
	
	@Column(name="nm_departamento")
	private String depto;
	
	@Column(name="nm_email")
	private String email;

	public int getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}

	public int getCpf() {
		return cpf;
	}

	public void setCpf(int cpf) {
		this.cpf = cpf;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDepto() {
		return depto;
	}

	public void setDepto(String depto) {
		this.depto = depto;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
