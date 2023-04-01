package pammmuse_admin.adminservice.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pammmuse_admin.adminservice.domain.Product;
import pammmuse_admin.adminservice.service.ProductService;

import javax.annotation.PostConstruct;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private ProductService productService;

    /*상품 등록 페이지 접속*/
    @RequestMapping(value="productManage", method = RequestMethod.GET)
    public void productManageGet() throws Exception{
        logger.info("상품 등록 페이지 접속");
    }
    /* 상품 등록 페이지 접속 */
    @RequestMapping(value = "productEnroll", method = RequestMethod.GET)
    public void productEnrollGET(Model model) throws Exception{
        logger.info("상품 등록 페이지 접속");

        ObjectMapper objm = new ObjectMapper();

        List list = productService.cateMapList();

        String cateMapList = objm.writeValueAsString(list);

        model.addAttribute("cateMapList", cateMapList);

    }

    /*상품 등록*/
    @PostMapping("/productEnroll")
    public String productEnrollPost(Product product, RedirectAttributes rttr) {

        logger.info("productEnrollPOST......" + product);

        productService.productEnroll(product);

        rttr.addFlashAttribute("enroll_result", product.getProduct_name());

        return "redirect:/product/productManage";
    }

}
