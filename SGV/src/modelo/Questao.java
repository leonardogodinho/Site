package modelo;

import javax.persistence.*;

@Entity
@Table(name = "questao")
@SequenceGenerator(name = "seq_id_questao", sequenceName = "seq_id_questao")
public class Questao {

	@Id
	@Column(name = "id_questao")
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_id_questao")
	private int id_questao;
	
	@Column(name = "ds_enunciado")
	private String enunciado;
	
	@Column(name = "ds_respostaA")
	private String respostaA;
	
	@Column(name = "ds_respostaB")
	private String respostaB;
	
	@Column(name = "ds_respostaC")
	private String respostaC;
	
	@Column(name = "ds_respostaD")
	private String respostaD;
	
	@Column(name = "in_respCerta")
	private String respCerta;

	@Column(name = "in_status")
	private String status;

	@Column(name = "in_tipo")
	private String tipo;
	
	public int getId_questao() {
		return id_questao;
	}

	public void setId_questao(int id_questao) {
		this.id_questao = id_questao;
	}

	public String getEnunciado() {
		return enunciado;
	}

	public void setEnunciado(String enunciado) {
		this.enunciado = enunciado;
	}

	public String getRespostaA() {
		return respostaA;
	}

	public void setRespostaA(String respostaA) {
		this.respostaA = respostaA;
	}

	public String getRespostaB() {
		return respostaB;
	}

	public void setRespostaB(String respostaB) {
		this.respostaB = respostaB;
	}

	public String getRespostaC() {
		return respostaC;
	}

	public void setRespostaC(String respostaC) {
		this.respostaC = respostaC;
	}

	public String getRespostaD() {
		return respostaD;
	}

	public void setRespostaD(String respostaD) {
		this.respostaD = respostaD;
	}

	public String getRespCerta() {
		return respCerta;
	}

	public void setRespCerta(String respCerta) {
		this.respCerta = respCerta;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}	
	
}
