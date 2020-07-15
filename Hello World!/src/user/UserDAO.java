package user;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import util.DatabaseUtil;
import java.util.ArrayList;

import evaluation.EvaluationDTO;

public class UserDAO {
	private Connection conn;
	private ResultSet rs;

	
	public int join(String usrID, String usrPW, String name, String major, int isStudent, String email, String emailHash) {
		String SQL = "INSERT INTO UserInfo VALUES (?, ?, ?, ?, ?, ?, ?, false)";
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(5, usrID);
			pstmt.setString(4, usrPW);
			pstmt.setString(3, name);
			pstmt.setString(2, major);
			pstmt.setInt(1, isStudent);
			
			pstmt.setString(6, email);
			pstmt.setString(7, emailHash);

			return pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int login(String usrID, String usrPW) {
		String SQL = "SELECT usrID, isStudent FROM UserInfo WHERE usrID = ? && usrPW = ?";
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, usrID);
			pstmt.setString(2, usrPW);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(2);
			}
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return -1;
	}
	
	public int update(String usrID, String usrPW) {
		String SQL = "UPDATE UserInfo SET usrPW=? WHERE usrID=?";
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, usrPW);
			pstmt.setString(2, usrID);
			return pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return -1;
	}
	
	public ArrayList<String> getInfo(String usrID) {
		ArrayList<String> user = new ArrayList<String>();
		String SQL = "SELECT * FROM UserInfo WHERE usrID = ?";
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, usrID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				user.add(rs.getString(3));
				user.add(rs.getString(2));
				user.add(rs.getString(4));
			}
			return user;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
		}
		return null;
	}
	
	public String getUserEmail(String userID) {
		String SQL = "SELECT usrEmail FROM UserInfo WHERE usrID = ?";
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getString(1); // 이메일 주소 반환
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null; // 데이터베이스 오류

	}
	
	public boolean setUserEmailChecked(String userID) {
		String SQL = "UPDATE USER SET usrEmailChecked = true WHERE usrID = ?";
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return true; // 이메일 등록 설정 성공
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false; // 이메일 등록 설정 실패
	}
	
	public boolean getUserEmailChecked(String userID) {
		String SQL = "SELECT usrEmailChecked FROM UserInfo WHERE usrID = ?";
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getBoolean(1); // 이메일 등록 여부 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false; // 데이터베이스 오류
	}
	
	public int leave(String userID, String userPW) {
		String SQL = "DELETE FROM UserInfo WHERE usrID = ? && usrPW = ?";
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPW);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<UserDTO> getList(){
		ArrayList<UserDTO> userList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			try {
				SQL = "SELECT * FROM UserInfo LIMIT 10";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				userList = new ArrayList<UserDTO>();
				while(rs.next()) {
					UserDTO user = new UserDTO();
					user.setIsStudent(rs.getInt(1));
					user.setMajor(rs.getString(2));
					user.setName(rs.getString(3));
					user.setUsrPW(rs.getString(4));
					user.setUsrID(rs.getString(5));
					user.setUsrEmail(rs.getString(6));
					user.setUsrEmailHash(rs.getString(7));
					user.setUsrEmailChecked(rs.getInt(8));
					userList.add(user);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
				try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
				try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
			}
			
		return userList; // 실패하면 null값이 들어가 있을 것
	}
	
	public int delete(String usrID) {
		String SQL = "DELETE FROM UserInfo WHERE usrID = ?";
		System.out.println("sql");
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, usrID);
			int i = pstmt.executeUpdate();
			System.out.println(i + usrID);
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	
	}

}
