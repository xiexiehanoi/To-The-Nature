package nature.payment;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDao {

	@Autowired
	SqlSession session;
	
	private String nameSpace="nature.payment.PaymentDao.";
	public void payment(PaymentDto paymentDto) {
		
		session.insert(nameSpace+"insertPayment",paymentDto);
	}

}