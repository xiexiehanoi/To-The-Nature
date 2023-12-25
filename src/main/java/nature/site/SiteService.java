package nature.site;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nature.reservation.ReservationDto;
import nature.user.UserDto;

@Service
public class SiteService {
	
	@Autowired
	private SiteDao siteDao;
	
	
	public List<Map<String, Object>> getsearchcamping(Map<String, Object> siteParam)
	{
		return siteDao.getsearchcamping(siteParam);
	}
	
	public UserDto getUser(String userid) {

		UserDto userDto= siteDao.getUser(userid);
		return userDto;
	}	 

}
