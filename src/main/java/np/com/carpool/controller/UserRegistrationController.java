package np.com.carpool.controller;

import np.com.carpool.domain.User;
import np.com.carpool.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/register")
public class UserRegistrationController {
	
	@Autowired
	UserService userService;

	@RequestMapping(method=RequestMethod.GET)
	public String getRegistered(){		
		return "registrationSuccess";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String postRegistered(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes){
	
		try{
			userService.add(user);
		}
		catch(Exception ex){
			System.out.println(ex);
		}
		redirectAttributes.addFlashAttribute("user", user);
		return "redirect:/register";
	}
	
	
}
