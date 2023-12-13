package nature.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/detail/reviewList")
	public String reviewList(@RequestParam int campingNum, Model model)
	{
		
		List<Map<String, Object>> reviewlist = reviewService.getAllReview(campingNum);
		model.addAttribute("reviewlist", reviewlist);
		return "detail/review.site";
	}
}
