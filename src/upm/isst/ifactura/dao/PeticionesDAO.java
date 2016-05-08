package upm.isst.ifactura.dao;

import java.util.List;

import upm.isst.ifactura.model.Peticiones;

public interface PeticionesDAO {
	public Peticiones create(String correo, String compania, String peticion);
	public List<Peticiones> readAll();
	public List<Peticiones> readCorreo(String correo) throws Exception;
	public List<Peticiones> readCompania(String compania);
	public void update(Peticiones peticion);
	public void remove(String correo);
}
