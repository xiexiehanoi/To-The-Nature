package nature.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nature.reservation.ReservationDto;

@Repository
public class ReviewDao {

	@Autowired
	private SqlSession session;
	
	private String nameSpace = "nature.review.ReviewDao.";
	
	public List<Map<String, Object>> getAllReview(int campingNum)
	{
		return session.selectList(nameSpace+"selectRiewList",  campingNum);
	}
	
	public Map<String, Object> getTotalCountAVG(int campingNum)
	{
		return session.selectOne(nameSpace+"totalCounTAVGtOfReview", campingNum);
	}
	
	public void insertReview(ReviewDto reviewDto)
	{
		session.selectOne(nameSpace+"insertReview", reviewDto);
	}
	
	public ReservationDto checkPaidUser (Map<String, Object> checkParam)
	{
		return session.selectOne(nameSpace+"checkPaidUser", checkParam);
	}
}
