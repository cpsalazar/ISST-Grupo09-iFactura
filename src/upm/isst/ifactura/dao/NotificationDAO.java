package upm.isst.ifactura.dao;

import java.util.List;

import upm.isst.ifactura.model.Notification;

public interface NotificationDAO {
	public Notification create(String correo, String texto);
	public List<Notification> readAll();
	public List<Notification> readCorreo(String correo);
	public void update(Notification notification);
	public void remove(Notification notification);
}
