package upm.isst.ifactura;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import upm.isst.ifactura.dao.IFacturaDAO;
import upm.isst.ifactura.dao.IFacturaDAOImpl;
import upm.isst.ifactura.dao.PeticionesDAO;
import upm.isst.ifactura.dao.PeticionesDAOImpl;
import upm.isst.ifactura.model.Peticiones;
import upm.isst.ifactura.dao.UsersDAO;
import upm.isst.ifactura.dao.UsersDAOImpl;
import upm.isst.ifactura.model.IFactura;
import upm.isst.ifactura.dao.NotificationDAO;
import upm.isst.ifactura.dao.NotificationDAOImpl;
import upm.isst.ifactura.model.Notification;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class ISST_G09_iFacturaServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		UserService userService = UserServiceFactory.getUserService();
		String url = userService.createLoginURL(req.getRequestURI());
		String urlLinktext = "Login";
		String user = null;
		String alerta = null;
		String compania = null;
		
		if (req.getSession().getAttribute("puja") == null){
			req.getSession().setAttribute("alerta", alerta);
		} else {
			req.getSession().setAttribute("puja", null);
		}
		
		NotificationDAO daonot = NotificationDAOImpl.getInstance();
		UsersDAO dao1 = UsersDAOImpl.getInstance();
		
		RequestDispatcher view = req.getRequestDispatcher("/pages/login.jsp");

		if (req.getUserPrincipal() != null) {

			user = req.getUserPrincipal().getName();
			compania = dao1.readCorreo(user).get(0).getCompania();
			url = userService.createLogoutURL(req.getRequestURI());
			urlLinktext = "Logout";

			view = req.getRequestDispatcher("/pages/index.jsp");
			// Hay que inicializarlo aqui, porque si no user podría ser null
			req.getSession().setAttribute("notificaciones", new ArrayList<Notification>(daonot.readCorreo(user)));

		} 

		IFacturaDAO dao = IFacturaDAOImpl.getInstance();
		PeticionesDAO dao2 = PeticionesDAOImpl.getInstance();
				
		req.getSession().setAttribute("user", compania);
		req.getSession().setAttribute("url", url);
		req.getSession().setAttribute("urlLinktext", urlLinktext);
		req.getSession().setAttribute("miliActual", new Date().getTime());
		req.getSession().setAttribute("subastas", new ArrayList<IFactura>(dao.readIFactura()));
		req.getSession().setAttribute("peticiones", new ArrayList<Peticiones>(dao2.readAll()));
		
		try {
			view.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}
}