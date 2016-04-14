package upm.isst.ifactura.dao;

import java.util.List;

import upm.isst.ifactura.model.IFactura;

public interface IFacturaDAO {
	
	public IFactura create (Long id, int numUsuarios, String fechaFin, int pujaActual, String ganadorActual);
	public List<IFactura> readIFactura();
	public List<IFactura> readIFactura_usuarios(int numUsuarios);
	public List<IFactura> readIFactura_compania(String ganadorActual);
	public List<IFactura> readIFactura_puja(int pujaActual);
	public List<IFactura> readIFactura_fecha(String fechaFin);
	public void update (IFactura subasta);
	public void delete (IFactura subasta);
}