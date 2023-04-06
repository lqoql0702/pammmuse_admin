package pammmuse_admin.adminservice.service;

import pammmuse_admin.adminservice.domain.Category;
import pammmuse_admin.adminservice.domain.CategoryMapping;
import pammmuse_admin.adminservice.domain.CategoryResultMap;
import pammmuse_admin.adminservice.domain.Product;

import java.util.List;

public interface ProductService {

    /*상품 등록*/
    public void productEnroll(Product product);

    /*카테고리 리스트*/
//    public List<CategoryMapping> cateMapList();
//
//    public List<Category> cateList();

    public List<CategoryResultMap> cateResultMap();
}
