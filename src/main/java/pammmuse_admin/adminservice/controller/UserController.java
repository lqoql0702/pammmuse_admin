package pammmuse_admin.adminservice.controller;


import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pammmuse_admin.adminservice.domain.Order;
import pammmuse_admin.adminservice.domain.User;
import pammmuse_admin.adminservice.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/member")
public class UserController {
    private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    private final UserService userservice;

    /*로그인 페이지 이동*/
    @GetMapping(value = "login")
    public void loginGET() {

        logger.info("로그인 페이지 진입");

    }
    /* 로그인 */
    @PostMapping(value="login")
    public String loginPost(HttpServletRequest request, User user, RedirectAttributes rttr) throws Exception{

        HttpSession session = request.getSession();
        User uservo = userservice.login(user);

        if(uservo == null){ //일치하지 않는 아이디, 비밀번호
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/member/login";
        }

        session.setAttribute("user", uservo); //일치하는 아이디, 비밀번호
        return "redirect:/main";
    }
    /*메인페이지 로그아웃*/
    @GetMapping(value = "logout.do")
    public String logoutMainGet(HttpServletRequest request) throws Exception{
        logger.info("logoutMainGet메서드 진입");

        HttpSession session = request.getSession();

        session.invalidate();

        return "redirect:/main";
    }

    /*비동기 방식 로그아웃 메서드*/
    @PostMapping(value = "logout.do")
    @ResponseBody
    public void logoutPost(HttpServletRequest request) throws Exception{
        logger.info("비동기 로그아웃 메서드 진입");

        HttpSession session = request.getSession();

        session.invalidate();
    }



}
