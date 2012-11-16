package dao;

import modelo.Colaborador;

import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

public class DAOLogin {
	private SessionFactory fabrica;

	public DAOLogin() {
		fabrica = Conexao.obtemFabrica();
	}

	public void cadastrar(Colaborador c) throws Exception {
		Session sessao = fabrica.openSession();
		Transaction transacao = sessao.beginTransaction();
		sessao.save(c);
		transacao.commit();
		sessao.flush();
		sessao.close();
	}
	
	public boolean logar(Colaborador c) throws Exception
	{
		Session sessao = fabrica.openSession();
		Criteria cr = sessao.createCriteria(Colaborador.class)
							.add(Restrictions.eq("cpf", c.getCpf()))
							.add(Restrictions.eq("senha",c.getSenha()));
		c = (Colaborador) cr.uniqueResult();
		if(c==null)
			return false;
		else
			return true;			
		
	}
}
