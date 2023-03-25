package pammmuse_admin.adminservice.service;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pammmuse_admin.adminservice.dao.ProductDao;
import pammmuse_admin.adminservice.domain.Product;

@Service
@Slf4j
public class ProductServiceImpl implements ProductService{

    @Autowired
    private ProductDao productDao;

    @Override
    public void productEnroll(Product product){
        log.info("(srevice)productEnroll........");
        productDao.productEnroll(product);
    }
}
