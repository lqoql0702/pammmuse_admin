package pammmuse_admin.adminservice.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryResultMap {

    private int cate_code;

    private String cate_name;

    private int cate_parent;

    private int tier;
}
