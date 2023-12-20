package nature.plist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class PListController {
	
	@Autowired
	private PListService plistService;
	
	@GetMapping("/plist")
	public String plist(HttpSession session, Model model,
	        @RequestParam(required = false) String userId, @RequestParam(defaultValue = "1") int currentPage) {
		
		currentPage = Math.max(currentPage, 1); // currentPage가 음수인 경우 1로 처리
		
	    int perPage = 12; // 한 페이지당 보여지는 게시글의 갯수

	    // 페이징 처리를 위한 변수 계산
	    int perBlock=5; //한블럭당 보여지는 페이지의 개수
	    int totalCount = plistService.getTotalCount();
	    int totalPage = (int) Math.ceil((double) totalCount / perPage);
	    int startNum = (currentPage - 1) * perPage;
	    int startPage = (currentPage - 1) / perBlock * perBlock + 1;
	    int endPage = Math.min(startPage + perBlock - 1, totalPage);
	    
	    // 해당 페이지에 보여줄 게시판 목록
	    List<PListDto> plistpage = plistService.getListPage(startNum, perPage);
	    
	    List<PListDto> plistAll = plistService.getAllSites();
		
	    /* System.out.println(plistpage.toString()); */

	    int no = totalCount - (currentPage - 1) * perPage;

	    model.addAttribute("plistpage", plistpage);
	    model.addAttribute("plistAll", plistAll);
	    model.addAttribute("totalCount", totalCount);
	    model.addAttribute("totalPage", totalPage);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("no", no);
	    		
	    
	    return "plist/plist.plist";
	}
	
	@PostMapping("plist/search")
	@ResponseBody List<PListDto> plistSearch(String word, 
			String facltNm, String sigunguNm, String doNm)
	{
		List<PListDto> plistsearchRes = plistService.getAllSites();
		System.out.println(plistsearchRes);
		return plistsearchRes;
	}
}
