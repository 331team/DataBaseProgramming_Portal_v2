package user;

public class UserDTO {
	int isStudent;
	String major;
	String name;
	String usrPW;
	String usrID;
	String usrEmail;
	String usrEmailHash;
	int usrEmailChecked;
	public int getIsStudent() {
		return isStudent;
	}
	public void setIsStudent(int isStudent) {
		this.isStudent = isStudent;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsrPW() {
		return usrPW;
	}
	public void setUsrPW(String usrPW) {
		this.usrPW = usrPW;
	}
	public String getUsrID() {
		return usrID;
	}
	public void setUsrID(String usrID) {
		this.usrID = usrID;
	}
	public String getUsrEmail() {
		return usrEmail;
	}
	public void setUsrEmail(String usrEmail) {
		this.usrEmail = usrEmail;
	}
	public String getUsrEmailHash() {
		return usrEmailHash;
	}
	public void setUsrEmailHash(String usrEmailHash) {
		this.usrEmailHash = usrEmailHash;
	}
	public int getUsrEmailChecked() {
		return usrEmailChecked;
	}
	public void setUsrEmailChecked(int usrEmailChecked) {
		this.usrEmailChecked = usrEmailChecked;
	}
	
	public UserDTO() {
		;
	}
	
	public UserDTO(int isStudent, String major, String name, String usrPW, String usrID, String usrEmail,
			String usrEmailHash, int usrEmailChecked) {
		super();
		this.isStudent = isStudent;
		this.major = major;
		this.name = name;
		this.usrPW = usrPW;
		this.usrID = usrID;
		this.usrEmail = usrEmail;
		this.usrEmailHash = usrEmailHash;
		this.usrEmailChecked = usrEmailChecked;
	}
	
	
	
}