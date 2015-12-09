package np.com.carpool.controller;

import java.util.List;

import np.com.carpool.domain.Trip;
import np.com.carpool.service.TripService;
import np.com.carpool.utils.SpringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/secure")
public class DashboardController {

	@Autowired
     TripService tripService;

    @RequestMapping(value="/dashboard", method = RequestMethod.GET)
    public String home(Model model){
    	String username = SpringUtils.getUserName();
    	model.addAttribute("username", username);
    	return "dashboard";
    }
	
	@RequestMapping(method=RequestMethod.GET, value="/getTrip")
	public String getTripForm(Model model){
		System.out.println("hello in get Trip Form");
		String username = SpringUtils.getUserName();
    	model.addAttribute("username", username);
		return "formTrip";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/addTrip",
			produces = {MediaType.TEXT_PLAIN_VALUE},
			consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE} 
			/*headers = "accept=application/json, application/xml"*/)
	public @ResponseBody String addTrip(@RequestBody Trip trip){
		
		System.out.println(trip.getFirstName());
		System.out.println("inside addtrip method");
		tripService.add(trip);
		
		return "Trip successfully added in database";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/myTripsForm")
	public String myTripsForm(Model model){
		
		String username = SpringUtils.getUserName();
    	model.addAttribute("username", username);
		System.out.println("my trips form");
		
		return "myTrips";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/fetchMyTrips",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody List<Trip> myTrips(){
		
		System.out.println("find all controller1");
		//System.out.println("all trips" + tripService.findAll());
		System.out.println("find all controller2");
		//System.out.println(tripService.findAll());
		return tripService.findAll();
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/deleteTrip")
	public @ResponseBody String deleteTrip(@RequestParam("tripId") String tripId){
		
		tripService.remove(Long.parseLong(tripId));
		System.out.println("deleted successfully");
		return "success";
	}
	
}