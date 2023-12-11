package nature.mypage;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MypageController {
	
	@Autowired
	private MypageDao mypageDao;
	
	@GetMapping("/mypage/main")
	public String mypage() {
		
		return "mypage/mypagemain";
	}
	
	@GetMapping("/mypage/reservation")
	public String myreservation() {
		
		return "mypage/myreservation";
	}
	
	@GetMapping("/mypage/review")
	public String myreview() {
		
		return "mypage/myreview";
	}
	
	@GetMapping("/mypage/cs")
	public String mycs() {
		
		return "mypage/mycs";
	}
	
	@GetMapping("/mypage/account")
	public String myaccount() {
		
		return "mypage/myaccount";
	}
	
}
