package nature.site;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nature.reservation.ReservationDto;
import nature.user.UserDto;


@Controller
public class SiteController {
	
	@Autowired
	private SiteService siteService;
	
	@GetMapping("/detail")
	public String detail(HttpSession session,
						Model model,
						@RequestParam String userId, 
						@RequestParam int num) {
		
	    // 필요한 로직 수행
	    Map<String, Object> siteParam = new HashMap<>();
	    siteParam.put("userId", userId);
	    siteParam.put("campingNum", num);
	    
	    //로그인한 유저 정보 가져오기
	    UserDto userDto =siteService.getUser(userId);
	    /*int userNum = userDto.getUsernum();*/
	    
	  //구매유저 정보 가져오기
		
		 /*Map<String, Object> reservationParam = new HashMap<>(); 
		 reservationParam.put("userNum", userNum); 
		 reservationParam.put("campingNum", num); 
		 ReservationDto reservationDto = siteService.checkPaidUser(reservationParam);*/ 
		 
	    List<Map<String, Object>> campinglist = siteService.getsearchcamping(siteParam);
	    
	    model.addAttribute("campinglist", campinglist);
	    model.addAttribute("userId", userId);
	    model.addAttribute("userDto", userDto);
	    model.addAttribute("campingNum", num);
		/*model.addAttribute("reservationDto", reservationDto);*/
	    
	    return "detail/detail.site";
	}
}
