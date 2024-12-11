package vn.fs.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.fs.client.SmartContractClient;
import vn.fs.client.dto.ProductRequestDto;
import vn.fs.client.dto.TransactionHashResponse;
import vn.fs.entities.Category;
import vn.fs.entities.Product;
import vn.fs.entities.User;
import vn.fs.repository.CategoryRepository;
import vn.fs.repository.ProductRepository;
import vn.fs.repository.UserRepository;


@Controller
@RequestMapping("/admin")
public class ProductController {

	@Value("${upload.path}")
	private String pathUploadImage;

	@Autowired
	ProductRepository productRepository;

	@Autowired
	CategoryRepository categoryRepository;

	@Autowired
	UserRepository userRepository;

	@Autowired
	SmartContractClient smartContractClient;

	@ModelAttribute(value = "user")
	public User user(Model model, Principal principal, User user) {

		if (principal != null) {
			model.addAttribute("user", new User());
			user = userRepository.findByEmail(principal.getName());
			model.addAttribute("user", user);
		}

		return user;
	}

	public ProductController(CategoryRepository categoryRepository,
			ProductRepository productRepository, SmartContractClient smartContractClient) {
		this.productRepository = productRepository;
		this.categoryRepository = categoryRepository;
		this.smartContractClient = smartContractClient;
	}

	// show list product - table list
	@ModelAttribute("products")
	public List<Product> showProduct(Model model) {
		List<Product> products = productRepository.findAll();
		model.addAttribute("products", products);

		return products;
	}

	@GetMapping(value = "/products")
	public String products(Model model, Principal principal) {
		Product product = new Product();
		model.addAttribute("product", product);

		return "admin/products";
	}

	// add product
	@PostMapping(value = "/addProduct")
	public String addProduct(@ModelAttribute("product") Product product, ModelMap model,
			@RequestParam("file") MultipartFile file, HttpServletRequest httpServletRequest) {

		try {

			File convFile = new File(pathUploadImage + "/" + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(convFile);
			fos.write(file.getBytes());
			fos.close();
		} catch (IOException e) {

		}

		product.setProductImage(file.getOriginalFilename());
		Product p = productRepository.save(product);

		String txnHash = this.uploadProductToBlockChain(p);
		System.out.println(txnHash);
		if (Objects.isNull(txnHash) || txnHash.isEmpty()) {
			model.addAttribute("message", "Update failure");
			model.addAttribute("product", product);
		} else {
			p.setTxnHash(txnHash);
			productRepository.save(p);
			model.addAttribute("message", "Update success");
			model.addAttribute("product", product);
		}

		return "redirect:/admin/products";
	}

	// show select option ở add product
	@ModelAttribute("categoryList")
	public List<Category> showCategory(Model model) {
		List<Category> categoryList = categoryRepository.findAll();
		model.addAttribute("categoryList", categoryList);

		return categoryList;
	}

	// get Edit brand
	@GetMapping(value = "/editProduct/{id}")
	public String editCategory(@PathVariable("id") Long id, ModelMap model) {
		Product product = productRepository.findById(id).orElse(null);

		model.addAttribute("product", product);

		return "admin/editProduct";
	}

	@PostMapping(value = "/updateProduct")
	public String updateProduct(@ModelAttribute("product") Product product, Model model,
			@RequestParam("file") MultipartFile file, HttpServletRequest httpServletRequest) {

		// Kiểm tra nếu có file ảnh được tải lên
		if (!file.isEmpty()) {
			try {
				// Lưu file ảnh mới lên server
				File convFile = new File(pathUploadImage + "/" + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(convFile);
				fos.write(file.getBytes());
				fos.close();
				// Cập nhật tên file ảnh mới cho sản phẩm
				product.setProductImage(file.getOriginalFilename());
			} catch (IOException e) {
				// Xử lý nếu có lỗi khi lưu file
				e.printStackTrace();
			}
		}

//        Product p = productRepository.save(product);
//        String txnHash = this.uploadProductToBlockChain(p);
//        System.out.println(txnHash);
//        if (Objects.isNull(txnHash) || txnHash.isEmpty()) {
//            model.addAttribute("message", "Update failure");
//            model.addAttribute("product", product);
//        } else {
//            p.setTxnHash(txnHash);
//            productRepository.save(p);
//            model.addAttribute("message", "Update success");
//            model.addAttribute("product", product);
//        }

        // Lưu thông tin sản phẩm vào cơ sở dữ liệu
		Product updatedProduct = productRepository.save(product);

		// Kiểm tra xem việc cập nhật sản phẩm thành công hay không và chuyển hướng tới trang danh
		// sách sản phẩm
		if (updatedProduct != null) {
			model.addAttribute("message", "Update success");
		} else {
			model.addAttribute("message", "Update failure");
		}
		return "redirect:/admin/products";
	}

	// delete category
	@GetMapping("/deleteProduct/{id}")
	public String delProduct(@PathVariable("id") Long id, Model model) {
		productRepository.deleteById(id);
		model.addAttribute("message", "Delete successful!");

		return "redirect:/admin/products";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

	private String uploadProductToBlockChain(Product product) {
		try {
			ProductRequestDto productRequestDto = ProductRequestDto.builder()
					.productId(product.getProductId().intValue())
					.productName(product.getProductName()).manufacturer(product.getProducer())
					.categoryId(product.getCategory().getCategoryId().toString())
					.productionDate(Instant.now().toEpochMilli()/1000)
					.build();
			return Optional
					.ofNullable(
							smartContractClient.uploadProductDataToBlockChain(productRequestDto))
					.map(ResponseEntity::getBody).map(TransactionHashResponse::getHash).orElse("");
		} catch (Exception exception) {
			return null;
		}
	}


//	private String uploadProductToBlockChain(Product product) {
//		try {
//			// Chuẩn hóa và mã hóa chuỗi thành UTF-8
//			String productName = new String(product.getProductName().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
//			String producer = new String(product.getProducer().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
//
//			String formattedData = String.join("\n",
//					"\nId: " + product.getProductId().intValue(),
//					"Name: " + productName,
//					"Producer: " + producer,
//					"Categories id: " + product.getCategory().getCategoryId(),
//					"Production date: " + (Instant.now().toEpochMilli() / 1000)+"\n"
//			);
//
//			// Loại bỏ các ký tự không hợp lệ
//			String cleanData = formattedData.replaceAll("[^\\x20-\\x7E\\p{L}\\p{N}\\s\\n]", "");
//
//			ProductRequestDto productRequestDto = ProductRequestDto.builder()
//					.productId(product.getProductId().intValue())
//					.productName(cleanData)
//					.manufacturer(producer)
//					.categoryId(product.getCategory().getCategoryId().toString())
//					.productionDate(Instant.now().toEpochMilli() / 1000)
//					.build();
//
//			return Optional
//					.ofNullable(smartContractClient.uploadProductDataToBlockChain(productRequestDto))
//					.map(ResponseEntity::getBody)
//					.map(TransactionHashResponse::getHash)
//					.orElse("");
//		} catch (Exception exception) {
//			exception.printStackTrace();
//			return null;
//		}
//	}

}
