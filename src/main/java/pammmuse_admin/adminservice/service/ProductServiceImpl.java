package pammmuse_admin.adminservice.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pammmuse_admin.adminservice.dao.CategoryDao;
import pammmuse_admin.adminservice.dao.ProductDao;
import pammmuse_admin.adminservice.domain.*;
import pammmuse_admin.adminservice.dto.Criteria;

import java.util.List;

@Service
@Slf4j
public class ProductServiceImpl implements ProductService{

    @Autowired
    private ProductDao productDao;

    @Autowired
    private CategoryDao categoryDao;

    @Override
    public void productEnroll(Product product){

        productDao.productEnroll(product);
    }

    @Override
    public List<CategoryResultMap> cateResultMap(){

        return categoryDao.cateResultMap();

    }

    /* 상품 리스트 */
    @Override
    public List<Product> productGetList(Criteria cri) {
        log.info("productGetTotalList()..........");
        return productDao.productGetList(cri);
    }

    /* 상품 총 갯수 */
    public int productGetTotal(Criteria cri) {
        log.info("productGetTotal().........");
        return productDao.productGetTotal(cri);
    }
}
