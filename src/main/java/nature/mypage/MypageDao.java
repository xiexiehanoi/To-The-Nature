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
    public void updatePhoto(String userphoto,int usernum)
	{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userphoto", userphoto);
		map.put("usernum", usernum);
		session.update(nameSpace+"updatePhotoByNum", map);
	}

	public void updatePhoto(String userphoto,String userid)
	{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userphoto", userphoto);
		map.put("userid", userid);
		session.update(nameSpace+"updatePhotoById", map);
	}
	public void updateUserInfoById(String username, String userphone, String useremail, String userpw, String userid) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("username", username);
        paramMap.put("userphone", userphone);
        paramMap.put("useremail", useremail);
        paramMap.put("userpw", userpw);
        paramMap.put("userid", userid);
        session.update(nameSpace + "updateUserInfoById", paramMap);
    }
	public void updatePhotoById(String userphoto, String userid) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("userphoto", userphoto);
	    map.put("userid", userid);
	    session.update(nameSpace + "updatePhotoById", map);
	}
	public void updateUserInfoWithoutPasswordById(String username, String userphone, String useremail, String userid) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("username", username);
        paramMap.put("userphone", userphone);
        paramMap.put("useremail", useremail);
        paramMap.put("userid", userid);
        session.update(nameSpace + "updateUserInfoWithoutPasswordById", paramMap);
    }
	public List<Map<String, Object>> getAllReviews() {
        return session.selectList(nameSpace + "getAllReviews");
    }
	public void deleteReviewById(int review_num) {
        session.delete(nameSpace + "deleteReviewById", review_num);
    }
	 public List<MypageDto> searchUsers(String field, String word) {
		 word = (word == null || word.length() == 0) ? null : word;  
		 Map<String, String> params = new HashMap<>();
	        params.put("searchfield", field);
	        params.put("searchword", word);
	        return session.selectList(nameSpace + "searchUsers", params);
	    }
	 public void deleteUserById(String userid) {
	        session.delete(nameSpace + "deleteUserById", userid);
	    }
	 public List<Map<String, Object>> searchReviews(String field, String word) {
		    word = (word == null || word.length() == 0) ? null : word;  
		    Map<String, String> params = new HashMap<>();
		    params.put("searchfield", field);
		    params.put("searchword", word);
		    return session.selectList(nameSpace + "searchReviews", params);
		}
	 public List<Map<String, Object>> getReservationDetail(String userId) {
	        int userNum = getUserNumByUserId(userId);
	        return session.selectList(nameSpace + "getReservationDetail", userNum);
	    }

	    public int getUserNumByUserId(String userId) {
	        return session.selectOne(nameSpace + "getUserNumByUserId", userId);
	    }
	    public List<Map<String, Object>> getAllReservations() {
	        return session.selectList(nameSpace + "getAllReservations");
	    }
	    public void deleteReservationById(int reservation_id) {
	        session.delete(nameSpace + "deleteReservationById", reservation_id);
	    }
}