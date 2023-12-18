package nature.plist;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PListDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="nature.plist.PListDao.";
	
	public List<Map<String, Object>> getsearchcamping(Map<String, Object> plistParam) 
	{
		return session.selectList(nameSpace + "selectdetail", plistParam);
	}
	
}
