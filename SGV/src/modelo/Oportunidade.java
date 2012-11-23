

package modelo;

import java.util.Date;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "oportunidade")
public class Oportunidade {
	
	@Id
	@Column(name="id_oportunidade")
	private int idOportunidade;
	
	@Column(name="nm_oportunidade")
	private String titulo;
	
	@Column(name="vl_carga_horaria")
	private int cargaHoraria;
	
	@Column(name="nm_area_atuacao")
	private String areaAtuacao;
	
	@Column(name="vl_salario")
	private double salario;
	
	@Column(name="ds_oportunidade")
	private String descricao;
	
	@Column(name="ds_beneficios")
	private String beneficios;
	
	@Column(name="dt_encerramento")
	private Date dataEncerramento;
	
	@ManyToMany(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinTable(name="ItemOp"
			, joinColumns={@JoinColumn(name = "id_oportunidade")}
			, inverseJoinColumns={@JoinColumn(name="id_itemrequisito")})
	private Set<ItemRequisito> itens;

	public Date getDataEncerramento() {
		return dataEncerramento;
	}

	public void setDataEncerramento(Date dataEncerramento) {
		this.dataEncerramento = dataEncerramento;
	}

	public int getIdOportunidade() {
		return idOportunidade;
	}

	public void setIdOportunidade(int idOportunidade) {
		this.idOportunidade = idOportunidade;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public int getCargaHoraria() {
		return cargaHoraria;
	}

	public void setCargaHoraria(int cargaHoraria) {
		this.cargaHoraria = cargaHoraria;
	}

	public String getAreaAtuacao() {
		return areaAtuacao;
	}

	public void setAreaAtuacao(String areaAtuacao) {
		this.areaAtuacao = areaAtuacao;
	}

	public double getSalario() {
		return salario;
	}

	public void setSalario(double salario) {
		this.salario = salario;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getBeneficios() {
		return beneficios;
	}

	public void setBeneficios(String beneficios) {
		this.beneficios = beneficios;
	}

	public Set<ItemRequisito> getItens() {
		return itens;
	}

	public void setItens(Set<ItemRequisito> itens) {
		this.itens = itens;
	}

}
