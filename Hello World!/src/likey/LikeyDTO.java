package likey;

public class LikeyDTO {

	String usrID;
	int evaluationID;
	String usrIP;

	public String getUsrID() {
		return usrID;
	}
	public void setUsrID(String usrID) {
		this.usrID = usrID;
	}
	public int getEvaluationID() {
		return evaluationID;
	}
	public void setEvaluationID(int evaluationID) {
		this.evaluationID = evaluationID;
	}
	public String getusrIP() {
		return usrIP;
	}

	public void setusrIP(String usrIP) {
		this.usrIP = usrIP;
	}

	public LikeyDTO(String usrID, int evaluationID, String usrIP) {
		this.usrID = usrID;
		this.evaluationID = evaluationID;
		this.usrIP = usrIP;
	}

}