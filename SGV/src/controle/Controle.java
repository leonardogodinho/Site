package controle;

import java.io.IOException;
import java.text.*;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import dao.*;

import modelo.*;

public class Controle extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {
	static final long serialVersionUID = 1L;

	public Controle() {
		super();
	}

	protected void doGet(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException {
		
		String tela = req.getParameter("tela");
		
		if(tela.equals("principal"))
		{
			String comando = req.getParameter("comando");
			
			if(comando.equals("TelaOportunidades"))
			{
				try
				{
					DAORequisito daoR = new DAORequisito();
					ArrayList requisitos = daoR.consultarTodos();
					
					HttpSession sessao = req.getSession();
					sessao.setAttribute("requisitos", requisitos);
					
					RequestDispatcher rd = req.getRequestDispatcher("/visao/oportunidades.jsp");
					rd.forward(req, res);
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
				
			}
			if(comando.equals("TelaRequisitos"))
			{
				RequestDispatcher rd = req.getRequestDispatcher("/visao/requisito.jsp");
				rd.forward(req, res);				
			}
			if(comando.equals("TelaQuestoes"))
			{
				this.carregaQuestoes(req,res);								
			}
		}
		
		if(tela.equals("Login"))
		{
			String comando = req.getParameter("comando");
			if(comando.equals("Entrar"))
			{
				int cpf = Integer.parseInt(req.getParameter("usuario"));
				String senha = req.getParameter("senha");
				try
				{
					Colaborador c = new Colaborador();
					c.setCpf(cpf);
					c.setSenha(senha);
					DAOLogin daoL = new DAOLogin();
					if(daoL.logar(c))
					{
						RequestDispatcher rd = req.getRequestDispatcher("/visao/principal.jsp");
						rd.forward(req, res);
					}
					else
					{
						JOptionPane.showMessageDialog(null, "Login inválido!");
						RequestDispatcher rd = req.getRequestDispatcher("/visao/login.jsp");
						rd.forward(req, res);
					}
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
		}
		
		if(tela.equals("TelaOportunidade"))
		{
			String titulo = req.getParameter("titulo");
			int cargaHoraria = Integer.parseInt(req.getParameter("cargaHoraria"));
			String areaAtuacao = req.getParameter("areaAtuacao");
			double salario = Double.parseDouble(req.getParameter("salario"));
			String descricao = req.getParameter("descricao");
			Date encerramento;
            try
            {
            	encerramento = this.formataData(req.getParameter("dataEncerramento"));
            }
            catch(Exception ex)
            {   encerramento = null;	}
			
            String vt = req.getParameter("vt") != null ? req.getParameter("vt") : "";
			String planoSaude = req.getParameter("planoSaude") != null ? req.getParameter("planoSaude") : "";
			String cestaBasica = req.getParameter("cestaBasica") != null ? req.getParameter("cestaBasica") : "";
			String pl = req.getParameter("pl") != null ? req.getParameter("pl") : "";
			String vr = req.getParameter("vr") != null ? req.getParameter("vr") : "";
			String planoOdonto = req.getParameter("planoOdonto") != null ? req.getParameter("planoOdonto") : "";
			String beneficios = vt + ";"+ planoSaude + ";"+ cestaBasica + ";" + pl + ";"+ vr + ";"+ planoOdonto;
			
			String comando = req.getParameter("comando");
			if(comando.equals("Publicar Vaga"))
			{
				Oportunidade op = new Oportunidade();
				op.setTitulo(titulo);
				op.setCargaHoraria(cargaHoraria);
				op.setAreaAtuacao(areaAtuacao);
				op.setSalario(salario);
				op.setDescricao(descricao);
				op.setDataEncerramento(encerramento);
				op.setBeneficios(beneficios.trim());
				
				Requisito r = new Requisito();
				if(req.getParameter("requisito").equals(""))
					r.setId_requisito(0);
				else
					r.setId_requisito(Integer.parseInt(req.getParameter("requisito")));
				//op.setR(r);
				
				try
				{
					DAOOportunidade daoO = new DAOOportunidade();					
					daoO.cadastrar(op);
					JOptionPane.showMessageDialog(null,"Oportunidade cadastrada com sucesso!");
					RequestDispatcher rd = req.getRequestDispatcher("/visao/oportunidades.jsp");
					rd.forward(req, res);
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
		}
		if(tela.equals("TelaRequisito"))
		{
			String nome = req.getParameter("nome");
			String descricao = req.getParameter("descricao");
			
			String comando = req.getParameter("comando");
			if(comando.equals("Cadastrar"))
			{
				Requisito r = new Requisito();
				r.setNome(nome);
				r.setDescricao(descricao);
				try
				{
					DAORequisito daoR = new DAORequisito();
					daoR.cadastrar(r);
					JOptionPane.showMessageDialog(null,"Requisito cadastrado com sucesso!");
					RequestDispatcher rd = req.getRequestDispatcher("/visao/requisito.jsp");
					rd.forward(req, res);
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
		}
		if(tela.equals("TelaQuestao"))
		{
			String enunciado = req.getParameter("enunciado");
			String respostaA = req.getParameter("respostaA");
			String respostaB = req.getParameter("respostaB");
			String respostaC = req.getParameter("respostaC");
			String respostaD = req.getParameter("respostaD");
			String respCerta = req.getParameter("respCerta");
			String status = req.getParameter("status");
			
			String comando = req.getParameter("comando");
			if(comando.equals("Cadastrar"))
			{
				Questao q = new Questao();
				q.setEnunciado(enunciado);
				q.setRespostaA(respostaA);
				q.setRespostaB(respostaB);
				q.setRespostaC(respostaC);
				q.setRespostaD(respostaD);
				q.setRespCerta(respCerta);
				q.setStatus(status);
				try
				{
					DAOQuestao daoQ = new DAOQuestao();
					daoQ.cadastrar(q);
					JOptionPane.showMessageDialog(null,"Questão cadastrada com sucesso!");
					this.carregaQuestoes(req, res);
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
		}
	}

	private void carregaQuestoes(HttpServletRequest req,
			HttpServletResponse res) {
		try
		{
			DAOQuestao daoQ = new DAOQuestao();
			ArrayList questoes = daoQ.consultarTodas();
			HttpSession sessao = req.getSession();
			sessao.setAttribute("listaQuestoes", questoes);
			
			RequestDispatcher rd = req.getRequestDispatcher("/visao/questao.jsp");
			rd.forward(req, res);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}		
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	public Date formataData(String data) throws Exception {   
        if (data == null || data.equals(""))  
            return null;  
          
        Date date = null;  
        try {  
            DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
            date = (java.util.Date)formatter.parse(data);  
        } catch (ParseException e) {              
            throw e;  
        }  
        return date;  
    }  
}