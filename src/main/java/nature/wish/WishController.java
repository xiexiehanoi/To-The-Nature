package nature.wish;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WishController {

	@Autowired
	private WishService wishService;
	
	@PostMapping("/detail/insertWish")
	@ResponseBody
	 public Map<String, Object> insertWish(@ModelAttribute WishDto dto) {
        Map<String, Object> insertWishdto = new HashMap<String, Object>();
        try {
            wishService.insertWish(dto);

            insertWishdto.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            insertWishdto.put("success", false);
            insertWishdto.put("error", e.getMessage());
        }

        return insertWishdto;
    }
	
	@PostMapping("/detail/deleteWish")
	@ResponseBody
	 public Map<String, Object> deleteWish(@ModelAttribute WishDto dto) {
        Map<String, Object> deleteWishdto = new HashMap<String, Object>();
        try {
   
            wishService.deleteWish(dto);

            deleteWishdto.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            deleteWishdto.put("success", false);
            deleteWishdto.put("error", e.getMessage());
        }

        return deleteWishdto;
    }
}
