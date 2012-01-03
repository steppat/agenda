package br.com.caelum.agenda.dao;

import java.util.List;

import org.hibernate.Session;

import br.com.caelum.agenda.Contato;

public class ContatoDao {

	private final Session session;

	public ContatoDao(Session session) {
		this.session = session;
	}

	public List<Contato> listar() {
		return session.createQuery(" from Contato ").list();
	}

	public void salvar(Contato contato) {
		session.save(contato);
	}

	public Contato buscarPorId(Integer id) {
		return (Contato) session.load(Contato.class, id);
	}

	public void deleta(Contato contato) {
		session.delete(contato);
	}

	public void altera(Contato contato) {
		session.update(contato);
	}

}
