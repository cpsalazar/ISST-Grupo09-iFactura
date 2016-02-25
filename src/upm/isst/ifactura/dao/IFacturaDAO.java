package upm.isst.ifactura.dao;

import java.util.List;
import upm.isst.ifactura.model.IFactura;

public interface IFacturaDAO {
	public List<IFactura> listIFactura();
	public void add (String cliente, String dni, String compania, String tipo_factura, String franja, double datos, double telefono);
	public List<IFactura> getIFactura(String cliente);
	public void remove (long id);
	public List<String> getClientes();
}