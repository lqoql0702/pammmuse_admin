package pammmuse_admin.adminservice.dao;

import pammmuse_admin.adminservice.dto.Criteria;
import org.apache.ibatis.annotations.Mapper;
import pammmuse_admin.adminservice.domain.Product;

import java.util.List;

@Mapper
public interface ProductDao {

    /*상품 등록*/
    public void productEnroll(Product product);

    /* 상품 리스트 */
    public List<Product> productGetList(Criteria cri);

    /* 상품 총 개수 */
    public int productGetTotal(Criteria cri);

}
