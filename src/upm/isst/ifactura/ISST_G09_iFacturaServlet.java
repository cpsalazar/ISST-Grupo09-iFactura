package upm.isst.ifactura;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import upm.isst.ifactura.dao.IFacturaDAO;
import upm.isst.ifactura.dao.IFacturaDAOImpl;
import upm.isst.ifactura.model.IFactura;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class ISST_G09_iFacturaServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		UserService userService = UserServiceFactory.getUserService();
		String url = userService.createLoginURL(req.getRequestURI());
		String urlLinktext = "Login";
		String user = null;
		
		RequestDispatcher view = req.getRequestDispatcher("/pages/login.jsp");

		
		if (req.getUserPrincipal() != null) {
			
			user = req.getUserPrincipal().getName();
			url = userService.createLogoutURL(req.getRequestURI());
			urlLinktext = "Logout";
			
			IFacturaDAO dao = IFacturaDAOImpl.getInstance();
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			String stringFechaConHora = "16/01/2016 15:03:23";
			Date fechaConHora = new java.util.Date();
			try {
				fechaConHora = sdf.parse(stringFechaConHora);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			/*@SuppressWarnings("deprecation")
			Date fechaConHora = new Date(2016, 5, 2, 10, 10, 5); */
			
			dao.create((long) 1, 500, fechaConHora, 14, "Movistar");
			
			view = req.getRequestDispatcher("/pages/index.jsp");
			
		} 
		
		IFacturaDAO dao = IFacturaDAOImpl.getInstance();
		
		req.getSession().setAttribute("user", user);
		req.getSession().setAttribute("url", url);
		req.getSession().setAttribute("urlLinktext", urlLinktext);
		
		req.getSession().setAttribute("subastas", new ArrayList<IFactura>(dao.readIFactura()));
		
		/*try {
			req.getSession().setAttribute("subastas", new ArrayList<IFactura>(dao.readIFactura()));
		} catch (NullPointerException e) {
			e.printStackTrace();
		}*/
			
		try {
			view.forward(req, resp);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}