package nature.site;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SiteService {
	
	@Autowired
	private SiteDao siteDao;
	
	public List<Map<String, Object>> getsearchcamping(int num)
	{
		return siteDao.getsearchcamping(num);
	}

}
