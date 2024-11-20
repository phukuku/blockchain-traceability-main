package vn.fs.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import vn.fs.client.dto.ProductRequestDto;
import vn.fs.client.dto.TransactionHashResponse;

@FeignClient(name = "smart-contract-service",  url = "${client.smart-contract.be.url}")
public interface SmartContractClient {

    @PostMapping("/api/v1/products")
    ResponseEntity<TransactionHashResponse> uploadProductDataToBlockChain(@RequestBody ProductRequestDto request);
}
