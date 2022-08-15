package user;
// DTO = 데이터 트랜스펄 오브젝트의 약자
// JSP프로그램 안에서 데이터를 담기 위한 객체
public class userDTO {
	
	private String name;
	private String userID;
	private String pw;
	private String ph1;
	private String ph2;
	private String ph3;
	private int checknum;
	private boolean checked;
	private String addr;
	private int uc;
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getUserID() {
		return userID;
	}


	public void setId(String userID) {
		this.userID = userID;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getPh1() {
		return ph1;
	}


	public void setPh1(String ph1) {
		this.ph1 = ph1;
	}


	public String getPh2() {
		return ph2;
	}


	public void setPh2(String ph2) {
		this.ph2 = ph2;
	}


	public String getPh3() {
		return ph3;
	}


	public void setPh3(String ph3) {
		this.ph3 = ph3;
	}


	public int getChecknum() {
		return checknum;
	}


	public void setChecknum(int checknum) {
		this.checknum = checknum;
	}


	public boolean isChecked() {
		return checked;
	}


	public void setChecked(boolean checked) {
		this.checked = checked;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public int getUc() {
		return uc;
	}


	public void setUc(int uc) {
		this.uc = uc;
	}


	public userDTO() {
	}


	public userDTO(String name, String userID, String pw, String ph1, String ph2, String ph3, int checknum, boolean checked, String addr, int uc) {
		super();
		this.name = name;
		this.userID = userID;
		this.pw = pw;
		this.ph1 = ph1;
		this.ph2 = ph2;
		this.ph3 = ph3;
		this.checknum = checknum;
		this.checked = checked;
		this.addr = addr;
		this.uc = uc;
	}

	/*
	public userDTO(String userID, String userPassword, String userEmail, String userCall1, String userCall2, String userCall3) {
		super();
		this.userID = userID;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.userCall1 = userCall1;
		this.userCall2 = userCall2;
		this.userCall3 = userCall3;
	}
*/	
}
