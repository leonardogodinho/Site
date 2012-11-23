package dao;

import modelo.Colaborador;
import modelo.Usuario;

import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

public class DAOColaborador {

	private SessionFactory fabrica;

	public DAOColaborador() {
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

	public void alterar(Colaborador c) throws Exception {
		Session sessao = fabrica.openSession();
		Transaction transacao = sessao.beginTransaction();
		sessao.update(c);
		transacao.commit();
		sessao.flush();
		sessao.close();
	}
	
	public void excluir(Colaborador c) throws Exception {
		Session sessao = fabrica.openSession();
		Transaction transacao = sessao.beginTransaction();
		sessao.delete(c);
		transacao.commit();
		sessao.flush();
		sessao.close();
	}
	
	public Colaborador consultar(Colaborador c) throws Exception
	{
		Session sessao = fabrica.openSession();
		Criteria cr = sessao.createCriteria(Colaborador.class).add(Restrictions.eq("id",c.getIdUsuario()));
		c = (Colaborador) cr.uniqueResult();
		sessao.flush();
		sessao.close();
		return c;
	}
	
	public boolean verificaID(Colaborador c) throws Exception 
	{
		Session sessao = fabrica.openSession();
		Criteria cr = sessao.createCriteria(Usuario.class)
							.add(Restrictions.eq("id", c.getIdUsuario()));
		Usuario u = (Usuario) cr.uniqueResult();
		if(u==null)
			return true;
		else
			return false;	
	}
	
}
