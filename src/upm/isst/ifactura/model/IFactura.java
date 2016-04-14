package upm.isst.ifactura.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class IFactura implements Serializable {
	
	private static final long serialVersionUID = 01L;
	@Id
	private Long id;
	private int numUsuarios;
	private Date fechaFin;
	private int pujaActual;
	private String ganadorActual;
	
	public IFactura(Long id, int numUsuarios, Date fechaFin, int pujaActual, String ganadorActual) {
		super();
		this.id = id;
		this.numUsuarios = numUsuarios;
		this.fechaFin = fechaFin;
		this.pujaActual = pujaActual;
		this.ganadorActual = ganadorActual;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getNumUsuarios() {
		return numUsuarios;
	}

	public void setNumUsuarios(int numUsuarios) {
		this.numUsuarios = numUsuarios;
	}

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

	public int getPujaActual() {
		return pujaActual;
	}

	public void setPujaActual(int pujaActual) {
		this.pujaActual = pujaActual;
	}

	public String getGanadorActual() {
		return ganadorActual;
	}

	public void setGanadorActual(String ganadorActual) {
		this.ganadorActual = ganadorActual;
	}
	
}
