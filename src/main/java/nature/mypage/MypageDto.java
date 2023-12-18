package nature.mypage;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MypageDto {
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
	
	private int review_num;
	private int user_id;
	private int camping_num;
	private double rate;
	private String content;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "Asia/Seoul")
	private Timestamp created_at;
	private Timestamp updated_at;
	private Timestamp deleted_at;
	
	private String facltNm;
	
	private int reservation_id;
	private int user_num;
	private Timestamp reservationDate;
	private Timestamp starDate;
	private Timestamp endDate;
	private int adult_count;
	private int child_count;
	private String firstImageUrl;
	
	
}
