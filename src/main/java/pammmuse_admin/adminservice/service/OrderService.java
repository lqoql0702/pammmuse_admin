package pammmuse_admin.adminservice.service;

import pammmuse_admin.adminservice.domain.Order;

import java.util.List;

public interface OrderService {
    /* 주문 상품 리스트 */
    public List<Order> getOrderList();

    /* 주문 취소 */
    public void orderCancle(Order order);

}
