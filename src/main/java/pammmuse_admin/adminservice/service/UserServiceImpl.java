package pammmuse_admin.adminservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pammmuse_admin.adminservice.dao.UserDao;
import pammmuse_admin.adminservice.domain.Order;
import pammmuse_admin.adminservice.domain.User;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserDao userDao;

    @Override
    public User login(User user) throws Exception{
        return userDao.login(user);
    }


}
