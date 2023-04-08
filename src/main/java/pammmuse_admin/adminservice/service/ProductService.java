package pammmuse_admin.adminservice.service;

import pammmuse_admin.adminservice.domain.*;
import pammmuse_admin.adminservice.dto.Criteria;

import java.util.List;

public interface ProductService {

    /*상품 등록*/
    public void productEnroll(Product product);

    public List<CategoryResultMap> cateResultMap();

    /* 상품 리스트 */
    public List<Product> productGetList(Criteria cri);

    /* 상품 총 개수 */
    public int productGetTotal(Criteria cri);
}
