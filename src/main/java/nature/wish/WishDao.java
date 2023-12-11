package nature.wish;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WishDao {
	@Autowired
	public SqlSession session;
	
	public String nameSpace ="nature.wish.WishDao.";
	
	public void insertWish(WishDto dto)
	{
		session.insert(nameSpace+"insertWish", dto);
	}

	public void deleteWish(WishDto dto)
	{
		session.delete(nameSpace+"deleteWish", dto);
	}
	
	
}
