package nature.site;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nature.reservation.ReservationDto;
import nature.user.UserDto;

@Repository
public class SiteDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="nature.site.SiteDao.";
	
	public List<Map<String, Object>> getsearchcamping(Map<String, Object> siteParam) 
	{
		return session.selectList(nameSpace + "selectdetail", siteParam);
	}
	
	public UserDto getUser(String userid) {
		
		return session.selectOne(nameSpace+"selectgetUser",userid);
	}
	
	
	 /*public ReservationDto checkPaidUser(Map<String, Object> reservationParm) 
	 {
	
	 return session.selectOne(nameSpace+"checkPaiduser",reservationParm); 
	 }*/
	
}
