package controle;

import java.io.IOException;
import java.text.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Random;

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
		
		if(tela.equals("Login"))
		{
			this.carregaLogin(req, res);
		}
		
		if(tela.equals("principal"))
		{
			this.carregaTelaPrincipal(req, res);
		}
		
		if(tela.equals("TelaOportunidade"))
		{
			this.carregaTelaOportunidade(req, res);
		}
		
		if(tela.equals("TelaRequisito"))
		{
			this.carregaTelaRequisito(req, res);
		}
		
		if(tela.equals("TelaQuestao"))
		{
			this.carregaTelaQuestoes(req, res);
		}
		
		if(tela.equals("TelaUsuario"))
		{
			this.carregaTelaUsuario(req, res);
		}
		
		if(tela.equals("TelaColaborador"))
		{
			this.carregaTelaColaborador(req, res);
		}
	}
	
	private void carregaLogin(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException
	{
		String comando = req.getParameter("comando");
		if(comando.equals("Entrar"))
		{
			try
			{
				String usuario = req.getParameter("usuario");
				String senha = req.getParameter("senha");
				if(usuario.equals("admin") && senha.equals("admin"))
				{
					req.setAttribute("userADM", "admin");
					RequestDispatcher rd = req.getRequestDispatcher("/visao/principal.jsp");
					rd.forward(req, res);
				}
				else
				{
					int cpf = Integer.parseInt(usuario);
					Colaborador c = new Colaborador();
					c.setCpf(cpf);
					c.setSenha(senha);
					DAOLogin daoL = new DAOLogin();
					if(daoL.logar(c))
					{
						req.setAttribute("user", c);
						RequestDispatcher rd = req.getRequestDispatcher("/visao/principal.jsp");
						rd.forward(req, res);
					}
					else
					{
						JOptionPane.showMessageDialog(null, "Login inv�lido!");
						RequestDispatcher rd = req.getRequestDispatcher("/visao/login.jsp");
						rd.forward(req, res);
					}
				}
			}
			catch(NumberFormatException ex)
			{
				JOptionPane.showMessageDialog(null, "Login inv�lido!");
				RequestDispatcher rd = req.getRequestDispatcher("/visao/login.jsp");
				rd.forward(req, res);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}			
		}
	}
	
	private void carregaTelaPrincipal(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException
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
				sessao.setAttribute("itens", null);					
				
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
		if(comando.equals("TelaUsuarios"))
		{
			RequestDispatcher rd = req.getRequestDispatcher("/visao/usuario.jsp");
			rd.forward(req, res);				
		}
		if(comando.equals("TelaColaboradores"))
		{
			RequestDispatcher rd = req.getRequestDispatcher("/visao/colaborador.jsp");
			rd.forward(req, res);				
		}
	}
	
	private void carregaTelaOportunidade(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException
	{

		Oportunidade op = new Oportunidade();
		
		int id = Integer.parseInt(req.getParameter("id"));
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
		
		op.setIdOportunidade(id);
		op.setTitulo(titulo);
		op.setCargaHoraria(cargaHoraria);
		op.setAreaAtuacao(areaAtuacao);
		op.setSalario(salario);
		op.setDescricao(descricao);
		op.setDataEncerramento(encerramento);
		op.setBeneficios(beneficios.trim());	
		
		String comando = req.getParameter("comando");
		if(comando.equals("Adicionar"))
		{
			HttpSession sessao = (HttpSession)req.getSession();
			
			Requisito r = new Requisito();
			r.setIdRequisito(Integer.parseInt(req.getParameter("requisito")));
			//r.setDescricao(sessao.getAttribute("nomeRequisito").toString());
			
			ArrayList itens = (ArrayList)sessao.getAttribute("itens");
			
			ItemRequisito i = new ItemRequisito();
			//Random ram = new Random();
			//i.setIdItem(ram.nextInt());
			i.setQuantidade(Integer.parseInt(req.getParameter("quantidade")));
			i.setR(r);
			
			if(itens==null)
			{
				itens = new ArrayList();					
			}
			try
			{
				//DAOItemRequisito daoI = new DAOItemRequisito();
				//daoI.cadastrar(i);
				itens.add(i);
				sessao.setAttribute("itens", itens);
				sessao.setAttribute("oportunidade", op);
				RequestDispatcher rd = req.getRequestDispatcher("/visao/oportunidades.jsp");
				rd.forward(req, res);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
		if(comando.equals("Remover"))
		{
			Requisito r = new Requisito();
			r.setNome(req.getParameter("requisito"));
			
			HttpSession sessao = (HttpSession)req.getSession();
			
			ArrayList itens = (ArrayList)sessao.getAttribute("itens");
			
			ItemRequisito i = new ItemRequisito();
			i.setQuantidade(Integer.parseInt(req.getParameter("quantidade")));
			i.setR(r);
			
			if(itens==null)
			{
				itens = new ArrayList();					
			}
			
			itens.remove(i);
			sessao.setAttribute("itens", itens);
			sessao.setAttribute("oportunidade", op);
			RequestDispatcher rd = req.getRequestDispatcher("/visao/oportunidades.jsp");
			rd.forward(req, res);
		}
		
		if(comando.equals("Cadastrar"))
		{
			HttpSession sessao = (HttpSession)req.getSession();				
			op.setItens(new HashSet((ArrayList)sessao.getAttribute("itens")));
			
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
	
	private void carregaTelaRequisito(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException
	{

		String id = req.getParameter("id");
		String nome = req.getParameter("nome");
		String descricao = req.getParameter("descricao");
		
		String comando = req.getParameter("comando");
		if(comando.equals("Cadastrar") || comando.equals("Alterar"))
		{
			Requisito r = new Requisito();
			r.setIdRequisito(Integer.parseInt(id));
			r.setNome(nome);
			r.setDescricao(descricao);
			try
			{
				DAORequisito daoR = new DAORequisito();
				if(comando.equals("Cadastrar"))
				{
					if(daoR.verificaID(r))
					{
						daoR.cadastrar(r);
						JOptionPane.showMessageDialog(null,"Requisito cadastrado com sucesso!");
					}
					else
						JOptionPane.showMessageDialog(null,"O ID " + id + " j� est� cadastrado! Escolha outro ID!");
				}
				else
				{
					daoR.alterar(r);
					JOptionPane.showMessageDialog(null,"Requisito alterado com sucesso!");
				}
				RequestDispatcher rd = req.getRequestDispatcher("/visao/requisito.jsp");
				rd.forward(req, res);						
				
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
		if(comando.equals("Excluir"))
		{
			try
			{
				Requisito r = new Requisito();
				r.setIdRequisito(Integer.parseInt(id));
				
				DAORequisito daoR = new DAORequisito();
				daoR.excluir(r);	
				JOptionPane.showMessageDialog(null,"Requisito removido com sucesso!");
				RequestDispatcher rd = req.getRequestDispatcher("/visao/requisito.jsp");
				rd.forward(req, res);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
		if(comando.equals("Consultar"))
		{
			try
			{
				Requisito r = new Requisito();
				r.setIdRequisito(Integer.parseInt(id));
				
				DAORequisito daoR = new DAORequisito();
				r = daoR.consultar(r);
				req.setAttribute("r", r);
				RequestDispatcher rd = req.getRequestDispatcher("/visao/requisito.jsp");
				rd.forward(req, res);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
	}
	
	private void carregaTelaQuestoes(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException
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
				JOptionPane.showMessageDialog(null,"Quest�o cadastrada com sucesso!");
				this.carregaQuestoes(req, res);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
	}
	
	private void carregaTelaUsuario(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException
	{

		String id = req.getParameter("id");
		String cpf = req.getParameter("cpf");
		String nome = req.getParameter("nome");
		String depto = req.getParameter("departamento");
		String email = req.getParameter("email");
		String senha = req.getParameter("senha");
		String tipo = req.getParameter("tipoUsuario");
		
		String comando = req.getParameter("comando");
		if(comando.equals("Cadastrar") || comando.equals("Alterar"))
		{
			try
			{
				Usuario u = new Usuario();
				u.setIdUsuario(Integer.parseInt(id));
				u.setCpf(Integer.parseInt(cpf));
				u.setNome(nome);
				u.setDepto(depto);
				u.setEmail(email);
				u.setSenha(senha);
				u.setTipo(tipo);
				
				DAOUsuario daoU = new DAOUsuario();
				if(comando.equals("Cadastrar"))
				{
					if(daoU.verificaID(u))
					{
						daoU.cadastrar(u);
						JOptionPane.showMessageDialog(null,"Usu�rio cadastrado com sucesso!");
					}
					else
						JOptionPane.showMessageDialog(null,"O ID " + id + " j� est� cadastrado! Escolha outro ID!");
				}
				else
				{
					daoU.alterar(u);
					JOptionPane.showMessageDialog(null,"Usu�rio alterado com sucesso!");
				}
				RequestDispatcher rd = req.getRequestDispatcher("/visao/usuario.jsp");
				rd.forward(req, res);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
		if(comando.equals("Excluir"))
		{
			try
			{
				Usuario u = new Usuario();
				u.setIdUsuario(Integer.parseInt(id));
				
				DAOUsuario daoU = new DAOUsuario();
				daoU.excluir(u);	
				JOptionPane.showMessageDialog(null,"Usu�rio removido com sucesso!");
				RequestDispatcher rd = req.getRequestDispatcher("/visao/usuario.jsp");
				rd.forward(req, res);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
		if(comando.equals("Consultar"))
		{
			try
			{
				Usuario u = new Usuario();
				u.setIdUsuario(Integer.parseInt(id));
				
				DAOUsuario daoU = new DAOUsuario();
				u = daoU.consultar(u);
				req.setAttribute("u", u);
				RequestDispatcher rd = req.getRequestDispatcher("/visao/usuario.jsp");
				rd.forward(req, res);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
	}
	
	private void carregaTelaColaborador(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException
	{

		String id = req.getParameter("id");
		String cpf = req.getParameter("cpf");
		String nome = req.getParameter("nome");
		String depto = req.getParameter("departamento");
		String email = req.getParameter("email");
		String senha = req.getParameter("senha");
		String tipo = req.getParameter("tipoUsuario");
		String status = req.getParameter("status");
		
		String comando = req.getParameter("comando");
		if(comando.equals("Cadastrar") || comando.equals("Alterar"))
		{
			try
			{
				Colaborador c = new Colaborador();
				c.setIdUsuario(Integer.parseInt(id));
				c.setCpf(Integer.parseInt(cpf));
				c.setNome(nome);
				c.setDepto(depto);
				c.setEmail(email);
				c.setSenha(senha);
				c.setTipo(tipo);
				c.setStatus(status);
				
				DAOColaborador daoC = new DAOColaborador();
				if(comando.equals("Cadastrar"))
				{
					if(daoC.verificaID(c))
					{
						daoC.cadastrar(c);
						JOptionPane.showMessageDialog(null,"Colaborador cadastrado com sucesso!");
					}
					else
						JOptionPane.showMessageDialog(null,"O ID " + id + " j� est� cadastrado! Escolha outro ID!");
				}
				else
				{
					daoC.alterar(c);
					JOptionPane.showMessageDialog(null,"Colaborador alterado com sucesso!");
				}
				RequestDispatcher rd = req.getRequestDispatcher("/visao/colaborador.jsp");
				rd.forward(req, res);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
		if(comando.equals("Excluir"))
		{
			try
			{
				Colaborador c = new Colaborador();
				c.setIdUsuario(Integer.parseInt(id));
				
				DAOColaborador daoC = new DAOColaborador();
				daoC.excluir(c);	
				JOptionPane.showMessageDialog(null,"Colaborador removido com sucesso!");
				RequestDispatcher rd = req.getRequestDispatcher("/visao/colaborador.jsp");
				rd.forward(req, res);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
		if(comando.equals("Consultar"))
		{
			try
			{
				Colaborador c = new Colaborador();
				c.setIdUsuario(Integer.parseInt(id));
				
				DAOColaborador daoC = new DAOColaborador();
				c = daoC.consultar(c);
				req.setAttribute("c", c);
				RequestDispatcher rd = req.getRequestDispatcher("/visao/colaborador.jsp");
				rd.forward(req, res);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
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
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}