package nature.wish;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishService {
	
	@Autowired
	private WishDao wishDao;
	
	public void insertWish(WishDto dto)
	{
		wishDao.insertWish(dto);
	}

	public void deleteWish(WishDto dto)
	{
		wishDao.deleteWish(dto);
	}
}
