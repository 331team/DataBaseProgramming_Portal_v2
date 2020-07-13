package evaluation;

public class EvaluationDTO {
	
	int evaluationID;
	String usrID;
	String courseName;
	String professorName;
	int year;
	String semester;
	String category;
	String evaluationTitle;
	String evaluationContent;
	String totalScore;
	String creditScore;
	String homeworkScore;
	String lectureScore;
	int likeCount;
	public int getEvaluationID() {
		return evaluationID;
	}
	public void setEvaluationID(int evaluationID) {
		this.evaluationID = evaluationID;
	}
	public String getUsrID() {
		return usrID;
	}
	public void setUsrID(String usrID) {
		this.usrID = usrID;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getProfessorName() {
		return professorName;
	}
	public void setProfessorName(String professorName) {
		this.professorName = professorName;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getEvaluationTitle() {
		return evaluationTitle;
	}
	public void setEvaluationTitle(String evaluationTitle) {
		this.evaluationTitle = evaluationTitle;
	}
	public String getEvaluationContent() {
		return evaluationContent;
	}
	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	public String getCreditScore() {
		return creditScore;
	}
	public void setCreditScore(String creditScore) {
		this.creditScore = creditScore;
	}
	public String getHomeworkScore() {
		return homeworkScore;
	}
	public void setHomeworkScore(String homeworkScore) {
		this.homeworkScore = homeworkScore;
	}
	public String getLectureScore() {
		return lectureScore;
	}
	public void setLectureScore(String lectureScore) {
		this.lectureScore = lectureScore;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	public EvaluationDTO() {
		
	}
	public EvaluationDTO(int evaluationID, String usrID, String courseName, String professorName, int year,
			String semester, String category, String evaluationTitle, String evaluationContent, String totalScore,
			String creditScore, String homeworkScore, String lectureScore, int likeCount) {
		super();
		this.evaluationID = evaluationID;
		this.usrID = usrID;
		this.courseName = courseName;
		this.professorName = professorName;
		this.year = year;
		this.semester = semester;
		this.category = category;
		this.evaluationTitle = evaluationTitle;
		this.evaluationContent = evaluationContent;
		this.totalScore = totalScore;
		this.creditScore = creditScore;
		this.homeworkScore = homeworkScore;
		this.lectureScore = lectureScore;
		this.likeCount = likeCount;
	}
	
}