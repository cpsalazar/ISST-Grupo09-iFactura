package upm.isst.ifactura.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import upm.isst.ifactura.model.IFactura;

import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;


public class IFacturaDAOImplTest {
	
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
		IFacturaDAOImpl dao1 = IFacturaDAOImpl.getInstance();
		
		List<String> listaPrueba = new ArrayList<String>();
		
		IFactura subasta1 = dao1.create((long) 1, "Subasta de prueba", 500, 3000000, 10, "Movistar", listaPrueba);
		assertEquals(subasta1.getId(), Long.valueOf(1));
		assertEquals(subasta1.getDescripcion(), "Subasta de prueba");
		assertEquals(subasta1.getNumUsuarios(), 500);
		assertEquals(subasta1.getFechaFin(), 3000000);
		assertEquals(subasta1.getPujaActual(), 10, 0);
		assertEquals(subasta1.getGanadorActual(), "Movistar");
		assertEquals(subasta1.getParticipantes(), listaPrueba);
		
		IFactura subasta2 = dao1.create((long) 1, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		assertEquals(subasta2.getId(), Long.valueOf(1));
		assertEquals(subasta2.getDescripcion(), "Subasta sobreescrita");
		assertEquals(subasta2.getNumUsuarios(), 500);
		assertEquals(subasta2.getFechaFin(), 3000000);
		assertEquals(subasta2.getPujaActual(), 10, 0);
		assertEquals(subasta2.getGanadorActual(), "Movistar");
		assertEquals(subasta2.getParticipantes(), listaPrueba);
		
		/*IFactura subasta3 = dao1.create((long) 0, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		assertEquals(subasta3.getId(), Long.valueOf(0));
		assertEquals(subasta3.getDescripcion(), "Subasta sobreescrita");
		assertEquals(subasta3.getNumUsuarios(), 500);
		assertEquals(subasta3.getFechaFin(), 3000000);
		assertEquals(subasta3.getPujaActual(), 10, 0);
		assertEquals(subasta3.getGanadorActual(), "Movistar");
		assertEquals(subasta3.getParticipantes(), listaPrueba); //El id nunca podra ser 0 porque lo creamos a partir de la longitud de una lista + 1.*/
		
		IFactura subasta4 = dao1.create((long) -1, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		assertEquals(subasta4.getId(), Long.valueOf(-1));
		assertEquals(subasta4.getDescripcion(), "Subasta sobreescrita");
		assertEquals(subasta4.getNumUsuarios(), 500);
		assertEquals(subasta4.getFechaFin(), 3000000);
		assertEquals(subasta4.getPujaActual(), 10, 0);
		assertEquals(subasta4.getGanadorActual(), "Movistar");
		assertEquals(subasta4.getParticipantes(), listaPrueba); //Nos deja crear subastas con id negativos.
		
		assertEquals(dao1.readIFactura_id((long)1).size(), 1); //comprobacion de que si creas dos subastas con el mismo ID se sobreescribe.
		assertEquals(dao1.readIFactura_id((long)1).get(0).getDescripcion(), "Subasta sobreescrita");
	}

	@SuppressWarnings("unused")
	@Test
	public void testReadIFactura() {
		IFacturaDAOImpl dao1 = IFacturaDAOImpl.getInstance();
		
		List<String> listaPrueba = new ArrayList<String>();

		IFactura subasta1 = dao1.create((long) 1, "Subasta de prueba", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta2 = dao1.create((long) 1, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta3 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);

		assertEquals(dao1.readIFactura().size(), 2);
		assertEquals(dao1.readIFactura().get(0).getId(), Long.valueOf(1));
		assertEquals(dao1.readIFactura().get(1).getId(), Long.valueOf(2));
	}

	@SuppressWarnings("unused")
	@Test
	public void testReadIFactura_descripcion() {
		IFacturaDAOImpl dao1 = IFacturaDAOImpl.getInstance();
		
		List<String> listaPrueba = new ArrayList<String>();

		IFactura subasta1 = dao1.create((long) 1, "Subasta de prueba", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta2 = dao1.create((long) 1, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta3 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta4 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta5 = dao1.create((long) 3, "", 500, 3000000, 10, "Movistar", listaPrueba);

		assertEquals(dao1.readIFactura_descripcion("Subasta sobreescrita").size(), 2);
		assertEquals(dao1.readIFactura_descripcion("Subasta de prueba").size(), 0);
		assertEquals(dao1.readIFactura_descripcion("prueba").size(), 0);
		assertEquals(dao1.readIFactura_descripcion("").size(), 1);

	}

	@SuppressWarnings("unused")
	@Test
	public void testReadIFactura_usuarios() {
		IFacturaDAOImpl dao1 = IFacturaDAOImpl.getInstance();
		
		List<String> listaPrueba = new ArrayList<String>();

		IFactura subasta1 = dao1.create((long) 1, "Subasta de prueba", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta2 = dao1.create((long) 1, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta3 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta4 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta5 = dao1.create((long) 3, "Subasta sobreescrita", 600, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta6 = dao1.create((long) 4, "Subasta sobreescrita", -1, 3000000, 10, "Movistar", listaPrueba);

		assertEquals(dao1.readIFactura_usuarios(500).size(), 2);
		assertEquals(dao1.readIFactura_usuarios(600).size(), 1);
		assertEquals(dao1.readIFactura_usuarios(-1).size(), 1); //Nos deja crear subastas con usuarios negativos.
	}

	@SuppressWarnings("unused")
	@Test
	public void testReadIFactura_compania() {
		IFacturaDAOImpl dao1 = IFacturaDAOImpl.getInstance();
		
		List<String> listaPrueba = new ArrayList<String>();

		IFactura subasta1 = dao1.create((long) 1, "Subasta de prueba", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta2 = dao1.create((long) 1, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta3 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta4 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta5 = dao1.create((long) 3, "Subasta sobreescrita", 600, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta6 = dao1.create((long) 4, "Subasta sobreescrita", 600, 3000000, 10, "", listaPrueba);

		assertEquals(dao1.readIFactura_compania("Movistar").size(), 3);
		assertEquals(dao1.readIFactura_compania("prueba").size(), 0);
		assertEquals(dao1.readIFactura_compania("").size(), 1);
	}

	@SuppressWarnings("unused")
	@Test
	public void testReadIFactura_puja() {
		IFacturaDAOImpl dao1 = IFacturaDAOImpl.getInstance();
		
		List<String> listaPrueba = new ArrayList<String>();

		IFactura subasta1 = dao1.create((long) 1, "Subasta de prueba", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta2 = dao1.create((long) 1, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta3 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 0, "Movistar", listaPrueba);
		IFactura subasta4 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta5 = dao1.create((long) 3, "Subasta sobreescrita", 600, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta6 = dao1.create((long) 4, "Subasta sobreescrita", 600, 3000000, -5, "Movistar", listaPrueba);

		assertEquals(dao1.readIFactura_puja(10).size(), 3);
		assertEquals(dao1.readIFactura_puja(-5).size(), 1); //Deja crear subastas con pujas iniciales negativas.
	}

	@SuppressWarnings("unused")
	@Test
	public void testReadIFactura_fecha() {
		IFacturaDAOImpl dao1 = IFacturaDAOImpl.getInstance();
		
		List<String> listaPrueba = new ArrayList<String>();

		IFactura subasta1 = dao1.create((long) 1, "Subasta de prueba", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta2 = dao1.create((long) 1, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta3 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 0, "Movistar", listaPrueba);
		IFactura subasta4 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta5 = dao1.create((long) 3, "Subasta sobreescrita", 600, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta6 = dao1.create((long) 4, "Subasta sobreescrita", 600, -3000000, 10, "Movistar", listaPrueba);

		assertEquals(dao1.readIFactura_fecha(3000000).size(), 3);
		assertEquals(dao1.readIFactura_fecha(5).size(), 0);
		assertEquals(dao1.readIFactura_fecha(-3000000).size(), 1); //Deja crear subastas con fecha de finalizacion posterior a la actual.
	}

	@SuppressWarnings("unused")
	@Test
	public void testReadIFactura_id() {
		IFacturaDAOImpl dao1 = IFacturaDAOImpl.getInstance();
		
		List<String> listaPrueba = new ArrayList<String>();

		IFactura subasta1 = dao1.create((long) 1, "Subasta de prueba", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta2 = dao1.create((long) 1, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta3 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 0, "Movistar", listaPrueba);
		IFactura subasta4 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta5 = dao1.create((long) 3, "Subasta sobreescrita", 600, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta6 = dao1.create((long) 4, "Subasta sobreescrita", 600, -3000000, 10, "Movistar", listaPrueba);

		assertEquals(dao1.readIFactura_id((long)1).size(), 1);
		assertEquals(dao1.readIFactura_id((long)2).size(), 1);
		assertEquals(dao1.readIFactura_id((long)4).size(), 1);	
	}

	@SuppressWarnings("unused")
	@Test
	public void testUpdate() {
		IFacturaDAOImpl dao1 = IFacturaDAOImpl.getInstance();
		
		List<String> listaPrueba = new ArrayList<String>();

		IFactura subasta1 = dao1.create((long) 1, "Subasta de prueba", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta2 = dao1.create((long) 1, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta3 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 0, "Movistar", listaPrueba);
		IFactura subasta4 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta5 = dao1.create((long) 3, "Subasta sobreescrita", 600, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta6 = dao1.create((long) 4, "Subasta sobreescrita", 600, -3000000, 10, "Movistar", listaPrueba);
		IFactura subasta7 = dao1.create((long) 1, "update", 500, 20, 10, "Movistar", listaPrueba);

		subasta2.setDescripcion("update");
		subasta2.setNumUsuarios(400);
		subasta2.setFechaFin(20);
		//subasta2.setId((long)5); //No podemos permitir que el id sea cambiado porque provoca un error en el update.
		dao1.update(subasta2);
		assertEquals(dao1.readIFactura_descripcion("update").size(), 1);
		assertEquals(dao1.readIFactura_usuarios(400).size(), 1);
		assertEquals(dao1.readIFactura_fecha(20).size(), 1);
	}

	@SuppressWarnings("unused")
	@Test
	public void testDelete() {
		IFacturaDAOImpl dao1 = IFacturaDAOImpl.getInstance();
		
		List<String> listaPrueba = new ArrayList<String>();

		IFactura subasta1 = dao1.create((long) 1, "Subasta de prueba", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta2 = dao1.create((long) 1, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta3 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 0, "Movistar", listaPrueba);
		IFactura subasta4 = dao1.create((long) 2, "Subasta sobreescrita", 500, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta5 = dao1.create((long) 3, "Subasta sobreescrita", 600, 3000000, 10, "Movistar", listaPrueba);
		IFactura subasta6 = dao1.create((long) 4, "Subasta sobreescrita", 600, -3000000, 10, "Movistar", listaPrueba);
		IFactura subasta7 = dao1.create((long) 1, "update", 500, 20, 10, "Movistar", listaPrueba);
		
		dao1.delete((long)1);
		assertEquals(dao1.readIFactura().size(), 3);
		
		dao1.delete((long)2);
		assertEquals(dao1.readIFactura().size(), 2);
		
		dao1.delete((long)5);
		assertEquals(dao1.readIFactura().size(), 2);
	}

}
