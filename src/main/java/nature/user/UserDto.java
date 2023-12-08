package nature.user;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class UserDto {
	private int usernum;
	private String userid;
	private String userpw;
	private String usernewpw;
	private String username;
	private String userphoto;
	private String userbirth;
	private String usergender;
	private String userphone;
	private String useremail;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "Asia/Seoul")
	private Timestamp writeday;	
}