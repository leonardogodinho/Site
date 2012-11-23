package modelo;

import javax.persistence.*;

@Entity
@Table(name="colaborador")
public class Colaborador extends Usuario {

	@Column(name="nm_status")
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
