package nature.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {

	@Autowired
	private PaymentDao paymentDao;
	public void payment(PaymentDto paymentDto) {
		
		paymentDao.payment(paymentDto);
		
	}

}
