package upm.isst.ifactura.dao;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import upm.isst.ifactura.model.Notification;

import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;

public class NotificationDAOImplTest {

	private final LocalServiceTestHelper helper = new LocalServiceTestHelper(new LocalDatastoreServiceTestConfig());

	@Before
	public void setUp() throws Exception {
		helper.setUp();
	}

	@After
	public void tearDown() throws Exception {
		helper.tearDown();
	}
	
	@Test
	public void testCreate() {
		NotificationDAOImpl dao1 = NotificationDAOImpl.getInstance();
		
		Notification not1 = dao1.create("cobealex@gmail.com", "prueba", "notification", "image");
		assertEquals(not1.getCorreo(), "cobealex@gmail.com");
		assertEquals(not1.getTexto(), "prueba");
		assertEquals(not1.getTitulo(), "notification");
		assertEquals(not1.getImagen(), "image");

		/*Notification not2 = dao1.create("", "", "", ""); //No podemos permitir que se cree una notificacion con la clave vacia porque si no da error.
		assertEquals(not2.getCorreo(), "");
		assertEquals(not2.getTexto(), "");
		assertEquals(not2.getTitulo(), "");
		assertEquals(not2.getImagen(), "");*/
		
		Notification not3 = dao1.create("", "clave", "", "");
		assertEquals(not3.getCorreo(), "");
		assertEquals(not3.getTexto(), "clave");
		assertEquals(not3.getTitulo(), "");
		assertEquals(not3.getImagen(), "");
	}

	@SuppressWarnings("unused")
	@Test
	public void testReadAll() {
		NotificationDAOImpl dao1 = NotificationDAOImpl.getInstance();
		
		Notification not1 = dao1.create("cobealex@gmail.com", "prueba", "notification", "image");
		Notification not2 = dao1.create("", "clave", "", "");
		Notification not3 = dao1.create("", "clave", "", "");
		
		assertEquals(dao1.readAll().size(), 2);
	}

	@SuppressWarnings("unused")
	@Test
	public void testReadCorreo() {
		NotificationDAOImpl dao1 = NotificationDAOImpl.getInstance();
		
		Notification not1 = dao1.create("cobealex@gmail.com", "prueba", "notification", "image");
		Notification not2 = dao1.create("", "clave", "", "");
		Notification not3 = dao1.create("", "clave", "", "");
		
		assertEquals(dao1.readCorreo("cobealex@gmail.com").size(), 1);
		assertEquals(dao1.readCorreo("").size(), 1);
		assertEquals(dao1.readCorreo("cobealex").size(), 0);
	}
	
	@SuppressWarnings("unused")
	@Test
	public void testReadID() {
		NotificationDAOImpl dao1 = NotificationDAOImpl.getInstance();
		
		Notification not1 = dao1.create("cobealex@gmail.com", "prueba", "notification", "image");
		Notification not2 = dao1.create("", "clave", "", "");
		Notification not3 = dao1.create("", "clave", "", "");
				
		try {
			assertEquals(not1.toString(), dao1.readID("prueba").toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			assertEquals(not3.toString(), dao1.readID("clave").toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			assertEquals(not1.toString(), dao1.readID("").toString());
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	@SuppressWarnings("unused")
	@Test
	public void testUpdate() {
		NotificationDAOImpl dao1 = NotificationDAOImpl.getInstance();
		
		Notification not1 = dao1.create("cobealex@gmail.com", "prueba", "notification", "image");
		Notification not2 = dao1.create("", "clave", "", "");
		Notification not3 = dao1.create("", "clave", "", "");	
		
		not1.setCorreo("cobealex");
		not1.setImagen("imagen");
		//not1.setTexto("modification"); el update no puede actualizar la clave.
		not1.setTitulo("title");
		
		dao1.update(not1);
		try {
			assertEquals(dao1.readID("prueba").getCorreo(), "cobealex");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			assertEquals(dao1.readID("prueba").getImagen(), "imagen");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			assertEquals(dao1.readID("prueba").getTitulo(), "title");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unused")
	@Test
	public void testRemove() {
		NotificationDAOImpl dao1 = NotificationDAOImpl.getInstance();
		
		Notification not1 = dao1.create("cobealex@gmail.com", "prueba", "notification", "image");
		Notification not2 = dao1.create("", "clave", "", "");
		Notification not3 = dao1.create("", "clave", "", "");
		
		try {
			dao1.remove("prueba");
			assertEquals(dao1.readAll().size(), 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}

}
