package upm.isst.ifactura;
import java.io.IOException;
//import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import upm.isst.ifactura.dao.IFacturaDAO;
import upm.isst.ifactura.dao.IFacturaDAOImpl;
import upm.isst.ifactura.model.IFactura;

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
		
		String alerta = null;
		
		List<IFactura> subasta = dao.readIFactura_id((long) mensaje);
		if (subasta.get(0).getPujaActual() > Integer.parseInt(req.getParameter("puja"))){
			
			subasta.get(0).setPujaActual(Integer.parseInt (req.getParameter("puja")));
			String user = req.getUserPrincipal().getName();
			subasta.get(0).setGanadorActual(user);
			dao.update(subasta.get(0));
		} else {
			alerta = "La puja que ha introducido debe superar la puja actual";
		}
		
		req.getSession().setAttribute("alerta", alerta);
		req.getSession().setAttribute("subastas", new ArrayList<IFactura>(dao.readIFactura()));
		
		RequestDispatcher view = req.getRequestDispatcher("/pages/index.jsp");
		
		try {
			view.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		}

	}
}