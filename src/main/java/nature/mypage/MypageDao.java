package nature.mypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDao {

	@Autowired
	private SqlSession session;
	
	private String nameSpace="nature.mypage.MypageDao.";
	
	public void deleteMember(int usernum)
	{
		session.delete(nameSpace+"deleteMember", usernum);
	}
}
