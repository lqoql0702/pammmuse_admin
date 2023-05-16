package pammmuse_admin.adminservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pammmuse_admin.adminservice.dao.OrderDao;
import pammmuse_admin.adminservice.dao.ProductDao;
import pammmuse_admin.adminservice.dao.UserDao;
import pammmuse_admin.adminservice.domain.Order;
import pammmuse_admin.adminservice.domain.OrderItem;
import pammmuse_admin.adminservice.domain.Product;
import pammmuse_admin.adminservice.domain.User;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    OrderDao orderDao;
    @Autowired
    UserDao userDao;
    @Autowired
    ProductDao productDao;

    /* 주문 상품 리스트 */
    @Override
    public List<Order> getOrderList() {
        return orderDao.getOrderList();
    }

    /* 주문취소 */
    @Override
    @Transactional
    public void orderCancle(Order order) {
        /* 주문, 주문상품 객체 */
        /*주문상품*/
        List<OrderItem> ords = orderDao.getOrderItemInfo(order.getOrder_id());
        for(OrderItem ord : ords) {
            ord.initSaleTotal();
        }
        /* 주문 */
        Order orw = orderDao.getOrder(order.getOrder_id());
        orw.setOrders(ords);

        orw.getOrderPriceInfo();

        orderDao.orderCancle(order.getOrder_id());

        /* 재고 */
        for(OrderItem ord : orw.getOrders()) {
            Product product = productDao.productGetDetail(ord.getProduct_id());
            product.setProduct_stock(product.getProduct_stock() + ord.getProduct_count());
            orderDao.deductStock(product);
        }
    }
}
