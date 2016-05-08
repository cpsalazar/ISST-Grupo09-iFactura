package upm.isst.ifactura.dao;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import upm.isst.ifactura.model.Users;

import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;

public class UsersDAOImplTest {

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
		UsersDAOImpl dao1 = UsersDAOImpl.getInstance();
		
		Users u1 = dao1.create("cobealex", "orange");
		assertEquals(u1.getCompania(), "orange");
		assertEquals(u1.getCorreo(), "cobealex");
		
		Users u2 = dao1.create("oscar", "vodafone");
		assertEquals(u2.getCompania(), "vodafone");
		assertEquals(u2.getCorreo(), "oscar");
		
		Users u3 = dao1.create("hector", "movistar");
		assertEquals(u3.getCompania(), "movistar");
		assertEquals(u3.getCorreo(), "hector");
		
		Users u4 = dao1.create("padilla", "yoigo");
		assertEquals(u4.getCompania(), "yoigo");
		assertEquals(u4.getCorreo(), "padilla");
		
		/*Users u5 = dao1.create("", "yoigo"); //no podemos dejar que en el create se creen usuarios con el correo vacio
		assertEquals(u4.getCompania(), "yoigo");
		assertEquals(u4.getCorreo(), "");*/
	}

	@Test
	public void testReadAll() {
		UsersDAOImpl dao1 = UsersDAOImpl.getInstance();
		
		dao1.create("cobealex", "orange");
		dao1.create("oscar", "vodafone");
		dao1.create("hector", "movistar");
		dao1.create("padilla", "yoigo");
		dao1.create("padilla", "yoigo"); //se sobreescribe sobre el anterior.
		
		assertEquals(dao1.readAll().size(), 4);
	}

	@Test
	public void testReadCorreo() {
		UsersDAOImpl dao1 = UsersDAOImpl.getInstance();
		
		dao1.create("cobealex", "orange");
		dao1.create("oscar", "vodafone");
		dao1.create("hector", "movistar");
		dao1.create("padilla", "yoigo");
		dao1.create("padilla", "yoigo");	
		
		assertEquals(dao1.readCorreo("cobealex").size(), 1);
		assertEquals(dao1.readCorreo("oscar").size(), 1);
		//assertEquals(dao1.readCorreo("").size(), 0); //en readCorreo debemos comprobar que no se mete un string vacio porque falla.
		assertEquals(dao1.readCorreo("cobe").size(), 0);
	}

	@Test
	public void testReadCompania() {
		UsersDAOImpl dao1 = UsersDAOImpl.getInstance();
		
		dao1.create("cobealex", "orange");
		dao1.create("oscar", "vodafone");
		dao1.create("hector", "movistar");
		dao1.create("padilla", "yoigo");
		dao1.create("padilla", "yoigo");	
		dao1.create("padilla", "");	
		
		assertEquals(dao1.readCompania("orange").size(), 1);
		assertEquals(dao1.readCompania("").size(), 1);
		assertEquals(dao1.readCompania("oran").size(), 0);
		assertEquals(dao1.readCompania("yoigo").size(), 0);

	}

	@Test
	public void testUpdate() {
		UsersDAOImpl dao1 = UsersDAOImpl.getInstance();
		
		Users u1 = dao1.create("cobealex", "orange");	
		u1.setCompania("vodafone");
		
		dao1.update(u1);
		
		assertEquals(dao1.readCompania("vodafone").size(), 1);
	}

	@Test
	public void testRemove() {
		UsersDAOImpl dao1 = UsersDAOImpl.getInstance();
		
		dao1.create("cobealex", "orange");
		dao1.create("padilla", "orange");	
		
		assertEquals(dao1.readCompania("orange").size(), 2);
		
		dao1.remove("cobealex");
		
		assertEquals(dao1.readCompania("orange").size(), 1);

	}

}
