package upm.isst.ifactura.dao;

import java.util.List;

import upm.isst.ifactura.model.Notification;

public interface NotificationDAO {
	public Notification create(String correo, String texto, String titulo, String imagen);
	public List<Notification> readAll();
	public List<Notification> readCorreo(String correo);
	public void update(Notification notification);
	public void remove(String correo);
}
