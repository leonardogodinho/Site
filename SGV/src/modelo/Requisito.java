package modelo;

import javax.persistence.*;

@Entity
@Table(name = "requisito")
public class Requisito {
	
	@Id
	@Column(name="id_requisito")
	private int idRequisito;

	@Column(name="nm_requisito")
	private String nome;
	
	@Column(name="ds_requisito")
	private String descricao;

	public int getIdRequisito() {
		return idRequisito;
	}

	public void setIdRequisito(int idRequisito) {
		this.idRequisito = idRequisito;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public boolean equals(Object o)
	{
		if(o!=null)
		{
			Requisito r = (Requisito)o;
			if(r.getIdRequisito() == this.getIdRequisito())
				return true;
		}
		return false;
	}
}
