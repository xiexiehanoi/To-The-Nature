package nature.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nature.reservation.ReservationDto;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;
	
	public List<Map<String, Object>> getAllReview(int campingNum)
	{
		return reviewDao.getAllReview(campingNum);
	}
	
	public Map<String, Object> getCountgetTotalCountAVG(int campingNum)
	{
		return reviewDao.getTotalCountAVG(campingNum);
	}
	
	public void insertReview(ReviewDto reviewDto)
	{
		reviewDao.insertReview(reviewDto);
	}
	
	public ReservationDto checkPaidUser(int userNum, int campingNum)
	{
		Map<String, Object> checkParam = new HashMap<String, Object>();
		checkParam.put("userNum", userNum);
		checkParam.put("campingNum", campingNum);
		return reviewDao.checkPaidUser(checkParam);
	}
}
