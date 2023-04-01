package pammmuse_admin.adminservice.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import pammmuse_admin.adminservice.domain.Category;
import pammmuse_admin.adminservice.domain.Product;

import java.util.List;

@Mapper
public interface ProductDao {

    /*상품 등록*/
    public void productEnroll(Product product);

}
