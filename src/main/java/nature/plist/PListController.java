package nature.plist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class PListController {
	
	@Autowired
	private PListService plistService;
	
	@Autowired
	private PListDao plistDao;
	
	@GetMapping("/plist")
	public String plist(HttpSession session, Model model,
	        @RequestParam String userId, @RequestParam int num, @RequestParam(defaultValue = "1") int currentPage) {

	    int perPage = 12; // 한 페이지당 보여지는 게시글의 갯수

	    // 페이징 처리를 위한 변수 계산
	    int perBlock=5; //한블럭당 보여지는 페이지의 개수
	    int totalCount = plistService.getTotalCount();
	    int totalPage = (int) Math.ceil((double) totalCount / perPage);
	    int startNum = (currentPage - 1) * perPage;
	    int startPage = (currentPage - 1) / perBlock * perBlock + 1;
	    int endPage = Math.min(startPage + perBlock - 1, totalPage);

	    // 해당 페이지에 보여줄 게시판 목록
	    List<PListDto> plist = plistService.getPList(startNum, perPage);

	    int no = totalCount - (currentPage - 1) * perPage;

	    model.addAttribute("plist", plist);
	    model.addAttribute("totalCount", totalCount);
	    model.addAttribute("totalPage", totalPage);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("no", no);
				
	    return "plist/plist.plist";
	}
	
}
