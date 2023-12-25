package nature.user;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import nature.user.UserDao;
@Controller
public class UserController {
	
	@Autowired
	private UserDao userDao;

	@GetMapping("/login/main")
	public String login()
	{
		return "login/loginmain";
	}

	@GetMapping("/login/success")
	public String success()
	{
		return "login/loginsuccess";
	}

	@GetMapping("/login/search")
	public String search()
	{
		return "login/loginsearch";
	}
	@GetMapping("/login/findUserId")
	@ResponseBody
	public String findUserId(@RequestParam("username") String username,
	                         @RequestParam("userphone") String userphone) {
	    String userId = userDao.findUserIdByNameAndPhone(username, userphone);
	    return userId != null ? userId : "Not Found";
	}

	@GetMapping("/login/find")
	public String find()
	{
		return "login/loginfind";
	}

	@GetMapping("/login/findPassword")
	@ResponseBody
	public String findPassword(@RequestParam("username") String username, @RequestParam("userid") String userid, @RequestParam("useremail") String useremail) {
	    // DAO를 사용하여 DB에서 비밀번호를 찾는 로직 구현
	    String password = userDao.findPassword(username, userid, useremail);

	    // 이름, 아이디, 이메일이 일치하지 않을 경우
	    if (password == null) {
	        return "Not Found";
	    }

	    // 결과가 있을 경우, 임시 비밀번호 생성
	    String temporaryPassword = generateTemporaryPassword();

	    // 생성한 임시 비밀번호를 디비에 업데이트
	    userDao.updatePassword(userid, temporaryPassword);

	    return temporaryPassword;
	}
	
	//이메일 인증번호
	@PostMapping("/login/authenticationNumber")
	@ResponseBody
	public String authenticationNumber() {
		
		return "";
	}
	
	

	// 임시 비밀번호 생성 메서드
	private String generateTemporaryPassword() {
	    // 원하는 길이만큼 랜덤한 비밀번호 생성
	    String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    StringBuilder temporaryPassword = new StringBuilder();
	    int length = 8; // 임시 비밀번호 길이 설정

	    for (int i = 0; i < length; i++) {
	        int index = (int) (Math.random() * characters.length());
	        temporaryPassword.append(characters.charAt(index));
	    }

	    return temporaryPassword.toString();
	}

	@GetMapping("/login/process")
	@ResponseBody Map<String, Object> login(@RequestParam boolean saveid,
			@RequestParam String userid,@RequestParam String userpw,HttpSession session)
	{
		//System.out.println("saveid:"+saveid);
		Map<String, Object> map=new HashMap<String, Object>();

		boolean bLogin=userDao.isLoginCheck(userid, userpw);
		if(bLogin)
		{
			session.setMaxInactiveInterval(60*60*24);
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveid", saveid?"yes":"no");
			session.setAttribute("userid",userid);

			String username=userDao.getData(userid).getUsername();
			session.setAttribute("username", username);

			String userphoto=userDao.getData(userid).getUserphoto();
			session.setAttribute("userphoto", userphoto);
		
			map.put("success", true);
		}else {
			map.put("success",false);
		}
		return map;
	}

	@GetMapping("/login/change")
	public String change()
	{
		return "login/loginchange";
	}
	@PostMapping("/login/updatePassword")
	@ResponseBody
	public String updatePassword(@RequestParam("userid") String userid,
	                             @RequestParam("userpw") String userpw,
	                             @RequestParam("usernewpw") String usernewpw) {
	    // 현재 비밀번호가 일치하는지 확인
	    if (!userDao.isLoginCheck(userid, userpw)) {
	        return "IncorrectPassword";
	    }

	    // 새 비밀번호로 업데이트
	    userDao.updatePassword(userid, usernewpw);

	    return "Success";
	}
	@GetMapping("/login/logout")
	@ResponseBody
	public void logout(HttpSession session, HttpServletResponse response) {
	    // 세션을 비우고 아이디 저장 여부를 확인하여 세션에 저장
	    session.removeAttribute("loginok");
	    session.removeAttribute("saveid");
	    session.removeAttribute("userid");
	    String userId = (String) session.getAttribute("userid");

	    // 클라이언트에게 저장된 쿠키 삭제를 알리기 위해 응답 헤더에 Set-Cookie 설정
	    Cookie cookie = new Cookie("savedUserId", userId);
	    cookie.setMaxAge(60 * 60 * 24 * 30); // 쿠키 만료 시간을 30일로 설정
	    response.addCookie(cookie);
	}


	@PostMapping("/login/photochange")
	@ResponseBody Map<String, String> photoChange(@RequestParam MultipartFile upload,
			HttpSession session,HttpServletRequest request)
	{

		String userid=(String)session.getAttribute("userid");

		String path=request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(path);

		String fileName=UUID.randomUUID().toString();

		try {
			upload.transferTo(new File(path+"/"+fileName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 프로필 사진 파일명을 DB에 업데이트
	    userDao.updatePhoto(fileName, userid);

		session.setAttribute("userphoto", fileName);

		Map<String, String> map=new HashMap<>();
		map.put("fileName", fileName);
		return map;
	}

	
}