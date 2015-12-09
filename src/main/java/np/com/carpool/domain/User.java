package np.com.carpool.domain;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Transient;




@Entity(name = "users")
public class User implements Serializable{
	
	private static final long serialVersionUID = -8624607622331341029L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
		
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}


	//@NotEmpty(message ="{NotEmpty.user.username}")
	//@Size(min=4, message="{Size.user.username}")
	@Column(name = "username")
	private String username;
	//@NotEmpty(message ="{NotEmpty.user.password}")
	//@Size(min=4, message="{Size.user.password}")
	@Column(name = "password")
	private String password;
	
	private boolean enabled= true;
	
	@Enumerated(EnumType.STRING)
	private Role role = Role.ROLE_ADMIN;
	
	@Transient
	private String pwdRepeat;
	/*
	@Column(name="trip_id")
	@OneToOne
	//@JoinColumn(name="trip_id")
	private Trip trip;*/
	
	
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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

	

	public enum Role {
		ROLE_ADMIN, ROLE_USER
	}
}
