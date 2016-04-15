package upm.isst.ifactura;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.*;
import upm.isst.ifactura.dao.IFacturaDAO;
import upm.isst.ifactura.dao.IFacturaDAOImpl;

@SuppressWarnings("serial")
public class ISST_G09_SubastasServlet extends HttpServlet {

	public void init(){

		IFacturaDAO dao = IFacturaDAOImpl.getInstance();

		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		String stringFechaConHora = "16/05/2016 15:00:00";
		String stringFechaConHora1 = "16/06/2016 21:00:00";
		String stringFechaConHora2 = "20/05/2016 12:00:00";
		Date fechaConHora = new java.util.Date();
		Date fechaConHora1 = new java.util.Date();
		Date fechaConHora2 = new java.util.Date();
		try {
			fechaConHora = sdf.parse(stringFechaConHora);
			fechaConHora1 = sdf.parse(stringFechaConHora1);
			fechaConHora2 = sdf.parse(stringFechaConHora2);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		dao.create((long) 1, 500, fechaConHora, 14, "Movistar");
		dao.create((long) 2, 700, fechaConHora, 12, "Vodafone");
		dao.create((long) 3, 300, fechaConHora1, 13, "Orange");
		dao.create((long) 4, 400, fechaConHora1, 11, "Yoigo");
		dao.create((long) 5, 800, fechaConHora2, 20, "Pepephone");
	}
}