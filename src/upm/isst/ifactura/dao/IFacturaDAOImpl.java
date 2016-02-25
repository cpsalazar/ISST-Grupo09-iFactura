package upm.isst.ifactura.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import upm.isst.ifactura.model.IFactura;

public class IFacturaDAOImpl implements IFacturaDAO {

	private static IFacturaDAOImpl instance;
	
	private IFacturaDAOImpl() {
		
	}
	
	public static IFacturaDAOImpl getInstance(){
		if (instance == null)
			instance = new IFacturaDAOImpl();
		return instance;
	}

	@Override
	public List<IFactura> listIFactura() {
		EntityManager em = EMFService.get().createEntityManager();
		// read the existing entries
		Query q = em.createQuery("select m from IFactura m");
		List<IFactura> ifactura = q.getResultList();
		return ifactura;
	}

	@Override
	public void add(String cliente, String dni, String compania, String tipo_factura, String franja, double datos, double telefono) {
		synchronized (this) {
			EntityManager em = EMFService.get().createEntityManager();
			IFactura ifactura = new IFactura(cliente, dni, compania, tipo_factura, franja, datos, telefono);
			em.persist(ifactura);
			em.close();
		}

	}

	@Override
	public List<IFactura> getIFactura_cliente(String cliente) {
		EntityManager em = EMFService.get().createEntityManager();
		Query q = em
				.createQuery("select t from IFactura t where t.cliente =:cliente");
						q.setParameter("cliente", cliente);
		List<IFactura> ifactura = q.getResultList();
		return ifactura;
	}
	
	@Override
	public List<IFactura> getIFactura_compania(String compania) {
		EntityManager em = EMFService.get().createEntityManager();
		Query q = em
				.createQuery("select t from IFactura t where t.compania =:compania");
						q.setParameter("compania", compania);
		List<IFactura> ifactura = q.getResultList();
		return ifactura;
	}
	
	@Override
	public List<IFactura> getIFactura_tipo_factura(String tipo_factura) {
		EntityManager em = EMFService.get().createEntityManager();
		Query q = em
				.createQuery("select t from IFactura t where t.tipo_factura =:tipo_factura");
						q.setParameter("tipo_factura", tipo_factura);
		List<IFactura> ifactura = q.getResultList();
		return ifactura;
	}
	
	@Override
	public List<IFactura> getIFactura_franja(String franja) {
		EntityManager em = EMFService.get().createEntityManager();
		Query q = em
				.createQuery("select t from IFactura t where t.franja =:franja");
						q.setParameter("franja", franja);
		List<IFactura> ifactura = q.getResultList();
		return ifactura;
	}

	@Override
	public void remove(long id) {
		EntityManager em = EMFService.get().createEntityManager();
		try {
			IFactura ifactura = em.find(IFactura.class, id);
			em.remove(ifactura);
		} finally {
			em.close();
		}
	}

	@Override
	public List<String> getClientes() {
		EntityManager em = EMFService.get().createEntityManager();
		Query q = em
		.createQuery("select distinct t.cliente from IFactura t");
		List<String> clientes = q.getResultList();
		return clientes;
	}

}
