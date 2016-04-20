package upm.isst.ifactura.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import upm.isst.ifactura.model.IFactura;
import upm.isst.ifactura.model.Users;

public class UsersDAOImpl implements UsersDAO {
	
	private static UsersDAOImpl instance;

	public UsersDAOImpl() {
	}
	
	public static UsersDAOImpl getInstance(){
		if (instance == null)
			instance = new UsersDAOImpl();
		return instance;
	}
	
	@Override
	public Users create(String correo, String compa�ia) {
		
		EntityManager em = EMFService.get().createEntityManager();
		EntityTransaction transaction = em.getTransaction();
		
		Users user = new Users(correo, compa�ia);
		transaction.begin();
		em.persist(user);
		transaction.commit();
		em.close();
		
		return user;
	}

	@Override
	public List<Users> readAll() {
		
		EntityManager em = EMFService.get().createEntityManager();
		
		Query q = em.createQuery("select t from Users t");

		List<Users> usuarios = q.getResultList();
		em.close();
		return usuarios;
	}

	@Override
	public List<Users> readCorreo(String correo) {
		
		EntityManager em = EMFService.get().createEntityManager();
		
		Query q = em.createQuery("select t from Users t where t.correo = :correo");
	    q.setParameter("correo", correo);

		List<Users> usuarios = q.getResultList();
		em.close();
		return usuarios;
	}

	@Override
	public List<Users> readCompa�ia(String compa�ia) {
		
		EntityManager em = EMFService.get().createEntityManager();
		
		Query q = em.createQuery("select t from Users t where t.compa�ia = :compa�ia");
	    q.setParameter("compa�ia", compa�ia);

		List<Users> usuarios = q.getResultList();
		em.close();
		return usuarios;
	}

	@Override
	public void update(Users usuario) {
		
		EntityManager em = EMFService.get().createEntityManager();
		
		em.merge(usuario);
				
		em.close();
	}

	@Override
	public void remove(Users usuario) {
		
		EntityManager em = EMFService.get().createEntityManager();
		
		em.remove(usuario);
				
		em.close();
	}

}
