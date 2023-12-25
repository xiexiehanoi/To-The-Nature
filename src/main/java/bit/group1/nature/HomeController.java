package bit.group1.nature;


import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.amazonaws.auth.policy.Resource;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@GetMapping("/")
	public String home(Locale locale, Model model) {
		// Set attribute to indicate if it's the main page
        model.addAttribute("isMainPage", true);
		
		return "main/main.main";
	}
	
	@GetMapping("/three.module.js")
    public ResponseEntity<ClassPathResource> serveFile() {
        ClassPathResource resource = new ClassPathResource("/static/three.module.js");
        return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION,
                "attachment; filename=\"" + resource.getFilename() + "\"").body(resource);
    }
	
	public ResponseEntity<String> myEndpoint() {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        String responseBody = "{\"message\": \"Hello, World!\"}";

        return new ResponseEntity<>(responseBody, headers, HttpStatus.OK);
    }
	
}
