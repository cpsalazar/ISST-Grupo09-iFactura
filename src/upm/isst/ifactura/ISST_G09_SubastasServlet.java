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
		String stringFechaConHora = "16/01/2016 15:03:23";
		Date fechaConHora = new java.util.Date();
		try {
			fechaConHora = sdf.parse(stringFechaConHora);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		dao.create((long) 1, 500, fechaConHora, 14, "Movistar");
		dao.create((long) 2, 700, fechaConHora, 12, "Vodafone");
	}
}