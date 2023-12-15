package nature.reservation;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nature.user.UserDto;

@Repository
public class ReservationDao {

	@Autowired
	SqlSession session;
	
	private String nameSpace="nature.reservation.ReservationDao.";
	
	public int roomCount(int num) {
		
		return session.selectOne(nameSpace+"selectRoomCount",num);
		
	}

	public UserDto getUser(String userid) {
		
		return session.selectOne(nameSpace+"selectgetUser",userid);
	}
}
