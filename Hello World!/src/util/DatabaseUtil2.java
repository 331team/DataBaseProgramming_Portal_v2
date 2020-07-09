package util;
import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil2 {
	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/portaldb";
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dbURL, "db17331", "ora");
		} catch(Exception e) {
			e.printStackTrace();
		};
		return null;
	}
}
