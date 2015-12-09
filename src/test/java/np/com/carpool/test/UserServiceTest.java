package np.com.carpool.test;

import np.com.carpool.domain.User;
import np.com.carpool.service.UserService;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UserServiceTest extends BaseTest {
	
	@Autowired
	private UserService userService;
	
	@Test
	public void addTest(){
		User user = new User();
		user.setUsername("bharat");
		user.setPassword("password");
		user.setPwdRepeat("password");
		userService.add(user);
		User u = userService.findAll().get(0);
		Assert.assertEquals("bharat", u.getUsername());
	}

}
