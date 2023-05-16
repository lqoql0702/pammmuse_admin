package pammmuse_admin.adminservice.dao;

import org.apache.ibatis.annotations.Mapper;
import pammmuse_admin.adminservice.domain.Product;

import java.util.List;

@Mapper
public interface ProductDao {

    /*상품 등록*/
    public void productEnroll(Product product);

    /* 상품 리스트 */
    public List<Product> productGetList();

    /* 상품 조회 페이지 */
    public Product productGetDetail(int id);

}
