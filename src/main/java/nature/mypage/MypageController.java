package nature.mypage;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MypageController {
	
	@Autowired
	private MypageDao mypageDao;
	
	@Autowired
	private MypageService mypageService;
	
	@GetMapping("/mypage/account")
	public String account() {
		
		return "mypage/myaccount.mypage";
	}
	
	@GetMapping("/mypage/reservation")
	public String myreservation(HttpSession session, Model model) {
		
		String userId = (String) session.getAttribute("userid");
	    if (userId == null) {
	        // 적절한 처리를 수행하세요. 예를 들어 로그인 페이지로 리다이렉트
	        return "redirect:/login";
	    }
	    
	    // Call the service method to get reservation details by user ID
	    List<Map<String, Object>> userReservations = mypageDao.getReservationDetail(userId);

	    // Add the reservations to the model
	    model.addAttribute("userReservations", userReservations);

	    return "mypage/myreservation.mypage";
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
	    if (userId == null) {
	        // 적절한 처리를 수행하세요. 예를 들어 로그인 페이지로 리다이렉트
	        return "redirect:/login";
	    }
	    List<Map<String, Object>> userInfoList = mypageDao.getUserInfoByUserId(userId);

	    // 사용자 정보가 존재하면 모델에 추가
	    if (!userInfoList.isEmpty()) {
            Map<String, Object> userInfo = userInfoList.get(0);
            model.addAttribute("usergender", userInfo.get("usergender"));
            model.addAttribute("userInfo", userInfo);
        }

	    return "mypage/mychange";
	}
	
	@PostMapping("/mypage/info")
	public String updateUser(@RequestParam MultipartFile userphoto,
	                         @RequestParam String username,
	                         @RequestParam String userphone,
	                         @RequestParam String useremail,
	                         @RequestParam String userpw,
	                         HttpSession session) {
	    String userid = (String) session.getAttribute("userid");

	    // 새로운 사진이 제공되면 파일 업로드를 처리합니다.
	    if (!userphoto.isEmpty()) {
	        String path = session.getServletContext().getRealPath("/resources/upload");
	        String fileName = UUID.randomUUID().toString();
	        try {
	            userphoto.transferTo(new File(path + "/" + fileName));
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        // 데이터베이스에서 사용자 사진 업데이트
	        mypageDao.updatePhotoById(fileName, userid);
	        session.setAttribute("userphoto", fileName);
	    }

	    if (!userpw.isEmpty()) {
            mypageDao.updateUserInfoById(username, userphone, useremail, userpw, userid);
        } else {
            // 새로운 비밀번호가 빈 문자열인 경우에 대한 처리 추가 (비밀번호 업데이트 안 함)
            mypageDao.updateUserInfoWithoutPasswordById(username, userphone, useremail, userid);
        }

	    // 프로필 페이지 또는 적절한 페이지로 리디렉션
	    return "redirect:/";
	}
	
	
	@GetMapping("/admin/main")
	public String adminmain() {
		
		return "admin/adminmain";
	}
	
	@GetMapping("/admin/search")
    public String adminsearch(
            @RequestParam(required = false) String field,
            @RequestParam(required = false) String word,
            Model model) {
        List<MypageDto> searchResult = mypageDao.searchUsers(field, word);

        // 모델에 검색 결과 추가
        model.addAttribute("searchResult", searchResult);

        return "admin/adminsearch";
    }
	@GetMapping("/admin/result")
	@ResponseBody
	public List<MypageDto> adminresult(@RequestParam(required = false) String field,
	                                             @RequestParam(required = false) String word) {
	    List<MypageDto> searchResult = mypageDao.searchUsers(field, word);
	    return searchResult;
	}
	@PostMapping("/admin/userdelete")
    @ResponseBody
    public Map<String, Object> deleteUserById(@RequestParam String userid) {
        Map<String, Object> result = new HashMap<>();
       
        try {
            
            mypageDao.deleteUserById(userid);
            result.put("success", true);
        } catch (Exception e) {
            
            result.put("success", false);
            result.put("message", "계정 삭제 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        return result;
    }
	@PostMapping("/admin/reviewfind")
	@ResponseBody
	public List<Map<String, Object>> reviewSearch(
	    @RequestParam(required = false) String searchword,
	    @RequestParam(required = false) String word
	    ) {
	    List<Map<String, Object>> reviews = mypageDao.searchReviews(searchword, word);
	    return reviews;
	}
	@GetMapping("/admin/reservation")
	public String listAllReservations(Model model) {
	    List<Map<String, Object>> allReservations = mypageDao.getAllReservations();
	    model.addAttribute("allReservations", allReservations);
	    return "admin/adminreservation";
	}
	@GetMapping("/admin/manage")
	public String adminmanage(Model model) {
		List<Map<String, Object>> allReviews = mypageDao.getAllReviews();
		model.addAttribute("allReviews", allReviews);
		return "admin/adminmanage";
	}
	@PostMapping("/admin/delete")
    @ResponseBody
    public Map<String, Object> deleteReview(@RequestParam int review_num) {
        Map<String, Object> result = new HashMap<>();
       
        try {
            // 리뷰 삭제를 위한 DAO 메소드 직접 호출
            mypageDao.deleteReviewById(review_num);
            result.put("success", true);
        } catch (Exception e) {
            // 삭제 실패 시 예외 처리
            result.put("success", false);
            result.put("message", "리뷰 삭제 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        return result;
    }
	@PostMapping("/admin/deleteReservation")
	@ResponseBody
	public Map<String, Object> deleteReservation(@RequestParam int reservation_id) {
	    Map<String, Object> result = new HashMap<>();

	    try {
	        // Delete reservation using DAO method
	        mypageDao.deleteReservationById(reservation_id);
	        result.put("success", true);
	    } catch (Exception e) {
	        // Handle deletion failure
	        result.put("success", false);
	        result.put("message", "예약 삭제 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }

	    return result;
	}
	
}