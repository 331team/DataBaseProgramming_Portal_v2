package teach;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import teach.TeachDTO;
import evaluation.EvaluationDTO;
import user.UserDTO;
import util.DatabaseUtil;

public class TeachDAO {
	
	public ArrayList<TeachDTO> getList(){
		ArrayList<TeachDTO> teachList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			try {
				SQL = "SELECT * FROM Teach NATURAL JOIN Course LIMIT 10";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				teachList = new ArrayList<TeachDTO>();
				while(rs.next()) {
					TeachDTO teach = new TeachDTO(
							rs.getInt(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getString(5),
							rs.getString(6),
							rs.getInt(7),
							rs.getInt(8),
							rs.getInt(9),
							rs.getString(10),
							rs.getString(11),
							rs.getInt(12),
							rs.getInt(13),
							rs.getInt(14),
							rs.getString(15));
					teachList.add(teach);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
				try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
				try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
			}
			
		return teachList;
	}
/*	
	public int write(TeachDTO teachDTO) {
		String SQL = "INSERT INTO COURSE VALUES (?, ?, ?, ?, ?, ?, NULL)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, teachDTO.getCategory());
			pstmt.setString(2, teachDTO.getMajor());
			pstmt.setInt(3, teachDTO.getCredit());
			pstmt.setInt(4, teachDTO.getCyber());
			pstmt.setInt(5, teachDTO.getPF());
			pstmt.setString(6, teachDTO.getTeachName());
			return pstmt.executeUpdate(); //
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return -1; 
	}*/
}
