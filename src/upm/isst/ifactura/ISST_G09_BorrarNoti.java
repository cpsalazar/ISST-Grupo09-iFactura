package upm.isst.ifactura;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import upm.isst.ifactura.dao.NotificationDAO;
import upm.isst.ifactura.dao.NotificationDAOImpl;

@SuppressWarnings("serial")
public class ISST_G09_BorrarNoti extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		NotificationDAO daonot = NotificationDAOImpl.getInstance();
		String noti = req.getParameter("peticion"); //O ALGO PARECIDO PARA EXTRAER
		daonot.remove(""); //REMOVE EN FUNCION DEL PARAMETRO
		resp.sendRedirect("/isst_g09_ifactura");
	}
}
