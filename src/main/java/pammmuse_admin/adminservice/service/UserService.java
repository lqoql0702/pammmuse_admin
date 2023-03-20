package pammmuse_admin.adminservice.service;

import pammmuse_admin.adminservice.domain.User;

public interface UserService {
    /*로그인*/
    public User login(User user) throws Exception;
}

