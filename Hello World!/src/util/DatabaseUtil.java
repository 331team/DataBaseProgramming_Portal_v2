package util;
import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/portaldb?useUnicode=true&characterEncoding=utf8&validataionQuery=select1";
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dbURL, "db17331", "ora");
		} catch(Exception e) {
			e.printStackTrace();
		};
		return null;
	}
}
