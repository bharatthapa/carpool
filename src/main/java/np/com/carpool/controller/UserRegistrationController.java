package np.com.carpool.controller;

import np.com.carpool.domain.User;
import np.com.carpool.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserRegistrationController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public User postRegistered(User user) {

		System.out.println("test");
		try {
			System.out.println("ID Before Saving "+user.getId());
			userService.add(user);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		System.out.println("Username "+user.getUsername());
		System.out.println("Password "+user.getPassword());
		System.out.println("ID "+user.getId());
		
		return user;

	}

}