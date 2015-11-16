package np.com.carpool.domain;


public class User {
	
	private String email;
	private String password;
	private String pwdRepeat;
	
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getPwdRepeat() {
		return pwdRepeat;
	}
	public void setPwdRepeat(String pwdRepeat) {
		this.pwdRepeat = pwdRepeat;
	}
	
}
