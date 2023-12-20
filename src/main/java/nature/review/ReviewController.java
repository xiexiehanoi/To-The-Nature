package nature.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import nature.reservation.ReservationDto;


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
	    list.put("reviewlist", reviewlist);
	    return list;
	}
	
	@PostMapping("/detail/insertReview")
	@ResponseBody
	public Map<String, Object> insertReview(@RequestBody ReviewDto reviewDto) {
	    reviewService.insertReview(reviewDto);
	    Map<String, Object> response = new HashMap<>();
	    response.put("success", true);
	    return response;
	}
	
	@GetMapping("/detail/checkPaidUser")
	@ResponseBody
	public ReservationDto checkPaidUser(@RequestBody int userNum, @RequestBody int campingNum)
	{
		return reviewService.checkPaidUser(userNum, campingNum);
	}
}
