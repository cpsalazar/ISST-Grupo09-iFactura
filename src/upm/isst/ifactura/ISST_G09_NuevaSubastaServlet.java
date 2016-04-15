package upm.isst.ifactura;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
//import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import upm.isst.ifactura.dao.IFacturaDAO;
import upm.isst.ifactura.dao.IFacturaDAOImpl;
import upm.isst.ifactura.model.IFactura;

@SuppressWarnings("serial")
public class ISST_G09_NuevaSubastaServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		IFacturaDAO dao = IFacturaDAOImpl.getInstance();

		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		String fecha = req.getParameter("fecha");
		String alerta = null;
		int id= Integer.parseInt(req.getParameter("id"));
		List<IFactura> subasta = dao.readIFactura_id((long) id);


		int usuarios= Integer.parseInt(req.getParameter("usuarios"));
		int puja_inicial= Integer.parseInt(req.getParameter("puja_inicial"));

		Date fechaConHora = new java.util.Date();

		try {
			fechaConHora = sdf.parse(fecha);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		if (subasta.size() != 0){
			alerta = "El ID introducido ya existe";
		}else {
			dao.create((long) id, usuarios, fechaConHora, puja_inicial, "");
		}


		/*PrintWriter out = resp.getWriter();
		 resp.setContentType("text/html");
		 out.println("<html><body>");
		 out.println("<p>" + subastas.toString() + "</p>");
		 out.println("</body></html>");
		 out.close();*/
		
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