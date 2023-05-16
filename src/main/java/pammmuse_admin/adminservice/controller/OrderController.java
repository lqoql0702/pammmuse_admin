package pammmuse_admin.adminservice.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pammmuse_admin.adminservice.domain.Order;
import pammmuse_admin.adminservice.service.OrderService;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/member")
public class OrderController {

    @Autowired
    OrderService orderservice;

    /* 주문 현황 페이지 */
    @GetMapping("/orderList")
    public String orderListGET(Model model) {

        List<Order> list = orderservice.getOrderList();

        if(!list.isEmpty()) {
            model.addAttribute("list", list);
        } else {
            model.addAttribute("listCheck", "empty");
        }

        return "/member/orderList";
    }

    /* 주문삭제 */
    @PostMapping("/orderCancle")
    public String orderCanclePOST(Order order) {
        orderservice.orderCancle(order);

        return "redirect:/member/orderList";
    }
}
