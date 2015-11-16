package np.com.carpool.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity(name = "users")
public class User implements Serializable{
	
	private static final long serialVersionUID = -8624607622331341029L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(name = "email")
	private String email;
	
	@Column(name = "password")
	private String password;
	
	@Transient
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
