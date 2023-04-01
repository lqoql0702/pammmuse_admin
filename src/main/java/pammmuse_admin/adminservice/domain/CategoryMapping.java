package pammmuse_admin.adminservice.domain;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryMapping {
    private int cate_code;

    private int cate_parent;

    private int tier;
}
