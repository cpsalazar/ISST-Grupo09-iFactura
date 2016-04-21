package upm.isst.ifactura.dao;

import java.util.Date;
import java.util.List;

import upm.isst.ifactura.model.IFactura;

public interface IFacturaDAO {
	
	public IFactura create(Long id, int numUsuarios, long fechaFin, double pujaActual, String ganadorActual, List<String> participantes);
	public List<IFactura> readIFactura();
	public List<IFactura> readIFactura_usuarios(int numUsuarios);
	public List<IFactura> readIFactura_compania(String ganadorActual);
	public List<IFactura> readIFactura_puja(double pujaActual);
	public List<IFactura> readIFactura_fecha(long fechaFin);
	public List<IFactura> readIFactura_id(Long id);
	public void update (IFactura subasta);
	public void delete (IFactura subasta);
}