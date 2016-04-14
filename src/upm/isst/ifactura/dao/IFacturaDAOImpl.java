package upm.isst.ifactura.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import upm.isst.ifactura.model.IFactura;

public class IFacturaDAOImpl implements IFacturaDAO {

	private static IFacturaDAOImpl instance;
	
	private IFacturaDAOImpl() {
	}
	
	public static IFacturaDAOImpl getInstance() {
		if (instance == null)
			instance = new IFacturaDAOImpl();
		return instance;
	}
	
	@Override
	public IFactura create(Long id, int numUsuarios, Date fechaFin, int pujaActual,
			String ganadorActual) {
		
		EntityManager em = EMFService.get().createEntityManager();
		EntityTransaction transaction = em.getTransaction();
		
		IFactura subasta = new IFactura(id, numUsuarios, fechaFin, pujaActual, ganadorActual);
		transaction.begin();
		em.persist(subasta);
		transaction.commit();
		em.close();
		
		return subasta;
	}

	@Override
	public List<IFactura> readIFactura() {
		
		EntityManager em = EMFService.get().createEntityManager();
		
		Query q = em.createQuery("select t from IFactura t");

		List<IFactura> subastas = q.getResultList();
		em.close();
		return subastas;
	}

	@Override
	public List<IFactura> readIFactura_usuarios(int numUsuarios) {
		
		EntityManager em = EMFService.get().createEntityManager();
		
		Query q = em.createQuery("select t from IFactura t where t.numUsuarios = :numUsuarios");
	    q.setParameter("numUsuarios", numUsuarios);

		List<IFactura> subastas = q.getResultList();
		em.close();
		return subastas;
	}

	@Override
	public List<IFactura> readIFactura_compania(String ganadorActual) {

		EntityManager em = EMFService.get().createEntityManager();
		
		Query q = em.createQuery("select t from IFactura t where t.ganadorActual = :ganadorActual");
	    q.setParameter("ganadorActual", ganadorActual);

		List<IFactura> subastas = q.getResultList();
		em.close();
		return subastas;
	}

	@Override
	public List<IFactura> readIFactura_puja(int pujaActual) {

		EntityManager em = EMFService.get().createEntityManager();
		
		Query q = em.createQuery("select t from IFactura t where t.pujaActual = :pujaActual");
	    q.setParameter("pujaActual", pujaActual);

		List<IFactura> subastas = q.getResultList();
		em.close();
		return subastas;
	}

	@Override
	public List<IFactura> readIFactura_fecha(Date fechaFin) {

		EntityManager em = EMFService.get().createEntityManager();
		
		Query q = em.createQuery("select t from IFactura t where t.fechaFin = :fechaFin");
	    q.setParameter("fechaFin", fechaFin);

		List<IFactura> subastas = q.getResultList();
		em.close();
		return subastas;
	}

	@Override
	public void update(IFactura subasta) {
		
		EntityManager em = EMFService.get().createEntityManager();
		em.merge(subasta);
	}

	@Override
	public void delete(IFactura subasta) {
		
		EntityManager em = EMFService.get().createEntityManager();
		em.remove(subasta);
	}
}
