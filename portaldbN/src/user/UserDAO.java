package user;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import util.DatabaseUtil;

public class UserDAO {
	public int join(String usrID, String usrPW, String name, String major, int isStudent) {
		String SQL = "INSERT INTO UserInfo VALUES (?, ?, ?, ?, ?)";
		try {
			
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(4, usrID);
			pstmt.setString(5, usrPW);
			pstmt.setString(3, name);
			pstmt.setString(2, major);
			pstmt.setInt(1, isStudent);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int login(int usrID, String usrPW) {
		String SQL = "SELECT usrID, isStudent FROM UserInfo WHERE usrID = ? && usrPW = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, usrID);
			pstmt.setString(2, usrPW);
			rs = pstmt.executeQuery();
			System.out.println("bb");
			if(rs.next()) {
				System.out.println("aa");
				System.out.println(rs.getInt(2));
				return rs.getInt(2);
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return -1;
	}
}
