package pammmuse_admin.adminservice.service;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pammmuse_admin.adminservice.dao.CategoryDao;
import pammmuse_admin.adminservice.dao.ProductDao;
import pammmuse_admin.adminservice.domain.CategoryMapping;
import pammmuse_admin.adminservice.domain.Product;

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
    public List<CategoryMapping> cateMapList(){

        return categoryDao.cateMapList();

    }

}
