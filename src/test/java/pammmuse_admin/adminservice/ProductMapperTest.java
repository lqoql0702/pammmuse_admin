package pammmuse_admin.adminservice;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import pammmuse_admin.adminservice.dao.ProductDao;
import pammmuse_admin.adminservice.domain.Product;

@RunWith(SpringJUnit4ClassRunner.class)
//@MybatisTest
//@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
//@ComponentScan(basePackages={"spammmuse_admin.adminservice.dao"})
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
@ContextConfiguration(classes = AdminServiceApplication.class)
@WebAppConfiguration
public class ProductMapperTest {

    @Autowired
    private ProductDao pDao;

    /* 상품 등록 */
    @Test
    public void productEnrollTest() throws Exception{

        Product pro = new Product();

        pro.setProductName("mapper 테스트");
        pro.setCateCode("1");
        pro.setProductPrice(10000);
        pro.setProductStock(100);
        pro.setProductColor("pink");
        pro.setProductSize("s");
        pro.setProductDiscount(20);

        pDao.productEnroll(pro);
    }
}
