package nature.payment;

import lombok.Data;

@Data
public class PaymentDto {
	private int payment_id;			//예약 PK
	private int user_num;			//유저 FK
	private int merchant_uid;		//주문 번호
	private int amount;				//상품 가격
	

}
