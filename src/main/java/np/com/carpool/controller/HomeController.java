package np.com.carpool.controller;

import np.com.carpool.domain.User;
import np.com.carpool.utils.SpringUtils;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
    
    @RequestMapping(value = {"/", "/login"}, method = RequestMethod.GET)
    public String login(@ModelAttribute("user") User user) {
        return "index";
    }

    }
