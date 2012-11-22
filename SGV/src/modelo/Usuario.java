package modelo;

import javax.persistence.*;

@Entity
@Table(name="usuario")
@Inheritance(strategy = InheritanceType.JOINED)
public class Usuario {

	@Id
	@Column(name="id_usuario")
	private int idUsuario;
	
	@Column(name="nr_cpf")
	private int cpf;
	
	@Column(name="nm_usuario")
	private String nome;
	
	@Column(name="nm_departamento")
	private String depto;
	
	@Column(name="nm_email")
	private String email;
	
	@Column(name="nm_senha")
	private String senha;

	@Column(name="tp_usuario")
	private String tipo;
	
	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
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

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
}
