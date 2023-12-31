package nature.user;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import nature.user.UserDto;

@Controller
@RequiredArgsConstructor
public class MemberController {
	
	@NonNull
	private UserDao userDao;

	@GetMapping("/login/form")
	public String login()
	{
		return "login/userform";
	}

	@GetMapping("/login/list")
	public String memberList(Model model)
	{

		int totalCount=userDao.getTotalCount();

		model.addAttribute("totalCount", totalCount);

		return "login/list";
	}

	@PostMapping("/login/success")
	public String addMember(HttpServletRequest request, @ModelAttribute UserDto dto,
	                        @RequestParam(value = "upload", required = false) MultipartFile upload,
	                        @RequestParam String usergender) {

	    String userphoto = null;

	    if (upload != null && !upload.isEmpty()) {
	        // 파일이 업로드되었을 때의 처리
	        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
	        userphoto = UUID.randomUUID().toString();

	        try {
	            upload.transferTo(new File(path + "/" + userphoto));
	        } catch (IllegalStateException | IOException e) {
	            e.printStackTrace();
	        }
	    } else {
	        // 파일이 업로드되지 않았을 때의 처리
	        userphoto = "no";
	    }

	    dto.setUserphoto(userphoto);
		dto.setUsergender(usergender);
		userDao.insertMember(dto);
		
		return "login/loginsuccess";
	}

	@GetMapping("/login/idcheck")
	@ResponseBody public Map<String, Integer> getIdCount(@RequestParam String userid)
	{
		int count=userDao.searchIdCount(userid);
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("count", count);
		return map;
	}
	
	@RequestMapping("/login/naverCallback")
	public String naverCallback() {
		return "login/navercallback";
	}

	@PostMapping("/login/naverLogin")
	public String handleNaverLogin(@RequestParam String userid, 
	                               @RequestParam String username, 
	                               @RequestParam String email,
	                               @RequestParam String gender,
	                               HttpServletRequest request) {
	    System.out.println("naverLogin start ");
		
		
		UserDto dto = new UserDto();
	    // 네이버 API로부터 받은 데이터를 dto에 설정
	    dto.setUserid(userid);
	    dto.setUsername(username);
	    dto.setUseremail(email);
	    dto.setUsergender(gender);
	    // 추가 필요한 데이터 설정

	    System.out.println(dto.toString());
	    
	    	// 사용자가 데이터베이스에 있는지 확인
	    if(!userDao.isUserExists(dto.getUserid())) {
	        // 존재하지 않으면 새로운 사용자로 추가
	        userDao.insertMember(dto);
	    }

	    // 로그인 세션 시작
	    request.getSession().setAttribute("loginok", "yes");
	    request.getSession().setAttribute("userid", dto.getUserid());
	    request.getSession().setAttribute("username", dto.getUsername());
	    // 필요한 경우 추가 세션 정보 설정

	    // 로그인 성공 페이지 또는 메인 페이지로 리디렉션
	    return "redirect:/login/success";
	    
	}
}