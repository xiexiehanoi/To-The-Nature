package nature.reservation;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nature.user.UserDto;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@PostMapping("/reservation/page")
	public String reservationPage(@ModelAttribute ReservationDto rDto,  @RequestParam String CampsiteName, @RequestParam String userid, Model model) {
		//현재날짜를 생성
		LocalDate currentDate = LocalDate.now();
		String startDateStr =rDto.getStartDate();
		String andDateStr =rDto.getEndDate();
		
		//문자열을 LocalDate로 변환
		LocalDate startDate = LocalDate.parse(startDateStr);
		LocalDate endDate = LocalDate.parse(andDateStr);
		//남은 일수 계산
		int reservationdays = startDate.until(endDate).getDays();
		int remainingDays =currentDate.until(startDate).getDays();
		//남은 방 개수 가져오기
		int roomCount=reservationService.roomCount(rDto.getCamping_num());
		//로그인한 유저 정보 가져오기
		UserDto userDto =reservationService.getUser(userid);
		
		model.addAttribute("userDto",userDto);
		model.addAttribute("rDto",rDto);
		model.addAttribute("remainingDays",remainingDays);
		model.addAttribute("reservationdays",reservationdays);
		model.addAttribute("CampsiteName",CampsiteName);
		model.addAttribute("roomCount",roomCount);
		System.out.println(rDto.toString());
//		return "reservation/reservation.reservation";
		return "reservation/reservation";
	}
	
	@PostMapping("/reservation")
	public void reservation() {
		
	}
	

}
