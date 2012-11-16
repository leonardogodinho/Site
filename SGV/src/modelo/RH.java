package modelo;

import javax.persistence.*;

@Entity
@Table(name = "rh")
public class RH extends Usuario {

	@Column(name = "senha")
	private String senha;

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

}
