package modelo;

import javax.persistence.*;

@Entity
@Table(name = "itemrequisito")
@SequenceGenerator(name="seq_id_itemrequisito", sequenceName="seq_id_itemrequisito")
public class ItemRequisito {

	@Id
	@Column(name="id_itemrequisito")
	@GeneratedValue(strategy=GenerationType.AUTO,generator="seq_id_itemrequisito")
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
	
	public boolean equals(Object o)
	{
		if(o!=null)
		{
			ItemRequisito i = (ItemRequisito)o;
			if(i.getIdItem() == this.getIdItem())
				return true;
		}
		return false;
	}
}

