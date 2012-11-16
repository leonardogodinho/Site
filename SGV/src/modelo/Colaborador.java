package modelo;

import javax.persistence.*;

@Entity
@Table(name="colaborador")
public class Colaborador extends Usuario {

	@Column(name="senha")
	private String senha;

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}
