package upm.isst.ifactura;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import upm.isst.ifactura.dao.FacturaTelefonoDao;
import upm.isst.ifactura.dao.FacturaTelefonoDaoImpl;
import upm.isst.ifactura.model.FacturaTelefono;


@SuppressWarnings("serial")
public class ISST_G09_InvestigacionServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		resp.setCharacterEncoding("UTF-8");
		
		//B�SQUEDA DE PATRONES
		
		req.getSession().setAttribute("DatosdeMas", null);
		req.getSession().setAttribute("VozdeMas", null);
		req.getSession().setAttribute("Tarde", null);
		req.getSession().setAttribute("Ma�anas", null);
		
		FacturaTelefonoDao dao = FacturaTelefonoDaoImpl.getInstance();
		
		List<FacturaTelefono> facturas = dao.readFacturas();
		
		double DatosMedia = 0;
		double VozMedia = 0;
		
		double totaldatos = 0;
		double totalvoz = 0;
		double totaltarde = 0;
		double totalma�anas = 0;
		
		System.out.println(facturas.size());
		
		for (FacturaTelefono fac: facturas){
			
			if (fac.getDatosConsumidos() > fac.getDatosContradados()){
				DatosMedia += fac.getDatosConsumidos();
				totaldatos++;
			}
			if (fac.getVozConsumida() > fac.getVozContradada()){
				VozMedia += fac.getVozConsumida();
				totalvoz++;
			}
			if (fac.getEsTarde()){
				totaltarde++;
			}
			if (!fac.getEsTarde()){
				totalma�anas++;
		}
	
		}
		DatosMedia = DatosMedia/totaldatos;
		VozMedia = VozMedia/totalvoz;
		
		System.out.println(totaldatos);
		System.out.println(totalvoz);
		System.out.println(totaltarde);
		System.out.println(totalma�anas);
		
		if (totaldatos > facturas.size()/20){
			String texto = "Se han detectado " + totaldatos + " clientes que consumen  m�s datos de los contratados, y que de media consumen " + DatosMedia + " MB.";
			req.getSession().setAttribute("DatosdeMas", texto);
		}
		if (totalvoz > facturas.size()/20){
			String texto = "Se han detectado " + totalvoz + " clientes que consumen  m�s minutos de los contratados, y que de media consumen " + VozMedia + " minutos.";
			req.getSession().setAttribute("VozdeMas", texto);
		}
		if (totaltarde > facturas.size()/20){
			String texto = "Se han detectado " + totaltarde + " clientes que realizan llamadas exclusivamente por la tarde.";
			req.getSession().setAttribute("Tarde", texto);
		}
		if (totalma�anas > facturas.size()/20){
			String texto = "Se han detectado " + totalma�anas + " clientes que realizan llamadas exclusivamente por la ma�ana.";
			req.getSession().setAttribute("Ma�anas", texto);
		}
				
		resp.sendRedirect("/pages/investigacion.jsp");
	}
}