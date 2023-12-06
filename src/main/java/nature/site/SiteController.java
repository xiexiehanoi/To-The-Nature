package nature.site;

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
		SiteDto campingDto = siteService.getsearchcamping(num);
		model.addAttribute("campingDto", campingDto);
		return "detail/detail.site";
	}
	
}
