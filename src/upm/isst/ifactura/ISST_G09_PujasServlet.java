package upm.isst.ifactura;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import upm.isst.ifactura.dao.IFacturaDAO;
import upm.isst.ifactura.dao.IFacturaDAOImpl;
import upm.isst.ifactura.model.IFactura;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class ISST_G09_PujasServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		int mensaje = 0;
		
		try {
			mensaje = Integer.parseInt (req.getParameter("id"));
		}
		catch (Exception e) {
	
		}
		
		IFacturaDAO dao = IFacturaDAOImpl.getInstance();
		
		List<IFactura> subasta = dao.readIFactura_id((long) mensaje);
		subasta.get(0).setPujaActual(Integer.parseInt (req.getParameter("puja")));
		dao.update(subasta.get(0));
		
		req.getSession().setAttribute("subastas", new ArrayList<IFactura>(dao.readIFactura()));
		
		/*PrintWriter out = resp.getWriter();
		 resp.setContentType("text/html");
		 out.println("<html><body>");
		 out.println("<p>" + subastas.toString() + "</p>");
		 out.println("</body></html>");
		 out.close();*/
		
		RequestDispatcher view = req.getRequestDispatcher("/pages/index.jsp");
		
		try {
			view.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		}

	}
}