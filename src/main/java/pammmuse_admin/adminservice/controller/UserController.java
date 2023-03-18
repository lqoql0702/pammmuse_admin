package pammmuse_admin.adminservice.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import pammmuse_admin.adminservice.domain.User;
import pammmuse_admin.adminservice.service.UserService;

@RestController
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @PostMapping("/login")
    public User login(User user){
        return userService.login(user);
    }
}
