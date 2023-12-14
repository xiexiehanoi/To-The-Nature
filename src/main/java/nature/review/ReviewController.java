package nature.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/detail/reviewList")
	@ResponseBody 
	public Map<String, Object> countAvg(@RequestParam int campingNum)
	
	{
		Map<String, Object> list = new HashMap<>();
	    Map<String, Object> total = reviewService.getCountgetTotalCountAVG(campingNum);
	    List<Map<String, Object>> reviewlist = reviewService.getAllReview(campingNum);
	    
	    list.put("total", total);
	    System.out.println(total);
	    list.put("reviewlist", reviewlist);
	    System.err.println(reviewlist);
	    return list;
	}
}
