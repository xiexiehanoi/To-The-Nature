package nature.payment;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nature.user.UserDto;


@Controller
public class PaymentController {
	@PostMapping("/payment")
	public String payment(@ModelAttribute UserDto userDto,@ModelAttribute String CampsiteName) {
		
		return "payment/payment";
		
	}
	
}
	
	
	        
	    
	    

