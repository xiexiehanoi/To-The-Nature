package nature.payment;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import nature.user.UserDto;


@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	@PostMapping("/payment")
	@ResponseBody 
	public void payment(@ModelAttribute PaymentDto paymentDto) {
		 System.out.println(paymentDto.toString());
		 paymentService.payment(paymentDto);
		
	}
	
}