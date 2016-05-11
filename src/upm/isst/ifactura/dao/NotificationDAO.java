package upm.isst.ifactura.dao;

import java.util.List;

import upm.isst.ifactura.model.Notification;

public interface NotificationDAO {
	public Notification create(String correo, String texto, String titulo, String imagen);
	public List<Notification> readAll();
	public Notification readID(String texto) throws Exception;
	public List<Notification> readCorreo(String correo);
	public void update(Notification notification);
	public void remove(String correo) throws Exception;
}
