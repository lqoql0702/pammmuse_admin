package pammmuse_admin.adminservice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pammmuse_admin.adminservice.dao.CategoryDao;
import pammmuse_admin.adminservice.dao.ProductDao;

@Controller
public class MainController {

    @Autowired
    private ProductDao productDao;

    private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    @GetMapping(value="/main")
    public void mainPageGet(){
        logger.info("로그인페이지 진입");


    }
}
