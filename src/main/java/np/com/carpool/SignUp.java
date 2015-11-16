package np.com.carpool;

import np.com.carpool.domain.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/register")
public class SignUp {

	@RequestMapping(method=RequestMethod.GET)
	public String getRegistered(){		
		return "registrationSuccess";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String postRegistered(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes){
		redirectAttributes.addFlashAttribute("user", user);
		return "redirect:/register";
	}
	
	
}
