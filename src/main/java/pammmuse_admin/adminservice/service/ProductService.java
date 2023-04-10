package pammmuse_admin.adminservice.service;

import pammmuse_admin.adminservice.dao.ProductDao;
import pammmuse_admin.adminservice.domain.*;


import java.util.List;

public interface ProductService {

    /*상품 등록*/
    public void productEnroll(Product product);

    public List<CategoryResultMap> cateResultMap();

    /* 상품 리스트 */
    public List<Product> productGetList();

    /* 상품 조회 페이지 */
    public Product productGetDetail(int id);

}
