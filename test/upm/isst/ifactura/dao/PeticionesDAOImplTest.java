package upm.isst.ifactura.dao;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import upm.isst.ifactura.model.Peticiones;

import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;

public class PeticionesDAOImplTest {

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
		PeticionesDAOImpl dao1 = PeticionesDAOImpl.getInstance();
		
		Peticiones pet1= dao1.create("cobealex@gmail.com", "Orange", "Peticion de prueba");
		assertEquals(pet1.getCorreo(), "cobealex@gmail.com");
		assertEquals(pet1.getCompania(), "Orange");
		assertEquals(pet1.getPeticion(), "Peticion de prueba");
		
		/*Peticiones pet2= dao1.create("", "", ""); //No deberiamos dejar que el create cree con la clave vacia porque da error.
		assertEquals(pet2.getCorreo(), "");
		assertEquals(pet2.getCompania(), "");
		assertEquals(pet2.getPeticion(), "");*/
	}

	@Test
	public void testReadAll() {
		PeticionesDAOImpl dao1 = PeticionesDAOImpl.getInstance();
		dao1.create("cobealex@gmail.com", "Orange", "Peticion de prueba");
		dao1.create("cobealex", "Orange", "Peticion de prueba");
		dao1.create("", "Orange", "Peticion de prueba");
		dao1.create("jaime", "Orange", "Peticion de prueba");
		
		assertEquals(dao1.readAll().size(), 1);
		
		dao1.create("cobealex", "Orange", "Peticion");
		assertEquals(dao1.readAll().size(), 2);
	}

	@Test
	public void testReadCorreo() {
		PeticionesDAOImpl dao1 = PeticionesDAOImpl.getInstance();
		dao1.create("cobealex@gmail.com", "Orange", "prueba1");
		dao1.create("cobealex", "Orange", "prueba2");
		dao1.create("", "Orange", "prueba3");
		dao1.create("jaime", "Orange", "prueba4");	
		
		assertEquals(dao1.readCorreo("cobealex").size(), 1);
		assertEquals(dao1.readCorreo("").size(), 1);
		assertEquals(dao1.readCorreo("ninguna").size(), 0);
	}
	
	@Test
	public void testReadCompania() {
		PeticionesDAOImpl dao1 = PeticionesDAOImpl.getInstance();
		dao1.create("cobealex@gmail.com", "Orange", "prueba1");
		dao1.create("cobealex", "Orange", "prueba2");
		dao1.create("", "Orange", "prueba3");
		dao1.create("jaime", "Orange", "prueba4");	
		
		assertEquals(dao1.readCompania("Orange").size(), 4);
		assertEquals(dao1.readCompania("").size(), 0);
	}

	@Test
	public void testUpdate() {
		PeticionesDAOImpl dao1 = PeticionesDAOImpl.getInstance();
		Peticiones pet1 = dao1.create("cobealex@gmail.com", "Orange", "prueba1");
		dao1.create("cobealex", "Orange", "prueba2");
		dao1.create("", "Orange", "prueba3");
		dao1.create("jaime", "Orange", "prueba4");		
		
		pet1.setCompania("Movistar");
		pet1.setCorreo("oscar@gmail.com");
		//pet1.setPeticion("otra prueba");
		
		dao1.update(pet1); //el update no deberia poder actualizar la clave de una peticion.
		assertEquals(dao1.readCorreo("oscar@gmail.com").size(), 1);
		assertEquals(dao1.readCompania("Movistar").size(), 1);
	}

	@Test
	public void testRemove() {
		PeticionesDAOImpl dao1 = PeticionesDAOImpl.getInstance();
		Peticiones pet1 = dao1.create("cobealex@gmail.com", "Orange", "prueba1");
		dao1.create("cobealex", "Orange", "prueba2");
		dao1.create("", "Orange", "prueba3");
		dao1.create("jaime", "Orange", "prueba4");	
		dao1.remove(pet1.getPeticion());
		
		assertEquals(dao1.readAll().size(), 3);
	}
}
