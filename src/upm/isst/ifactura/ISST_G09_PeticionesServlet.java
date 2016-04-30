package upm.isst.ifactura;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import upm.isst.ifactura.dao.PeticionesDAO;
import upm.isst.ifactura.dao.PeticionesDAOImpl;

@SuppressWarnings("serial")
public class ISST_G09_PeticionesServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		String peticion = req.getParameter("peticion");
		
		PeticionesDAO dao = PeticionesDAOImpl.getInstance();
		
		String user = req.getUserPrincipal().getName();

		if (user != null) {
			dao.create(user, peticion);
		}
				
		resp.sendRedirect("/isst_g09_ifactura");
	}
}