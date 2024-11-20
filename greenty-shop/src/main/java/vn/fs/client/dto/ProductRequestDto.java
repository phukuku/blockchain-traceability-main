package vn.fs.client.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductRequestDto {
    private int productId;
    private String productName;
    private String manufacturer;
    private long productionDate;
    private String categoryId;

}
