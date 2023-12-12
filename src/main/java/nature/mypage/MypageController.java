package nature.mypage;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@GetMapping("/mypage/change")
	public String mycs() {
		
		return "mypage/mychange";
	}
	
	@GetMapping("/mypage/account")
	public String myaccount() {
		
		return "mypage/myaccount";
	}
	
	@PostMapping("/mypage/account")
    public String withdrawal(HttpSession session,
                             @RequestParam String username,
                             @RequestParam String userpw,
                             @RequestParam(value = "checkDelete", defaultValue = "false") boolean checkDelete,
                             RedirectAttributes redirectAttributes) {

        String userIdFromSession = (String) session.getAttribute("userid");
        String userPwFromSession = (String) session.getAttribute("userpw");

        if (checkDelete && username.equals(userIdFromSession) && userpw.equals(userPwFromSession)) {
            mypageDao.deleteMember(userIdFromSession);
            session.invalidate();
            return "redirect:/main";
        } else {
            // 삭제 확인이나 사용자 정보가 일치하지 않는 경우 메시지를 전달하고 이전 페이지로 리다이렉트
            redirectAttributes.addFlashAttribute("message", "삭제 확인을 체크하고 사용자 이름 및 비밀번호가 정확한지 확인하세요.");
            return "redirect:/mypage/account";
        }
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
