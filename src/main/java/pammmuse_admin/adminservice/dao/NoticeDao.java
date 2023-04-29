package pammmuse_admin.adminservice.dao;

import org.apache.ibatis.annotations.Mapper;
import pammmuse_admin.adminservice.domain.Notice;

@Mapper
public interface NoticeDao {

    public void enroll(Notice notice);
}
