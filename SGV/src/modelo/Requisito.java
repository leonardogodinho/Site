package modelo;

import javax.persistence.*;

@Entity
@Table(name = "requisito")
@SequenceGenerator(name="seq_id_requisito", sequenceName="seq_id_requisito")
public class Requisito {
	
	@Id
	@Column(name="id_requisito")
	@GeneratedValue(strategy=GenerationType.AUTO, generator="seq_id_requisito")
	private int id_requisito;

	@Column(name="nm_requisito")
	private String nome;
	
	@Column(name="ds_requisito")
	private String descricao;

	public int getId_requisito() {
		return id_requisito;
	}

	public void setId_requisito(int id_requisito) {
		this.id_requisito = id_requisito;
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
}
