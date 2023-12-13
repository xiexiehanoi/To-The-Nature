package nature.review;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReviewDto {
	private int reviewNum;
	private String userId;
	private int campingNum;
	private int rate;
	private String content;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Timestamp createAt;
}
