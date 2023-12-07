package nature.site;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SiteController {
	
	@Autowired
	private SiteService siteService;
	
	@GetMapping("/detail")
	public String detail(@RequestParam int num, Model model)
	{
		//List<SiteDto> dto = siteService.getsearchcamping(num);
		List<Map<String, Object>> campinglist = siteService.getsearchcamping(num);
		model.addAttribute("campinglist", campinglist);
		return "detail/detail.site";
	}
	
}
