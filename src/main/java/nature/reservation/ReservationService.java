package nature.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nature.user.UserDto;

@Service
public class ReservationService {

	@Autowired
	private ReservationDao reservationDao;


	public int roomCount(int num) {

		int camping_num= reservationDao.roomCount(num);
		return camping_num;
	}

	public UserDto getUser(String userid) {

		UserDto userDto= reservationDao.getUser(userid);
		return userDto;
	}

	public void insertReservation(ReservationDto reservationDto) {
		
		reservationDao.insertReservation(reservationDto);
		
	}
}
