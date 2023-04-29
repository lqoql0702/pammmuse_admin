package pammmuse_admin.adminservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pammmuse_admin.adminservice.dao.NoticeDao;
import pammmuse_admin.adminservice.domain.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeDao noticeDao;

    @Override
    public void enroll(Notice notice){
        noticeDao.enroll(notice);
    }
}
