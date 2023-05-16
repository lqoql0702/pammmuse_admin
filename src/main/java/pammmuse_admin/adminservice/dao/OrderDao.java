package pammmuse_admin.adminservice.dao;

import org.apache.ibatis.annotations.Mapper;
import pammmuse_admin.adminservice.domain.Order;
import pammmuse_admin.adminservice.domain.OrderItem;
import pammmuse_admin.adminservice.domain.Product;

import java.util.List;

@Mapper
public interface OrderDao {
    /* 주문 상품 리스트 */
    public List<Order> getOrderList();

    /* 주문 취소 */
    public int orderCancle(String order_id);

    /* 주문 상품 정보(주문취소) */
    public List<OrderItem> getOrderItemInfo(String order_id);

    /* 주문 정보(주문취소) */
    public Order getOrder(String order_id);

    /* 주문 재고 차감 */
    public int deductStock(Product product);
}
