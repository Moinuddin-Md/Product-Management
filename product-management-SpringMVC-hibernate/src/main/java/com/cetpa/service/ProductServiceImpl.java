package com.cetpa.service;

import java.util.Collection;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cetpa.entity.Product;
import com.cetpa.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService{
	
	private ProductRepository productRepository;

	//Constructor Injection
	public ProductServiceImpl(ProductRepository productRepository) {
		super();
		this.productRepository = productRepository;
	}

	@Override
	public void saveRecord(Product product) {

		productRepository.saveProduct(product);
		
	}

	@Override
	public Collection<Product> getList() {
		
		
		return productRepository.getProductCollection();
	}

	@Override
	public Product getProduct(int pid) {
		
		return productRepository.getProductById(pid);
	}


	@Override
	public void updateProduct(Product productn) {
		
		Product producto=productRepository.getProductById(productn.getPid());
		productRepository.updateRecord(producto,productn);
		
	}

	@Override
	public void deleteProductRecord(int pid) {

		productRepository.deleteProduct(pid);
		
	}

}
