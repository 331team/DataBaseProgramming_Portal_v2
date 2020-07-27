package teach;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import teach.TeachDTO;
import util.DatabaseUtil;

public class TeachDAO {
	//모든 분반 목록 보기
	public ArrayList<TeachDTO> getList(String category, String major, String search, int pageNumber){
		if(category.equals("전체")) {
			category = "";
		}
		if(major.equals("전체")) {
			major = "";
		}
		ArrayList<TeachDTO> teachList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			try {
				SQL = "SELECT * FROM Teach NATURAL JOIN Course WHERE category LIKE ? "
						+ "AND major LIKE ? AND CONCAT(courseName, prof, room) LIKE ? ORDER BY courseNo DESC LIMIT " + pageNumber * 10 + ", " + pageNumber * 10 + 11;
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,  "%" + category + "%");
				pstmt.setString(2, "%" + major + "%");
				pstmt.setString(3, "%" + search + "%");
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
	
	//게시글 가져오기
	public TeachDTO getTeach(int courseNo, int semester, int year, int classNo){
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			try {
				SQL = "SELECT * FROM Teach NATURAL JOIN Course WHERE courseNo = ? AND semester = ? AND year = ? AND classNo = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, courseNo);
				pstmt.setInt(2, semester);
				pstmt.setInt(3, year);
				pstmt.setInt(4, classNo);
				rs = pstmt.executeQuery();
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
					return teach;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
				try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
				try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
			}
			
		return null;
	}
	
	/*
	public static ArrayList<TeachDTO> getTeachList(String prof){
		ArrayList<TeachDTO> teachList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			try {
				SQL = "SELECT * FROM Teach WHERE prof = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				teachList = new ArrayList<TeachDTO>();
				while(rs.next()) {
					TeachDTO teach = new TeachDTO(
							rs.getString(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getString(5),
							rs.getInt(6),
							rs.getInt(7),
							rs.getInt(8),
							rs.getInt(9),
							rs.getInt(10));
					teachList.add(teach);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
				try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
				try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
			}
			
		for(int i = 0; i<teachList.size(); i++) {
			System.out.println(teachList.get(1).getDay());
		}
		return teachList;
	}
	*/
	//분반 추가
	public int write(TeachDTO teachDTO) {
		String SQL = "INSERT INTO TEACH VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int classNo = classNoCheck(teachDTO.getCourseNo());
		if(check(teachDTO)) {
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
		} else {
			return -2; // 중복
		}
		return -1; 
	}
	private boolean check(TeachDTO teachDTO) {
		// TODO Auto-generated method stub
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			try {
				SQL = "SELECT * FROM Teach";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					if(compareDay(rs.getString(3), teachDTO.getDay())) {
						int startTime1 = Integer.parseInt(rs.getString(4));
						int endTime1 = Integer.parseInt(rs.getString(5));
						int startTime2 = Integer.parseInt(teachDTO.getStartTime());
						int endTime2 = Integer.parseInt(teachDTO.getEndTime());
						if(compareTime(startTime1, endTime1, startTime2, endTime2)) {
							if(compareProf(rs.getString(1), teachDTO.getProf()))
								return false;
							else if(compareRoom(rs.getString(2), teachDTO.getRoom()))
								return false;
						}
					}
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
				try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
				try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
			}
			
		return true;
	}

	//insertionTeach에서 write시 courseName만으로 정보를 가져와 courseNo를 반환해 생성자 사용
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
	//분반 번호
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
	
	
	//요일비교
	public static boolean compareDay(String day1, String day2) {
		System.out.println(day1);
		System.out.println(day2);
		for(int i=0;i<day1.length();i++) {
			for(int j=0;j<day2.length();j++) {
				if(day1.charAt(i) == day2.charAt(j)) {
					return true;
				}
			}
		}
		return false;
	}
	//시간비교
	public static boolean compareTime(int startTime1, int endTime1, int startTime2, int endTime2) {
		if(startTime1 > endTime2 || endTime1 < startTime2)
			return false;
		return true;
	}
	//교수비교
	public static boolean compareProf(String prof1, String prof2) {
		if(prof2.equals(prof1))
			return false;
		return true;
	}
	//장소비교
		public static boolean compareRoom(String room1, String room2) {
			if(room2.equals(room1))
				return false;
			return true;
		}
	
	//분반 삭제
	public int delete(String courseNo, String classNo, String year, String semester) {
		String SQL = "DELETE FROM teach WHERE courseNo = ? AND classNo = ? AND year = ? AND semester = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println(courseNo + " " + classNo + " " + year + " " + semester);
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,Integer.parseInt(courseNo));
			pstmt.setInt(2,Integer.parseInt(classNo));
			pstmt.setInt(3,Integer.parseInt(year));
			pstmt.setInt(4,Integer.parseInt(semester));
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //데이터베이스 오류
	}
}
