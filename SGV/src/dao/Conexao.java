package dao;

import modelo.*;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class Conexao {
	
	private static SessionFactory fabrica;
	
	private Conexao()
	{
		if(fabrica == null)
			fabrica = new AnnotationConfiguration()
							.addAnnotatedClass(Usuario.class)
							.addAnnotatedClass(Colaborador.class)
							.addAnnotatedClass(Requisito.class)
							.addAnnotatedClass(Oportunidade.class)
							.addAnnotatedClass(Questao.class)
							.buildSessionFactory();
	}
	
	public static SessionFactory obtemFabrica()
	{
		new Conexao();
		return fabrica;
	}

}
