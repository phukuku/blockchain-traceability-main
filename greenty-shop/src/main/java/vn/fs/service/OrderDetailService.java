package vn.fs.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.fs.entities.Order;
import vn.fs.entities.Product;
import vn.fs.repository.OrderDetailRepository;
import vn.fs.repository.OrderRepository;
import vn.fs.repository.ProductRepository;


@Service
public class OrderDetailService {

	@Autowired
	OrderRepository repo;

	@Autowired
	ProductRepository proRepo;

	@Autowired
	OrderDetailRepository orderDetailRepo;

	public List<Order> listAll() {
		return (List<Order>) repo.findAll();
	}

	public long countOrderByProduct(long productId){
		Product pro = proRepo.findById(productId).get();
		return orderDetailRepo.countByProduct(pro);
	}
}
