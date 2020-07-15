package course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import evaluation.EvaluationDTO;
import util.DatabaseUtil;

public class CourseDAO {
	String usrID;
	public CourseDAO(String usrID) {
		this.usrID = usrID;
	}
	public CourseDAO() {
		
	}
	
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
					rs.getString(12),
					rs.getString(13),
					rs.getInt(14),
					rs.getInt(15),
					rs.getInt(16),
					rs.getString(17),
					rs.getString(6),
					rs.getString(7),
					rs.getString(8),
					rs.getString(9),
					rs.getString(10),
					rs.getInt(11)
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
	
	public ArrayList<CourseDTO> exceptEnroll(int year, int semester, ArrayList<CourseDTO> courseList){
		ArrayList<CourseDTO> enrolledCourse = enrolled(this.usrID, year, semester);
//		ArrayList<CourseDTO> result = null;
		for(int i=0;i<enrolledCourse.size();i++) {
			for(int j=0;j<courseList.size();j++) {
				if(enrolledCourse.get(i).getCourseNo() == courseList.get(j).getCourseNo()) {
					courseList.remove(j);
				}
			}
		}
		
		return courseList;
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
						rs.getString(11),
						rs.getString(12),
						rs.getInt(13),
						rs.getInt(14),
						rs.getInt(15),
						rs.getString(16),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getInt(10)
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
		String SQL = "SELECT * FROM Teach NATURAL JOIN Course WHERE Teach.year = ? AND Teach.semester = ? AND Course.category LIKE '전공%' AND Course.major = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, year);
			pstmt.setInt(2, semester);
			pstmt.setString(3, major);
			
			rs = pstmt.executeQuery();
			courseList = new ArrayList<CourseDTO>();
			while(rs.next()) {
				CourseDTO course = new CourseDTO(
						rs.getInt(7),
						rs.getInt(8),
						rs.getInt(1),
						rs.getInt(9),
						null,
						rs.getString(11),
						rs.getString(12),
						rs.getInt(13),
						rs.getInt(14),
						rs.getInt(15),
						rs.getString(16),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getInt(10)					
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
		
		return exceptEnroll(year, semester, courseList);
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
						rs.getString(11),
						rs.getString(12),
						rs.getInt(13),
						rs.getInt(14),
						rs.getInt(15),
						rs.getString(16),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getInt(10)					
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
		
		return exceptEnroll(year, semester, courseList);
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
						rs.getString(11),
						rs.getString(12),
						rs.getInt(13),
						rs.getInt(14),
						rs.getInt(15),
						rs.getString(16),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getInt(10)						
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
		
		return exceptEnroll(year, semester, courseList);
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
						rs.getString(11),
						rs.getString(12),
						rs.getInt(13),
						rs.getInt(14),
						rs.getInt(15),
						rs.getString(16),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getInt(10)						
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
		
		return exceptEnroll(year, semester, courseList);
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
		String SQL = "INSERT INTO Course VALUES (?, ?, ?, ?, ?, ?, NULL)";
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
	
	public int delete(String studentID, int courseNo, int classNo, int year, int semester) {
		String SQL = "DELETE FROM Enroll WHERE studentID = ? AND year = ? AND semester = ? AND courseNo = ? AND classNo = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, studentID);
			pstmt.setInt(2, year);
			pstmt.setInt(3, semester);
			pstmt.setInt(4, courseNo);
			pstmt.setInt(5, classNo);
			return pstmt.executeUpdate(); //
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
		}
		return -1;
	}
	
	public int insert(String studentID, int courseNo, int classNo, int year, int semester) {
		String SQL = "INSERT INTO Enroll (studentID, year, semester, courseNo, classNo) VALUES (?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, studentID);
			pstmt.setInt(2, year);
			pstmt.setInt(3, semester);
			pstmt.setInt(4, courseNo);
			pstmt.setInt(5, classNo);
			return pstmt.executeUpdate(); //
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
		}
		return -1;
	}
}
