package dao;

import modelo.ItemRequisito;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class DAOItemRequisito {
	private SessionFactory fabrica;

	public DAOItemRequisito() {
		fabrica = Conexao.obtemFabrica();
	}

	public void cadastrar(ItemRequisito i) throws Exception {
		Session sessao = fabrica.openSession();
		Transaction transacao = sessao.beginTransaction();
		sessao.save(i);
		transacao.commit();
		sessao.flush();
		sessao.close();
	}
	
}
