package course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import evaluation.EvaluationDTO;
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
		String SQL = "SELECT * FROM Teach NATURAL JOIN Course WHERE Enroll.year = ? AND Enroll.semester = ?";
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
				CourseDTO course = new CourseDTO(
						rs.getInt(7),
						rs.getInt(8),
						rs.getInt(1),
						rs.getInt(9),
						null,
						rs.getString(10),
						rs.getString(11),
						rs.getInt(12),
						rs.getInt(13),
						rs.getInt(14),
						rs.getString(15),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6)						
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
	
	public ArrayList<CourseDTO> getMajorCourse(String major, int year, int semester){
		ArrayList<CourseDTO> courseList = null;
		String SQL = "SELECT * FROM Teach NATURAL JOIN Course WHERE Teach.year = ? AND Teach.semester = ? AND Course.category LIKE '전공%'";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, year);
			pstmt.setInt(2, semester);
			
			rs = pstmt.executeQuery();
			courseList = new ArrayList<CourseDTO>();
			while(rs.next()) {
				CourseDTO course = new CourseDTO(
						rs.getInt(7),
						rs.getInt(8),
						rs.getInt(1),
						rs.getInt(9),
						null,
						rs.getString(10),
						rs.getString(11),
						rs.getInt(12),
						rs.getInt(13),
						rs.getInt(14),
						rs.getString(15),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6)					
					);
					courseList.add(course);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return courseList;
	}
	
	public ArrayList<CourseDTO> getGenCourse(int year, int semester){
		ArrayList<CourseDTO> courseList = null;
		String SQL = "SELECT * FROM Teach NATURAL JOIN Course WHERE Teach.year = ? AND Teach.semester = ? AND Course.category LIKE '교양%'";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, year);
			pstmt.setInt(2, semester);
			
			rs = pstmt.executeQuery();
			courseList = new ArrayList<CourseDTO>();
			while(rs.next()) {
				CourseDTO course = new CourseDTO(
						rs.getInt(7),
						rs.getInt(8),
						rs.getInt(1),
						rs.getInt(9),
						null,
						rs.getString(10),
						rs.getString(11),
						rs.getInt(12),
						rs.getInt(13),
						rs.getInt(14),
						rs.getString(15),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6)						
					);
					courseList.add(course);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return courseList;
	}
	
	public ArrayList<CourseDTO> getPfCourse(int year, int semester){
		ArrayList<CourseDTO> courseList = null;
		String SQL = "SELECT * FROM Teach NATURAL JOIN Course WHERE Teach.year = ? AND Teach.semester = ? AND Course.PF = 1";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, year);
			pstmt.setInt(2, semester);
			
			rs = pstmt.executeQuery();
			courseList = new ArrayList<CourseDTO>();
			while(rs.next()) {
				CourseDTO course = new CourseDTO(
						rs.getInt(7),
						rs.getInt(8),
						rs.getInt(1),
						rs.getInt(9),
						null,
						rs.getString(10),
						rs.getString(11),
						rs.getInt(12),
						rs.getInt(13),
						rs.getInt(14),
						rs.getString(15),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6)						
					);
					courseList.add(course);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return courseList;
	}
	public ArrayList<CourseDTO> getCyberCourse(int year, int semester){
		ArrayList<CourseDTO> courseList = null;
		String SQL = "SELECT * FROM Teach NATURAL JOIN Course WHERE Teach.year = ? AND Teach.semester = ? AND Course.cyber = 1";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, year);
			pstmt.setInt(2, semester);
			
			rs = pstmt.executeQuery();
			courseList = new ArrayList<CourseDTO>();
			while(rs.next()) {
				CourseDTO course = new CourseDTO(
						rs.getInt(7),
						rs.getInt(8),
						rs.getInt(1),
						rs.getInt(9),
						null,
						rs.getString(10),
						rs.getString(11),
						rs.getInt(12),
						rs.getInt(13),
						rs.getInt(14),
						rs.getString(15),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6)						
					);
					courseList.add(course);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		
		return courseList;
	}
}
