package com.cetpa.service;

import java.util.Collection;

import com.cetpa.entity.Product;

public interface ProductService {

	void saveRecord(Product product);

	Collection<Product> getList();

	Product getProduct(int pid);

	void updateProduct(Product product);

	void deleteProductRecord(int pid);

}
