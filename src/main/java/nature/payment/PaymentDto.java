package nature.payment;

import lombok.Data;

@Data
public class PaymentDto {
	private int reservation_num;	//예약 FK
	private int user_num;			//유저 FK
	private String merchant_uid;		//주문 번호
	private String imp_uid;			//결제 식별자
	private int amount;				//상품 가격
}
