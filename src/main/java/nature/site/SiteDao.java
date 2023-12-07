package nature.site;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SiteDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="nature.site.SiteDao.";
	
	public List<Map<String, Object>> getsearchcamping(int num)
	{
		return session.selectList(nameSpace+"selectdetail", num);
	}
	
}
