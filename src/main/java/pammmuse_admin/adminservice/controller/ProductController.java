package pammmuse_admin.adminservice.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pammmuse_admin.adminservice.dao.ProductDao;
import pammmuse_admin.adminservice.domain.AwsS3;
import pammmuse_admin.adminservice.domain.Product;
import pammmuse_admin.adminservice.service.AwsS3Service;
import pammmuse_admin.adminservice.service.ProductService;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private ProductService productService;




//    /*상품 등록 페이지 접속*/
//    @RequestMapping(value="productManage", method = RequestMethod.GET)
//    public void productManageGet() throws Exception{
//        logger.info("상품 등록 페이지 접속");
//    }



    /* 상품 등록 페이지 접속 */
    @GetMapping(value = "productEnroll")
    public void productEnrollGET(Model model) throws Exception{
        logger.info("상품 등록 페이지 접속");

        ObjectMapper objm = new ObjectMapper();

        List list = productService.cateResultMap();

        String cateResultMap = objm.writeValueAsString(list);

        model.addAttribute("cateResultMap", cateResultMap);

        logger.info("변경 전.........." + list);
        logger.info("변경 후.........." + cateResultMap);
    }

    /*상품 등록*/
    @PostMapping("/productEnroll")
    public String productEnrollPost(Product product, RedirectAttributes rttr, @RequestPart("file") MultipartFile multipartFile) throws IOException {

        logger.info("productEnrollPOST......" + product);


        productService.productEnroll(product);

        rttr.addFlashAttribute("enroll_result", product.getProduct_name());


        return "redirect:/product/productManage";
    }

    /* 상품 관리(상품목록) 페이지 접속 */
    @GetMapping(value = "productManage")
    public void productManageGET(Model model) throws Exception{

        /* 상품 리스트 데이터 */
        List list = productService.productGetList();

        if(!list.isEmpty()) {
            model.addAttribute("list", list);
        } else {
            model.addAttribute("listCheck", "empty");
            return;
        }

    }

    /* 상품 조회 페이지 */
    @GetMapping("/productDetail")
    public void productGetDetail(int id, Model model, String fileName) throws JsonProcessingException {

        logger.info("productGetInfo()........." + id);

        ObjectMapper mapper = new ObjectMapper();

        /* 카테고리 리스트 데이터 */
        model.addAttribute("cateResultMap", mapper.writeValueAsString(productService.cateResultMap()));

        /* 조회 페이지 정보 */
        model.addAttribute("productInfo", productService.productGetDetail(id));


    }

}
