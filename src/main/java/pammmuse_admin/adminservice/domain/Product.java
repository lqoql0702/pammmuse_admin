package pammmuse_admin.adminservice.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Product {
    private int id;

    private String product_name;

    private String cate_code;

    private int product_price;

    private int product_stock;

    private String product_color;

    private String product_size;

    private double product_discount;

    private Date reg_date;

    private Date update_date;
}
