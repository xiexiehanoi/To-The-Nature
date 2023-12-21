package nature.reservation;



import lombok.Data;

@Data
public class ReservationDto {
	private int reservation_id;			//예약 PK
	private int user_num;				//유저 FK
	private String reservationDate;		//예약일
	private String startDate;			//예약 시작 날짜
	private String endDate; 			//예약 종료 날짜
	private int adult_count;			//성인 인원수
	private int child_count;			//미성년자 인원수
	private int camping_num;			//캠핑 FK
	private int roomCount;				//예약하는 방 개수
	private String merchant_uid;		//주문 번호
	private String imp_uid;				//결제 식별자
	private int amount;					//상품 가격

}
