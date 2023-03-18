package pammmuse_admin.adminservice.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pammmuse_admin.adminservice.dao.UserMapper;
import pammmuse_admin.adminservice.domain.User;

@Service
@Transactional
@RequiredArgsConstructor
public class UserService {

    private final UserMapper usermapper;

    public User login(User user){
        return usermapper.login(user);
    }
}
