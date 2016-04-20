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
	private String compa�ia;
	
	public Users(String correo, String compa�ia) {
		super();
		this.correo = correo;
		this.compa�ia = compa�ia;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getCompa�ia() {
		return compa�ia;
	}

	public void setCompa�ia(String compa�ia) {
		this.compa�ia = compa�ia;
	}
	
	
}
