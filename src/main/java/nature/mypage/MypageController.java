package nature.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MypageController {
	
	@Autowired
	private MypageDao mypageDao;
	
	@Autowired
	private MypageService mypageService;
	
	@GetMapping("/mypage/main")
	public String mypage() {
		
		return "mypage/mypagemain";
	}
	
	@GetMapping("/mypage/reservation")
	public String myreservation() {
		
		return "mypage/myreservation";
	}
	
	@GetMapping("/mypage/review")
	public String myreview(HttpSession session, Model model) {
	    String userId = (String) session.getAttribute("userid");
	    
	    // Call the service method to get reviews by user ID
	    //List<MypageDto> userReviews = mypageService.getReviewsByUserId(userId);
	    List<Map<String, Object>> userReviews = mypageService.getReviewsByUserId(userId);
	    
	    // Add the reviews to the model
	    model.addAttribute("userReviews", userReviews);
	    model.addAttribute("totalCount", mypageService.getTotalCount());
	    return "mypage/myreview";
	}
	
	@GetMapping("/mypage/change")
	public String mychange(HttpSession session, Model model) {
	    String userId = (String) session.getAttribute("userid");

	    // 사용자 정보를 가져오기
	    List<Map<String, Object>> userInfoList = mypageService.getUserInfoByUserId(userId);

	    // 사용자 정보가 존재하면 모델에 추가
	    if (!userInfoList.isEmpty()) {
	        Map<String, Object> userInfo = userInfoList.get(0);
	        model.addAttribute("usergender", userInfo.get("usergender"));
	        model.addAttribute("userInfo", userInfo);
	    }

	    return "mypage/mychange";
	}
	
	
	
	@GetMapping("/mypage/account")
	public String myaccount() {
		
		return "mypage/myaccount";
	}
	
	@PostMapping("/mypage/account")
	@ResponseBody
	public Map<String, Object> withdrawal(HttpSession session,
            @RequestParam String username,
            @RequestParam String userpw) {
			Map<String, Object> result = new HashMap<>();
			String userIdFromSession = (String) session.getAttribute("userid");
			String userPwFromSession = (String) session.getAttribute("userpw");

			if (username.equals(userIdFromSession) && userpw.equals(userPwFromSession)) {
			mypageDao.deleteMember(userIdFromSession);
			session.invalidate();
			result.put("success", true);
			} else {
				result.put("success", false);
				result.put("message", "삭제 확인을 체크하고 사용자 이름 및 비밀번호가 정확한지 확인하세요.");
}

return result;
}
	
	@GetMapping("/admin/main")
	public String adminmain() {
		
		return "admin/adminmain";
	}
	
	@GetMapping("/admin/search")
	public String adminsearch() {
		
		return "admin/adminsearch";
	}
	
	@GetMapping("/admin/request")
	public String adminrequest() {
		
		return "admin/adminrequest";
	}
	@GetMapping("/admin/manage")
	public String adminmanage() {
		
		return "admin/adminmanage";
	}
	
}