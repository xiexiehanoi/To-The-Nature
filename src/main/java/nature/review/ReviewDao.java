package nature.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao {

	@Autowired
	private SqlSession session;
	
	private String nameSpace = "nature.review.ReviewDto.";
	
	public List<Map<String, Object>> getAllReview(int campingNum)
	{
		return session.selectList(nameSpace+"selectRiewList",  campingNum);
	}
	
}
