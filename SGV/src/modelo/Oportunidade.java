

package modelo;

import java.util.Date;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "oportunidade")
@SequenceGenerator(name="seq_id_oportunidade", sequenceName="seq_id_oportunidade")
public class Oportunidade {
	
	@Id
	@Column(name="id_oportunidade")
	@GeneratedValue(strategy=GenerationType.AUTO, generator="seq_id_oportunidade")
	private int id_oportunidade;
	
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
	@JoinTable(name="OporReq"
			, joinColumns={@JoinColumn(name = "id_oportunidade")}
			, inverseJoinColumns={@JoinColumn(name="id_requisito")})
	private Set<Requisito> requisitos;

	public Date getDataEncerramento() {
		return dataEncerramento;
	}

	public void setDataEncerramento(Date dataEncerramento) {
		this.dataEncerramento = dataEncerramento;
	}

	public int getId_oportunidade() {
		return id_oportunidade;
	}

	public void setId_oportunidade(int id_oportunidade) {
		this.id_oportunidade = id_oportunidade;
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

	public Set<Requisito> getRequisitos() {
		return requisitos;
	}

	public void setRequisitos(Set<Requisito> requisitos) {
		this.requisitos = requisitos;
	}

	/*public int getId_perfil() {
		return id_perfil;
	}

	public void setId_perfil(int id_perfil) {
		this.id_perfil = id_perfil;
	}*/

}
