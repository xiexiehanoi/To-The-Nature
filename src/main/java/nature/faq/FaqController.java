package nature.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaqController {
    @RequestMapping("/FAQ")
    public String faqSite() {
        return "FAQ/FAQ.site";
    }
}
