package nature.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//import nature.user.UserDto;
import nature.mypage.MypageDto;

@Repository
public class MypageDao {

	@Autowired
	private SqlSession session;
	
	private String nameSpace="nature.mypage.MypageDao.";
	
	public void deleteMember(String userId) {
        // 사용자 계정을 논리적으로 삭제하는 로직
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userId", userId);
        paramMap.put("active", false);  // 논리적으로 삭제된 상태로 표시
        session.update(nameSpace + "updateUserStatus", paramMap);
    }
	public List<Map<String, Object>> getReviewsByUserId(String userId) {
        return session.selectList(nameSpace + "getReviewsByUserId", userId);
    }

    public int getTotalCountOfBoard() {
        return session.selectOne(nameSpace + "totalCountOfBoard");
    }

    public int getMaxNum() {
        return session.selectOne(nameSpace + "selectMaxNumOfBoard");
    }
    public MypageDto getData(String userid)
	{
		return session.selectOne(nameSpace+"selectDataById", userid);
	}
    public List<Map<String, Object>> getUserInfoByUserId(String userId) {
        return session.selectList(nameSpace + "getUserInfoByUserId", userId);
    }
}