package pammmuse_admin.adminservice.controller;


import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pammmuse_admin.adminservice.domain.User;
import pammmuse_admin.adminservice.service.UserService;
import pammmuse_admin.adminservice.service.UserServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/member")
public class UserController {
    private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    private final UserService userservice;

    /*로그인 페이지 이동*/
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public void loginGET() {

        logger.info("로그인 페이지 진입");

    }
    /* 로그인 */
    @RequestMapping(value="login", method=RequestMethod.POST)
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

}
