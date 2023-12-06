package nature.site;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SiteDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="nature.site.SiteDao.";
	
	public SiteDto getsearchcamping(int num)
	{
		return session.selectOne(nameSpace+"selectdetail", num);
	}
	
}
