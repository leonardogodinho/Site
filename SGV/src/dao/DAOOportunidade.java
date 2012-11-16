package dao;

import modelo.Oportunidade;

import org.hibernate.*;

public class DAOOportunidade {

	private SessionFactory fabrica;
	
	public DAOOportunidade()
	{
		fabrica = Conexao.obtemFabrica();
	}
	
	public void cadastrar(Oportunidade op) throws Exception
	{
		Session sessao = fabrica.openSession();
		Transaction transacao = sessao.beginTransaction();
		sessao.save(op);
		transacao.commit();
		sessao.flush();
		sessao.close();
	}
}
