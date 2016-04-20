package upm.isst.ifactura.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Users implements Serializable{
	
	private static final long serialVersionUID = 01L;
	@Id @OneToMany
	private String correo;
	private String compañia;
	
	public Users(String correo, String compañia) {
		super();
		this.correo = correo;
		this.compañia = compañia;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getCompañia() {
		return compañia;
	}

	public void setCompañia(String compañia) {
		this.compañia = compañia;
	}
	
	
}
