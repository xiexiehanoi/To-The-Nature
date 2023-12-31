package nature.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
