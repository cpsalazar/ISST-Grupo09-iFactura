package upm.isst.ifactura;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class ISST_G09_iFacturaServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		UserService userService = UserServiceFactory.getUserService();
		String url = userService.createLoginURL(req.getRequestURI());
		String urlLinktext = "Login";
		String user = null;
		
		if (req.getUserPrincipal() != null) {
			user = req.getUserPrincipal().getName();
			url = userService.createLogoutURL(req.getRequestURI());
			urlLinktext = "Logout";
			req.getSession().setAttribute("user", user);
			req.getSession().setAttribute("url", url);
			req.getSession().setAttribute("urlLinktext", urlLinktext);
			RequestDispatcher view = req.getRequestDispatcher("/pages/index.jsp");
			view.forward(req, resp);
		} else {
			req.getSession().setAttribute("user", user);
			req.getSession().setAttribute("url", url);
			req.getSession().setAttribute("urlLinktext", urlLinktext);
			RequestDispatcher view = req.getRequestDispatcher("/pages/login.jsp");
			view.forward(req, resp);
		}
	}
}