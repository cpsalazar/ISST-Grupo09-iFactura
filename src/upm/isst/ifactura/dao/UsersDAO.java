package upm.isst.ifactura.dao;

import java.util.List;

import upm.isst.ifactura.model.Users;


public interface UsersDAO {
	
	public Users create(String correo, String compania);
	public List<Users> readAll();
	public List<Users> readCorreo(String correo);
	public List<Users> readCompania(String compania);
	public void update(Users usuario);
	public void remove(Users usuario);
}
