package vn.fs;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.ImportAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.cloud.openfeign.FeignAutoConfiguration;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
@EnableFeignClients(basePackages = "vn.fs.client")
@ImportAutoConfiguration({FeignAutoConfiguration.class})
public class  GreenyShopApplication {

	public static void main(String[] args) {
		SpringApplication.run(GreenyShopApplication.class, args);
	}

}
