package vn.fs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.fs.commom.CommomDataService;
import vn.fs.entities.Product;
import vn.fs.entities.User;
import vn.fs.repository.ProductRepository;
import vn.fs.service.ProductRecommendationService;


@Controller
public class ProductDetailController extends CommomController{

	@Value("${app.base.url}")
	private String baseUrl;
	
	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	CommomDataService commomDataService;

	@Autowired
	ProductRecommendationService productRecommendationService;

	@GetMapping(value = "productDetail")
	public String productDetail(@RequestParam("id") Long id, Model model, User user) {

		Product product = productRepository.findById(id).orElse(null);
		model.addAttribute("product", product);
		model.addAttribute("baseUrl", baseUrl);

		commomDataService.commonData(model, user);
		List<Product> recommendPro = productRecommendationService.getRecommendedProducts(id);
		model.addAttribute("recommendProduct", recommendPro);

		return "web/productDetail";
	}

	@GetMapping(value = "productDetailByHash")
	public String productDetailByHash(@RequestParam("hash") String hash, Model model, User user) {

		Product product = productRepository.findByTxnHash(hash).orElse(null);
		model.addAttribute("product", product);
		model.addAttribute("baseUrl", baseUrl);

		commomDataService.commonData(model, user);

		return "web/productDetailByHash";
	}
	
	// Gợi ý top 10 sản phẩm cùng loại
//	public void listProductByCategory10(Model model, Long categoryId) {
//		List<Product> products = productRepository.listProductByCategory10(categoryId);
//		model.addAttribute("productByCategory", products);
//	}
}
