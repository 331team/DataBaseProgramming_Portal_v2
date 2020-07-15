package course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import evaluation.EvaluationDTO;
import user.UserDTO;
import util.DatabaseUtil;

public class CourseDAO {
	public ArrayList<CourseDTO> enrolled(String usrID, int year, int semester){
		ArrayList<CourseDTO> enrolledList = null;
		String SQL = "SELECT * FROM Enroll NATURAL JOIN Teach NATURAL JOIN Course WHERE Enroll.studentID = ? AND Enroll.year = ? AND Enroll.semester = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, usrID);
			pstmt.setInt(2, year);
			pstmt.setInt(3, semester);
			
			rs = pstmt.executeQuery();
			enrolledList = new ArrayList<CourseDTO>();
			while(rs.next()) {
				CourseDTO course = new CourseDTO(
					rs.getInt(2),
					rs.getInt(3),
					rs.getInt(1),
					rs.getInt(4),
					rs.getString(5),
					rs.getString(11),
					rs.getString(12),
					rs.getInt(13),
					rs.getInt(14),
					rs.getInt(15),
					rs.getString(16),
					rs.getString(6),
					rs.getString(7),
					rs.getString(8),
					rs.getString(9),
					rs.getString(10)					
				);
				enrolledList.add(course);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return enrolledList;
	}
	public ArrayList<CourseDTO> getCourse(int year, int semester){
		ArrayList<CourseDTO> enrolledList = null;
		String SQL = "SELECT * FROM Teach NATURAL JOIN Course WHERE AND Enroll.year = ? AND Enroll.semester = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, year);
			pstmt.setInt(2, semester);
			
			rs = pstmt.executeQuery();
			enrolledList = new ArrayList<CourseDTO>();
			while(rs.next()) {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return enrolledList;
	}
	
	public ArrayList<CourseDTO> getList(){
		ArrayList<CourseDTO> courseList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			try {
				SQL = "SELECT * FROM Course LIMIT 10";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				courseList = new ArrayList<CourseDTO>();
				while(rs.next()) {
					CourseDTO course = new CourseDTO(
							rs.getString(1),
							rs.getString(2),
							rs.getInt(3),
							rs.getInt(4),
							rs.getInt(5),
							rs.getString(6),
							rs.getInt(7));
					courseList.add(course);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
				try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
				try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
			}
			
		return courseList; // 실패하면 null값이 들어가 있을 것
	}
	
	public int write(CourseDTO courseDTO) {
		String SQL = "INSERT INTO COURSE VALUES (?, ?, ?, ?, ?, ?, NULL)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, courseDTO.getCategory());
			pstmt.setString(2, courseDTO.getMajor());
			pstmt.setInt(3, courseDTO.getCredit());
			pstmt.setInt(4, courseDTO.getCyber());
			pstmt.setInt(5, courseDTO.getPF());
			pstmt.setString(6, courseDTO.getCourseName());
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
}
