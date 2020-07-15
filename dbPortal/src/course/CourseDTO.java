package course;

public class CourseDTO {
	int year; 
	int semester; 
	int courseNo; 
	int classNo; 
	String studentID;
	String category; 
	String major; 
	int credit; 
	int PF; 
	int cyber; 
	String courseName; 
	String prof; 
	String room; 
	String day; 
	String startTime; 
	String endTime;
	public CourseDTO(int year, int semester, int courseNo, int classNo, String studentID, 
			String category, String major, int credit, int PF, int cyber, String courseName, 
			String prof, String room, String day, String startTime, String endTime){
		this.year = year;
		this.semester =  semester;
		this.courseNo = courseNo;
		this.classNo = classNo;
		this.studentID = studentID; 
		this.category = category;
		this.major = major;
		this.credit = credit;
		this.PF = PF;
		this.cyber = cyber;
		this.courseName = courseName; 
		this.prof = prof;
		this.room = room;
		this.day = day;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	
	// get/set Info
	public int getYear() {
		return year;
	}
	
	public int getSemester() {
		return semester;
	}
	
	public int getCourseNo() {
		return courseNo;
	}
	
	public int getClassNo() {
		return classNo;
	}
	
	public String getStudentID() {
		return studentID;
	}
	
	public String getCategory() {
		return category;
	}
	
	public String getMajor() {
		return major;
	}
	
	public int getCredit() {
		return credit;
	}
	
	public int getPF() {
		return PF;
	}
	
	public int getCyber() {
		return cyber;
	}
	
	public String getCourseName() {
		return courseName;
	}
	
	public String getProf() {
		return prof;
	}
	
	public String getRoom() {
		return room;
	}
	
	public String getDay() {
		return day;
	}
	
	public String getStartTime() {
		return startTime;
	}
	
	public String getEndTime() {
		return endTime;
	}
	
	public CourseDTO(String category, String major, int credit, int PF, int cyber, String courseName, int courseNo) {
		super();
		this.courseNo = courseNo;
		this.category = category;
		this.major = major;
		this.credit = credit;
		this.PF = PF;
		this.cyber = cyber;
		this.courseName = courseName;
	}
	
}
