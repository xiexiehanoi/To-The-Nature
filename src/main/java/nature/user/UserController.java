package nature.user;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	
	@Autowired
	public  JavaMailSender mailSender;

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
	public Map<String, Object> authenticationNumber(@RequestParam String username,@RequestParam String userid,@RequestParam String useremail) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto userDto=userDao.getData(userid);
		if(userDto !=null) {
			Random r = new Random();
	        int num = r.nextInt(999999); //랜덤 난수 
	        
	        StringBuilder sb = new StringBuilder();
	        
	        // DB에 저장된 email            입력받은 email
	        if(userDto.getUseremail().equals(useremail)) {//이메일 정보 또한 동일하다면 
	    
	            String setFrom = "tjftjrgus@naver.com";//발신자 이메일
	            String tomail = userDto.getUseremail();//수신자 이메일
	            String title = "[To The Nature] 비밀번호 변경 인증 이메일입니다.";
	            sb.append(String.format("안녕하세요 %s님\n", userDto.getUserid()));
	            sb.append(String.format("To The Nature 비밀번호 찾기(변경) 인증번호는 %d입니다.", num));
	            String content = sb.toString();
	            
	            try {
	                MimeMessage msg = mailSender.createMimeMessage();
	                MimeMessageHelper msgHelper = new MimeMessageHelper(msg, true, "utf-8");
	                
	                msgHelper.setFrom(setFrom);
	                msgHelper.setTo(tomail);
	                msgHelper.setSubject(title);
	                msgHelper.setText(content);
	                
	                //메일 전송
	                mailSender.send(msg);
	                
	            }catch (Exception e) {
	                // TODO: handle exception
	                System.out.println(e.getMessage());
	            }
	            
	            //성공적으로 메일을 보낸 경우
	            map.put("status", true);
	            map.put("num", num);
	            map.put("m_idx", userDto.getUsernum());
	            
	        }else {
	        	map.put("status", false);
			
	        }
		}else {
			map.put("status", false);
		}
		return map;
		
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
	public void logout(HttpSession session) {
	    // 세션을 비우고 아이디 저장 여부를 확인하여 세션에 저장
	    session.removeAttribute("loginok");
	    session.removeAttribute("saveid");
	    session.removeAttribute("userid");
	    String userId = (String) session.getAttribute("userid");

	}


	@PostMapping("/login/photochange")
	@ResponseBody Map<String, String> photoChange(@RequestParam MultipartFile upload,
			HttpSession session,HttpServletRequest request)
	{

		String userid=(String)session.getAttribute("userid");

		String path=request.getSession().getServletContext().getRealPath("/resources/photo");
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
	
	@GetMapping("/delete")
	public String deleteUser(@RequestParam String userid, HttpSession session) {
		System.out.println(userid);
		userDao.deleteUser(userid);
		 session.removeAttribute("loginok");
		  session.removeAttribute("saveid");
		  session.removeAttribute("userid");
		return "redirect:/";
	}

	
}