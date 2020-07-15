package teach;

public class TeachDTO {
	String prof;
	String room;
	String day;
	String startTime;
	String endTime;
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

	
	public String getProf() {
		return prof;
	}
	public void setProf(String prof) {
		this.prof = prof;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public int getPF() {
		return PF;
	}
	public void setPF(int pF) {
		PF = pF;
	}
	public int getCyber() {
		return cyber;
	}
	public void setCyber(int cyber) {
		this.cyber = cyber;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	
	public TeachDTO(String prof, String room, String day, String startTime, String endTime, int year, int semester,
			int courseNo, int classNo) {
		super();
		this.prof = prof;
		this.room = room;
		this.day = day;
		this.startTime = startTime;
		this.endTime = endTime;
		this.year = year;
		this.semester = semester;
		this.courseNo = courseNo;
		this.classNo = classNo;
	}
	
	public TeachDTO(int courseNo, String prof, String room,
			String day, String startTime, String endTime,
			int year, int semester, String category, int classNo,
			String major, int credit, int PF, int cyber, String courseName ){
		this.courseNo = courseNo;
		this.prof = prof;
		this.room = room;
		this.day = day;
		this.startTime = startTime;
		this.endTime = endTime;
		this.year = year;
		this.semester =  semester;
		this.category = category;
		this.classNo = classNo;
		this.major = major;
		this.credit = credit;
		this.PF = PF;
		this.cyber = cyber;
		this.courseName = courseName; 
		
		
		
	}
	
	
}
