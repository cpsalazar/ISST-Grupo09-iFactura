package upm.isst.ifactura;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
		
		List<IFactura> subastas = dao.readIFactura();


		int usuarios= Integer.parseInt(req.getParameter("usuarios"));
		double puja_inicial= Double.parseDouble(req.getParameter("puja_inicial"));

		Date fechaConHora = new java.util.Date();

		try {
			fechaConHora = sdf.parse(fecha);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		long id = subastas.size() + 1;
		List<String> participantes = new ArrayList<String>();
		
		dao.create(id, usuarios, fechaConHora, puja_inicial, "", participantes);
		
		req.getSession().setAttribute("subastas", new ArrayList<IFactura>(dao.readIFactura()));

		RequestDispatcher view = req.getRequestDispatcher("/pages/index.jsp");

		try {
			view.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		}

	}
}