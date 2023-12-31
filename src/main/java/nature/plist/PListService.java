package nature.plist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PListService {
	
	@Autowired
	private PListDao plistDao;
	
	public int getTotalCount() 
	{
		return plistDao.getTotalCount();
	}

	public List<PListDto> getAllSites(String word ,String search)
	{
		return plistDao.getAllSites(word,search);
	}

	/*
	 * public List<PListDto> searchSites(String word, String facltNm, String
	 * sigunguNm, String doNm) { //word 에 검색 단어가 안 들어 있을 경우 null 값을 보내야 where 문이 실행
	 * 안된다 word=word==null || word.length()==0?null:word;
	 * 
	 * Map<String, Object> map=new HashMap<String, Object>();
	 * map.put("searchfield1", facltNm); map.put("searchfield2", doNm);
	 * map.put("searchfield3", sigunguNm); map.put("searchword", word);
	 * 
	 * return plistDao.getAllSites(word, facltNm, sigunguNm, doNm); }
	 */	
	
	public List<PListDto> getListPage(int startNum,int perpage,String word,String select)
	{
		startNum = Math.max(startNum, 0); // 음수일 경우 0으로 처리
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("start", startNum);
		map.put("perpage", perpage);
		map.put("word", word);
		map.put("search", select);
		return plistDao.getListPage(map);
	}
	
	public void insertSite(PListDto dto)
	{
		plistDao.insertSite(dto);
	}
	
	public void updateSite(PListDto dto)
	{
		plistDao.updateSite(dto);
	}
	
	public void deleteSite(int camping_num)
	{
		plistDao.deleteSite(camping_num);
	}
	
	
	public List<Map<String, Object>> getsearchcamping(Map<String, Object> plistParam)
	{
		return plistDao.getsearchdetail(plistParam);
	}

	public int getSerchTotalCount(String word, String select) {
		return plistDao.getSerchTotalCount(word,select);
	}

}
