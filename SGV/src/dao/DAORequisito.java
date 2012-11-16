package dao;

import java.util.ArrayList;

import modelo.Requisito;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

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
