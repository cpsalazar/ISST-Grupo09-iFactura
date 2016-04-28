package upm.isst.ifactura.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import upm.isst.ifactura.model.Notification;

public class NotificationDAOImpl implements NotificationDAO{
	
	private static NotificationDAOImpl instance;
	
	public NotificationDAOImpl(){
	}
	
	public static NotificationDAOImpl getInstance() {
		if (instance == null) {
			instance = new NotificationDAOImpl();
		}
		return instance;
	}
	
	@Override
	public Notification create(String correo, String texto) {
		EntityManager em = EMFService.get().createEntityManager();
		EntityTransaction transaction = em.getTransaction();
		
		Notification notification = new Notification(correo, texto);
		transaction.begin();
		em.persist(notification);
		transaction.commit();
		em.close();
		
		return notification;
	}
	
	@Override
	public List<Notification> readAll() {
		EntityManager em = EMFService.get().createEntityManager();
		
		Query q = em.createQuery("select t from Notification t");

		List<Notification> notificaciones = q.getResultList();
		em.close();
		return notificaciones;
	}
	
	@Override
	public List<Notification> readCorreo(String correo) {
		
		EntityManager em = EMFService.get().createEntityManager();
		
		Query q = em.createQuery("select t from Notification t where t.correo = :correo");
	    q.setParameter("correo", correo);

		List<Notification> notificaciones = q.getResultList();
		em.close();
		return notificaciones;
	}
	
	@Override
	public void update(Notification notification) {
		
		EntityManager em = EMFService.get().createEntityManager();
		
		em.merge(notification);
				
		em.close();
	}
	
	@Override
	public void remove(String correo) {
		
		EntityManager em = EMFService.get().createEntityManager();
		try{
		   Notification notificacion = em.find(Notification.class, correo);
		   em.remove(notificacion);
		} finally{
		   em.close();
		}
	}
}
