package naver.storage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import lombok.Getter;
import lombok.Setter;

@Configuration
@Setter
@Getter
public class NaverConfig {
	@Value("https://kr.object.ncloudstorage.com")
	private String endPoint;
	
	@Value("kr-standard")
	private String regionName;
	
	
	@Value("vxbR0bWKB0BDfIK3msf2")
	private String accessKey;
	
	@Value("vFqodccenkO2EZrpeW4tWXlPNWCAFTsF3CzJBRA9")
	private String secretKey;

}
