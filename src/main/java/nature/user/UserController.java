package nature.user;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@GetMapping("main/main")
	public String main()
	{
		return "main/main";
	}

	@GetMapping("/login/process")
	@ResponseBody Map<String, Object> login(@RequestParam boolean saveid,
			@RequestParam String userid,@RequestParam String userpw,HttpSession session)
	{
		System.out.println("saveid:"+saveid);
		Map<String, Object> map=new HashMap<String, Object>();
		
		boolean bLogin=userDao.isLoginCheck(userid, userpw);
		if(bLogin)
		{
			session.setMaxInactiveInterval(60*60*6);
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
	
	@GetMapping("/login/logout")
	@ResponseBody public void logout(HttpSession session)
	{
		session.removeAttribute("loginok");
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
	
		userDao.updatePhoto(fileName, userid);
		
	
		session.setAttribute("userphoto", fileName);
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("fileName", fileName);
		return map;
	}
	
}