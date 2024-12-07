package vn.fs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import vn.fs.entities.Product;
import vn.fs.service.ProductRecommendationService;

import java.util.List;

@RestController
@RequestMapping("/api/products")
public class ProductRecommendationController {

    @Autowired
    private ProductRecommendationService recommendationService;

    @GetMapping("/recommendations/{productId}")
    public ResponseEntity<List<Product>> getRecommendedProducts(@PathVariable Long productId) {
        List<Product> recommendedProducts = recommendationService.getRecommendedProducts(productId);
        if (recommendedProducts.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(recommendedProducts);
    }
}
