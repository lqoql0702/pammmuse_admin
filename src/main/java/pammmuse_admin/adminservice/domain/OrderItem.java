package pammmuse_admin.adminservice.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderItem {

    /* 뷰로부터 전달받을 값 */
    private int id;

    private int product_count;


    /* DB로부터 꺼내올 값 */
    private String order_id;

    private int product_id;

    private String product_name;

    private int product_price;

    private double product_discount;

    private String image_url;

    /* 만들어 낼 값 */
    private int sale_price;

    private int total_price;

    public void initSaleTotal() {
        this.sale_price = (int) (this.product_price * (1-this.product_discount));
        this.total_price = this.sale_price*this.product_count;
    }
}
