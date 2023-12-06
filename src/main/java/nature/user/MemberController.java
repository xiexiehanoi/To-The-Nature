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
	
	@PostMapping("/login/addmember")
	public String addMember(HttpServletRequest request,@ModelAttribute UserDto dto,@RequestParam MultipartFile upload)
	{

		String path=request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(path);

		String userphoto=null;
		if(upload.getOriginalFilename().equals(""))
			userphoto="no";
		else {
			userphoto=UUID.randomUUID().toString();

			try {
				upload.transferTo(new File(path+"/"+userphoto));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
		dto.setUserphoto(userphoto);
	
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
	
	
}