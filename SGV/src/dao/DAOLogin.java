package dao;

import modelo.*;

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
	
	public boolean logar(Usuario u) throws Exception
	{
		Session sessao = fabrica.openSession();
		Criteria cr = sessao.createCriteria(Usuario.class)
							.add(Restrictions.eq("cpf", u.getCpf()))
							.add(Restrictions.eq("senha",u.getSenha()));
		u = (Usuario) cr.uniqueResult();
		if(u==null)
			return false;
		else
			return true;			
	}
}
