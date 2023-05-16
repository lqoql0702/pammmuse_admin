package pammmuse_admin.adminservice.dao;

import org.apache.ibatis.annotations.Mapper;
import pammmuse_admin.adminservice.domain.Order;
import pammmuse_admin.adminservice.domain.User;

import java.util.List;

@Mapper
//@Repository
public interface UserDao {
    public User login(User user);


}
