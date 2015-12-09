package np.com.carpool.test;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class) // spring container bta run garaucha test class
@ContextConfiguration(locations = {"classpath:/spring/application-test-context.xml"}) 
public abstract class BaseTest {

}
