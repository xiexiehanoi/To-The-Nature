package nature.plist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class PListController {
	
	@Autowired
	private PListService plistService;
	
	@GetMapping("/plist")
	public String detail(HttpSession session, Model model,@RequestParam String userId, @RequestParam int num) {
		
	    // 필요한 로직 수행
	    Map<String, Object> plistParam = new HashMap<>();
	    plistParam.put("userId", userId);
	    plistParam.put("campingNum", num);

	    List<Map<String, Object>> campinglist = plistService.getsearchcamping(plistParam);
	    model.addAttribute("campinglist", campinglist);
	    model.addAttribute("userId", userId);
	    model.addAttribute("campingNum", num);
	    return "plist/plist.plist";
	}
	
}
