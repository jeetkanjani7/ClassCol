
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlConnector {
	static String driver,url,name,pass;
	public MysqlConnector() 
	{
		// mysql driver
		
		

	}
	
	public static Connection getCon()throws SQLException,ClassNotFoundException
	{
		Class.forName("com.mysql.jdbc.Driver");
		// initialize the Connection, with our DB info ...
		Connection con = DriverManager.getConnection( url, name, pass );
		

		
		return con;
		
		
	}
	public static Connection getCnn()throws SQLException,ClassNotFoundException
	{
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection cnn=DriverManager.getConnection("jdbc:mysql://localhost:3306/classcol", "root", "jeet");
		
		System.out.println("Connection Done.....");
		return cnn;
	}
	
}
