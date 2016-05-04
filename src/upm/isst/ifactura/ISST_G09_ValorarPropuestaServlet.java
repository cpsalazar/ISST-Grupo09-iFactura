package upm.isst.ifactura;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import upm.isst.ifactura.dao.NotificationDAO;
import upm.isst.ifactura.dao.NotificationDAOImpl;
import upm.isst.ifactura.dao.PeticionesDAO;
import upm.isst.ifactura.dao.PeticionesDAOImpl;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@SuppressWarnings("serial")
public class ISST_G09_ValorarPropuestaServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		String compania =  req.getParameter("compania");
		String peticion = req.getParameter("id");
		String aceptar = "Estimado " + compania + ", su propuesta (" + peticion + ") ha sido aceptada por el equipo de iFactura, cuando lancemos su subasta se le notificar� por medio de la aplicaci�n.";
		String rechazar = "Estimado " + compania + ", su propuesta (" + peticion + ") ha sido rechazada por el equipo de iFactura.";
		String aceptarn = "Su propuesta (" + peticion + ") ha sido aceptada";
		String rechazarn = "Su propuesta (" + peticion + ") ha sido rechazada";
		String aceptat= "Propuesta Aceptada";
		String rechazat = "Propuesta Rechazada";
		String imagenn = "";
		String boton = req.getParameter("solicitud");

		PeticionesDAO dao = PeticionesDAOImpl.getInstance();
		NotificationDAO dao2 = NotificationDAOImpl.getInstance();
		
		String user = req.getUserPrincipal().getName();
		String correo = req.getParameter("correo");
		
		Properties props = new Properties();
	    Session session = Session.getDefaultInstance(props, null);

	      try {
	        Message msg = new MimeMessage(session);
	        msg.setFrom(new InternetAddress("valoracionSubasta@ifactura-proveedor.appspotmail.com", "Valoracion de subasta"));
	        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(correo, "Estimado cliente"));
	        msg.setSubject("Valoracion de subasta");
	        if (boton.equals("aceptar")){
		        msg.setText(aceptar);
		        imagenn="aceptada.png";
		        dao2.create(correo,aceptat, aceptarn, imagenn);
	        } else {
		        msg.setText(rechazar);
		        imagenn="rechazada.png";
		        dao2.create(correo, rechazat, rechazarn, imagenn);
	        }
	        Transport.send(msg);

	          } catch (AddressException e) {
	              // ...
	          } catch (MessagingException e) {
	              // ...
	          }

		if (user != null) {
			dao.remove(peticion);
		}
				
		resp.sendRedirect("/isst_g09_ifactura");
	}
}