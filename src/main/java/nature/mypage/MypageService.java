package nature.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MypageService {
	
	private MypageDao mypagedao;
	
	public int getTotalCount()
	{
		return mypagedao.getTotalCountOfBoard();
	}
	public List<Map<String, Object>> getReviewsByUserId(String userId) {
	    return mypagedao.getReviewsByUserId(userId);
	}
	public int getTotalCountOfBoards() {
		return mypagedao.getTotalCountOfBoard();
	}
	public List<Map<String, Object>> getUserInfoByUserId(String userId) {
	    return mypagedao.getUserInfoByUserId(userId);
	}
}