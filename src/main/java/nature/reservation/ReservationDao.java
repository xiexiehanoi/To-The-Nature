package nature.reservation;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

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

	public void insertReservation(ReservationDto reservationDto) {
		session.insert(nameSpace+"insertReservation",reservationDto);
	}

	//방 개수

	public void updateAvailability(LocalDate date, int campingNum, int decrement) {
		Map<String, Object> params = new HashMap<>();
		params.put("date", date);
		params.put("campingNum", campingNum);
		params.put("decrement", decrement);
		session.update(nameSpace+"updateAvailability", params);
	}
}
