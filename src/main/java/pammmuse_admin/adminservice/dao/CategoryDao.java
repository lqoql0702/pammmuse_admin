package pammmuse_admin.adminservice.dao;

import org.apache.ibatis.annotations.Mapper;
import pammmuse_admin.adminservice.domain.Category;
import pammmuse_admin.adminservice.domain.CategoryMapping;
import pammmuse_admin.adminservice.domain.CategoryResultMap;

import java.util.List;

@Mapper
public interface CategoryDao {

    public List<Category> cateList();

    public List<CategoryMapping> cateMapList();

    public List<CategoryResultMap> cateResultMap();

}
