package modelo;

import javax.persistence.*;

@Entity
@Table(name = "itemrequisito")
public class ItemRequisito {

	@Id
	@Column(name="id_itemrequisito")
	private int idItem;
	
	@Column(name="nr_quantidade")
	private int quantidade;
	
	@ManyToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	private Requisito r;

	public int getIdItem() {
		return idItem;
	}

	public void setIdItem(int idItem) {
		this.idItem = idItem;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public Requisito getR() {
		return r;
	}

	public void setR(Requisito r) {
		this.r = r;
	}
}
