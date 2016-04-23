package upm.isst.ifactura.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Notification implements Serializable{
	private static final long serialVersionUID = 01L;
	@Id
	private String correo;
	private String texto;
	
	public Notification(String correo, String texto) {
		super();
		this.correo = correo;
		this.texto = texto;
	}
	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto=texto;
	}
}
