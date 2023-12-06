package nature.site;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SiteService {
	
	@Autowired
	private SiteDao siteDao;
	
	public SiteDto getsearchcamping(int num)
	{
		return siteDao.getsearchcamping(num);
	}

}
