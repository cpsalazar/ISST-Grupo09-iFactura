package upm.isst.ifactura.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import com.google.appengine.api.datastore.Key;

@Entity
public class IFactura implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Key id;
	
	private String cliente;
	private String dni;
	private String compania;
	private String tipo_factura;
	private String franja;
	private double datos;
	private double telefono;
	boolean pagos;
	
	public IFactura(String cliente, String dni, String compania, String tipo_factura, String franja, double datos, double telefono) {
		this.cliente = cliente;
		this.dni = dni;
		this.compania = compania;
		this.tipo_factura = tipo_factura;
		this.franja = franja;
		this.datos = datos;
		this.telefono = telefono;
		pagos = true;
	}
	
	public Key getId() {
		return id;
	}
	
	public String getCliente() {
		return cliente;
	}
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	
	public String getCompania() {
		return compania;
	}
	public void setCompania(String compania) {
		this.compania = compania;
	}
	
	public String getTipo_factura() {
		return tipo_factura;
	}
	public void setTipo_factura(String tipo_factura) {
		this.tipo_factura = tipo_factura;
	}
	
	public String getFranja() {
		return franja;
	}
	public void setFranja(String franja) {
		this.franja = franja;
	}
	
	public double getDatos() {
		return datos;
	}
	public void setDatos(double datos) {
		this.datos = datos;
	}
	
	public double getTelefono() {
		return telefono;
	}
	public void setTelefono(double telefono) {
		this.telefono = telefono;
	}
	
	public boolean haPagado() {
		return pagos;
	}
	public void setPago(boolean pagos) {
		this.pagos = pagos;
	}
}
