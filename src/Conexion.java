import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexion {
	
	Connection cn;
	Statement st;
	ResultSet rs;
	
	public Conexion(){
		
		try {
			Class.forName("org.h2.Driver");
			cn = DriverManager.getConnection("jdbc:h2:C:/Users/hector/Dropbox/lib/iFacturaDB","sa","");
			st = cn.createStatement();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	void prueba(){
		
		try {
			rs = st.executeQuery("SELECT * FROM CLIENTES");
			while(rs.next()){
				System.out.println("ID: " + rs.getInt("ID") + "\t" + "Nombre: " + rs.getString("Nombre") + "\t" + "Apellido: " + rs.getString("Apellido"));
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
	}
}
