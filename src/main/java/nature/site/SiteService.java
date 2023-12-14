package nature.site;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SiteService {
	
	@Autowired
	private SiteDao siteDao;
	
	
	public List<Map<String, Object>> getsearchcamping(Map<String, Object> siteParam)
	{
		return siteDao.getsearchcamping(siteParam);
	}

}
