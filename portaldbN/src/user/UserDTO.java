package user;

public class UserDTO {
	String usrID;
	String usrPW;
	int isStudent;

	public String getUsrID() {
		return usrID;
	}
	public void setUsrID(String usrID) {
		this.usrID = usrID;
	}
	public String getUsrPW() {
		return usrPW;
	}
	public void setUsrPW(String usrPW) {
		this.usrPW = usrPW;
	}
	public int getIsStudent() {
		return isStudent;
	}
	public void setIsStudent(int isStudent) {
		this.isStudent = isStudent;
	}
	
	public UserDTO() {
		
	}
	
	public UserDTO(String usrID, String usrPW, int isStudent) {
		super();
		this.usrID = usrID;
		this.usrPW = usrPW;
		this.isStudent = isStudent;
	}
	
}
