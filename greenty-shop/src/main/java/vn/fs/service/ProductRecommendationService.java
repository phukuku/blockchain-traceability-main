package vn.fs.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.fs.entities.Product;
import vn.fs.repository.ProductRepository;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProductRecommendationService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderDetailService orderDetailService;

    // Phương pháp tính độ tương tự giữa các sản phẩm
    public List<Product> getRecommendedProducts(Long productId) {
        // Lấy sản phẩm từ cơ sở dữ liệu
        Optional<Product> product = productRepository.findById(productId);
        if (!product.isPresent()) {
            return Collections.emptyList();  // Nếu không tìm thấy sản phẩm
        }

        // Lấy danh sách tất cả sản phẩm
        List<Product> allProducts = productRepository.findAll();

        // Tính độ tương tự giữa sản phẩm yêu cầu và các sản phẩm khác
        List<Product> recommendedProducts = allProducts.stream()
                .filter(p -> !p.getProductId().equals(productId))  // Loại bỏ chính sản phẩm đó
                .sorted((p1, p2) -> {
                    double similarity1 = calculateSimilarity(product.get(), p1);
                    double similarity2 = calculateSimilarity(product.get(), p2);
                    return Double.compare(similarity2, similarity1);  // Sắp xếp theo độ tương tự giảm dần
                })
                .limit(10)  // Lấy 5 sản phẩm có độ tương tự cao nhất
                .collect(Collectors.toList());

        return recommendedProducts;
    }

    // Tính toán độ tương tự (sử dụng TF-IDF hoặc các kỹ thuật tương tự)
    private double calculateSimilarity(Product product1, Product product2) {
        double similarity = 0.0;

        // Tính độ tương tự dựa trên các thuộc tính
        // 1. Tính similarity giữa tên sản phẩm
        similarity += calculateStringSimilarity(product1.getProductName(), product2.getProductName()) * 0.3;

        // 2. Tính similarity giữa tên loại sản phẩm (có thể sử dụng phương pháp TF-IDF hoặc cosine similarity)
        similarity += calculateStringSimilarity(product1.getCategory().getCategoryName(), product2.getCategory().getCategoryName()) * 0.3;

        // 3. Tính similarity giữa lượt mua
        long count1 = orderDetailService.countOrderByProduct(product1.getProductId());
        long count2 = orderDetailService.countOrderByProduct(product2.getProductId());

        similarity += calculateLongSimilarity(count1, count2) * 0.25;

        // 4. Tính similarity giữa mức giá
        similarity += 1 - Math.abs(product1.getPrice() - product2.getPrice()) / Math.max(product1.getPrice(), product2.getPrice()) * 0.15;

        return similarity;
    }

    // Hàm tính similarity giữa 2 chuỗi (có thể dùng Cosine Similarity hoặc Levenshtein Distance)
    private double calculateStringSimilarity(String str1, String str2) {
        // Ví dụ sử dụng phương pháp Levenshtein Distance
        return 1.0 - (double) StringUtils.getLevenshteinDistance(str1, str2) / Math.max(str1.length(), str2.length());
    }

    private double calculateLongSimilarity(long value1, long value2) {

        if (value1 == 0 && value2 == 0) {
            return 1.0; // Nếu cả hai đều bằng 0, độ tương tự là tuyệt đối
        }

        return 1.0 - (double) Math.abs(value1 - value2) / Math.max(value1, value2);
    }
}