package upm.isst.ifactura;

import javax.servlet.http.*;

import upm.isst.ifactura.dao.NotificationDAO;
import upm.isst.ifactura.dao.NotificationDAOImpl;
import upm.isst.ifactura.dao.UsersDAO;
import upm.isst.ifactura.dao.UsersDAOImpl;

@SuppressWarnings("serial")
public class ISST_G09_SubastasServlet extends HttpServlet {

	public void init(){

		/*IFacturaDAO dao = IFacturaDAOImpl.getInstance();

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
		
		//List<String> participantes = new ArrayList<String>();

		dao.create((long) 1, 500, fechaConHora, 14, "", participantes);
		dao.create((long) 2, 700, fechaConHora, 12, "", participantes);
		dao.create((long) 3, 300, fechaConHora1, 13, "", participantes);
		dao.create((long) 4, 400, fechaConHora1, 11, "", participantes);
		dao.create((long) 5, 800, fechaConHora2, 20, "", participantes);*/
		
		UsersDAO dao1 = UsersDAOImpl.getInstance();
		
		dao1.create("hectorbm94@gmail.com", "Movistar");
		dao1.create("oscarvb94@gmail.com", "Vodafone");
		dao1.create("cobealex@gmail.com", "Orange");
		dao1.create("cpsalazar17@gmail.com", "Yoigo");
		dao1.create("ifacturag09@gmail.com", "iFactura");
		
		NotificationDAO dao2 = NotificationDAOImpl.getInstance();
		
		dao2.create("hectorbm94@gmail.com", "texto de prueba");
		dao2.create("oscarvb94@gmail.com", "oskorp topo");
		dao2.create("cobealex@gmail.com", "doka pipa");
		dao2.create("cpsalazar17@gmail.com", "pudi topacio");
	}
}