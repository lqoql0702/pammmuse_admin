package pammmuse_admin.adminservice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pammmuse_admin.adminservice.domain.Notice;
import pammmuse_admin.adminservice.service.NoticeService;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    private static final Logger log = LoggerFactory.getLogger(NoticeController.class);

    @GetMapping("/notice/noticeEnroll")
    public void noticeEnrollGET(){
        log.info("게시판 등록 페이지 진입");

    }

    @PostMapping("/notice/noticeEnroll")
    public String noticeEnrollPOST(Notice notice, RedirectAttributes rttr) {

        log.info("Notice : " + notice);

        noticeService.enroll(notice);

        rttr.addFlashAttribute("result", "enroll success");

        return "redirect:/main";

    }
}
