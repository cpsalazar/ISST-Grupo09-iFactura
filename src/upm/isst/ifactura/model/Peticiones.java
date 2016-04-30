package upm.isst.ifactura.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Peticiones implements Serializable{
	
	private static final long serialVersionUID = 01L;
	@Id 
	private String correo; //el que envía la petición.
	private String peticion; //la peticion en si.
	
	public Peticiones(String correo, String peticion) {
		super();
		this.correo = correo;
		this.peticion = peticion;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getPeticion() {
		return peticion;
	}

	public void setPeticion(String peticion) {
		this.peticion = peticion;
	}
	
	
}
