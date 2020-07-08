package user;
import java.sql.PreparedStatement;
import java.sql.Connection;
import util.DatabaseUtil;

public class UserDAO {
	public int join(String usrID, String usrPW, String name, String major, int isStudent) {
		String SQL = "INSERT INTO UserInfo VALUES (?, ?, ?, ?, ?)";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, usrID);
			pstmt.setString(2, usrPW);
			pstmt.setString(3, name);
			pstmt.setString(4, major);
			pstmt.setInt(5, isStudent);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
