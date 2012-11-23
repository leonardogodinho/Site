package dao;

import java.util.ArrayList;

import modelo.Requisito;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class DAORequisito {
	private SessionFactory fabrica;

	public DAORequisito() {
		fabrica = Conexao.obtemFabrica();
	}

	public void cadastrar(Requisito p) throws Exception {
		Session sessao = fabrica.openSession();
		Transaction transacao = sessao.beginTransaction();
		sessao.save(p);
		transacao.commit();
		sessao.flush();
		sessao.close();
	}
	
	public void alterar(Requisito r) throws Exception {
		Session sessao = fabrica.openSession();
		Transaction transacao = sessao.beginTransaction();
		sessao.update(r);
		transacao.commit();
		sessao.flush();
		sessao.close();
	}
	
	public void excluir(Requisito r) throws Exception {
		Session sessao = fabrica.openSession();
		Transaction transacao = sessao.beginTransaction();
		sessao.delete(r);
		transacao.commit();
		sessao.flush();
		sessao.close();
	}
	
	public Requisito consultar(Requisito r) throws Exception
	{
		Session sessao = fabrica.openSession();
		Criteria cr = sessao.createCriteria(Requisito.class)
							.add(Restrictions.eq("id",r.getIdRequisito()));
		r = (Requisito) cr.uniqueResult();
		sessao.flush();
		sessao.close();
		return r;
	}
	
	public boolean verificaID(Requisito r) throws Exception 
	{
		Session sessao = fabrica.openSession();
		Criteria cr = sessao.createCriteria(Requisito.class)
							.add(Restrictions.eq("id", r.getIdRequisito()));
		Requisito u = (Requisito) cr.uniqueResult();
		if(u==null)
			return true;
		else
			return false;	
	}
	
	public ArrayList consultarTodos() throws Exception
	{
		Session sessao = fabrica.openSession();
		Criteria cr = sessao.createCriteria(Requisito.class);
		ArrayList lista = (ArrayList)cr.list();
		sessao.flush();
		sessao.close();
		return lista;
	}
}
