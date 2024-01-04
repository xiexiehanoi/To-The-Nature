package nature.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nature.user.UserDto;

@Repository
public class UserDao {

	@Autowired
	private SqlSession session;

	private String nameSpace="nature.user.UserDao.";

	public int getTotalCount()
	{
		return session.selectOne(nameSpace+"totalCountOfMember");
	}

	public void insertMember(UserDto dto)
	{
		session.insert(nameSpace+"insertMember", dto);
	}

	public List<UserDto> getSearchMember(String field,String word)
	{

		word=word==null || word.length()==0?null:word;

		Map<String, String> map=new HashMap<String, String>();
		map.put("searchfield",field);
		map.put("searchword", word);

		return session.selectList(nameSpace+"selectAllMembers", map);
	}

	public int searchIdCount(String userid)
	{
		return session.selectOne(nameSpace+"searchIdCount",userid);
	}

	public boolean isLoginCheck(String userid,String userpw)
	{
		Map<String, String> map=new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpw", userpw);

		int n=session.selectOne(nameSpace+"loginCheck", map);
		return n==0?false:true;
	}

	public UserDto getData(String userid)
	{
		return session.selectOne(nameSpace+"selectDataById", userid);
	}

	public UserDto getData(int usernum)
	{
		return session.selectOne(nameSpace+"selectDataByNum", usernum);
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

	public String findUserIdByNameAndPhone(String username, String userphone) {
	    Map<String, String> map = new HashMap<>();
	    map.put("username", username);
	    map.put("userphone", userphone);
	    return session.selectOne(nameSpace + "findUserIdByNameAndPhone", map);
	}
	public String findPassword(String username, String userid, String useremail) {
	    Map<String, String> map = new HashMap<>();
	    map.put("username", username);
	    map.put("userid", userid);
	    map.put("useremail", useremail);
	    return session.selectOne(nameSpace + "findPassword", map);
	}
	public void updatePassword(String userid, String usernewpw) {
	    Map<String, String> map = new HashMap<>();
	    map.put("userid", userid);
	    map.put("usernewpw", usernewpw);
	    session.update(nameSpace + "updatePassword", map);
	}
	// 새로 추가된 메서드: 사용자의 프로필 사진 파일명 조회
    public String getPhotoFileName(String userid) {
        return session.selectOne(nameSpace + "getPhotoFileName", userid);
    }

	public void deleteUser(String userid) {
		 session.selectOne(nameSpace + "deleteUser", userid);
	}
	
	public boolean isUserExists(String userid) {
	    int count = session.selectOne(nameSpace + "searchIdCount", userid);
	    return count > 0;
	}
}