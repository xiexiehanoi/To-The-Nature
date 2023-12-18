package nature.plist;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PListService {
	
	@Autowired
	private PListDao plistDao;
	
	
	public List<Map<String, Object>> getsearchcamping(Map<String, Object> plistParam)
	{
		return plistDao.getsearchcamping(plistParam);
	}

}
