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
import upm.isst.ifactura.dao.UsersDAO;
import upm.isst.ifactura.dao.UsersDAOImpl;
import upm.isst.ifactura.model.IFactura;
import upm.isst.ifactura.model.Users;

@SuppressWarnings("serial")
public class ISST_G09_PujasServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		int mensaje = 0;
		
		try {
			mensaje = Integer.parseInt (req.getParameter("id"));
		} catch (Exception e) {
	
		}
		
		IFacturaDAO dao = IFacturaDAOImpl.getInstance();
		
		String alerta;
		alerta = "La puja introducida debe mejorar la actual";
		
		List<IFactura> subasta = dao.readIFactura_id((long) mensaje);
		if (subasta.get(0).getPujaActual() > Double.parseDouble(req.getParameter("puja")) && Double.parseDouble(req.getParameter("puja")) > 0) {	
			subasta.get(0).setPujaActual(Double.parseDouble (req.getParameter("puja")));
			String user = req.getUserPrincipal().getName();
			subasta.get(0).setGanadorActual(user);
			dao.update(subasta.get(0));
			alerta = "Vas ganando la subasta";
		}
		
		req.getSession().setAttribute("alerta", alerta);
		req.getSession().setAttribute("subastas", new ArrayList<IFactura>(dao.readIFactura()));
		
		UsersDAO dao1 = UsersDAOImpl.getInstance();
		
		List<Users> usuarios = dao1.readCorreo(req.getUserPrincipal().getName());
		
		if (usuarios.size()>0){
			subasta.get(0).setParticipantes(usuarios.get(0).getCorreo());
			dao.update(subasta.get(0));
			//System.out.println(subasta.get(0).getParticipantes().toString());
		}
		
		
		RequestDispatcher view = req.getRequestDispatcher("/pages/index.jsp");
		
		try {
			view.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		}

	}
}