package teach;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import course.CourseDTO;
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
							rs.getInt(10),
							rs.getString(11),
							rs.getString(12),
							rs.getInt(13),
							rs.getInt(14),
							rs.getInt(15),
							rs.getString(16));
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
	
	

	public int write(TeachDTO teachDTO) {
		String SQL = "INSERT INTO TEACH VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int classNo = classNoCheck(teachDTO.getCourseNo());
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, teachDTO.getProf());
			pstmt.setString(2, teachDTO.getRoom());
			pstmt.setString(3, teachDTO.getDay());
			pstmt.setString(4, teachDTO.getStartTime());
			pstmt.setString(5, teachDTO.getEndTime());
			pstmt.setInt(6, teachDTO.getYear());
			pstmt.setInt(7, teachDTO.getSemester());
			pstmt.setInt(8, teachDTO.getCourseNo());
			pstmt.setInt(9, classNo);
			pstmt.setInt(10, teachDTO.getNum());
			return pstmt.executeUpdate(); //
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return -1; 
	}
	
	public int getCourseInfo(String courseName){
		System.out.println("getcourseinfno : " + courseName);
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			try {
				SQL = "SELECT courseNo FROM Course WHERE courseName = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, courseName);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					if(rs != null)
						return rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
				try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
				try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
			}
			
		return -1;
	}
	
	public static int classNoCheck(int courseNo) {
		String SQL = "SELECT max(classNo) FROM teach WHERE courseNo = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, courseNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				return rs.getInt(1) + 1;
			}
		} catch(Exception e) {
			e.printStackTrace();
		};
		return 1;
	}
}
