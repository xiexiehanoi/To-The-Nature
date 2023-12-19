package nature.plist;

import java.util.HashMap;
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
	
	public int getTotalCount() 
	{
		return session.selectOne(nameSpace+"totalCountOfSite");
	}
	
	public List<PListDto> getAllSites(String word, 
			String facltNm, String sigunguNm, String doNm)
	{
		//word 에 검색 단어가 안 들어 있을 경우 null 값을 보내야 where 문이 실행 안된다
		word=word==null || word.length()==0?null:word;
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("searchfield1", facltNm);
		map.put("searchfield2", doNm);
		map.put("searchfield3", sigunguNm);
		map.put("searchword", word);
		
		return session.selectList(nameSpace+"selectAllSites", map);
	}
	
	public List<PListDto> getPList(Map<String, Integer> map)
	{
		return session.selectList(nameSpace+"selectPagingOfPList", map);
	}
	
	public void insertSite(PListDto dto)
	{
		session.insert(nameSpace+"insertSite", dto);
	}
	
	public void updateSite(PListDto dto)
	{
		session.update(nameSpace+"updateSite", dto);
	}
	
	public void deleteSite(int campingNum)
	{
		session.delete(nameSpace+"deleteSite", campingNum);
	}
	
	public List<Map<String, Object>> getsearchdetail(Map<String, Object> plistParam) 
	{
		return session.selectList(nameSpace + "selectSitedetail", plistParam);
	}
	
}
