package pammmuse_admin.adminservice.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import pammmuse_admin.adminservice.domain.User;

@Mapper
@Repository
public interface UserMapper {
    User login(User user);
}
