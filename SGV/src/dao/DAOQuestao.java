package dao;

import java.util.ArrayList;

import modelo.Questao;

import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

public class DAOQuestao {
	private SessionFactory fabrica;

	public DAOQuestao() {
		fabrica = Conexao.obtemFabrica();
	}

	public void cadastrar(Questao q) throws Exception {
		Session sessao = fabrica.openSession();
		Transaction transacao = sessao.beginTransaction();
		sessao.save(q);
		transacao.commit();
		sessao.flush();
		sessao.close();
	}
	
	public ArrayList consultarTodas() throws Exception
	{
		Session sessao = fabrica.openSession();
		Criteria cr = sessao.createCriteria(Questao.class);
		ArrayList lista = (ArrayList) cr.list();
		sessao.flush();
		sessao.close();
		return lista;
	}
}
