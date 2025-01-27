package com.cetpa.repository;

import java.util.Collection;

import com.cetpa.entity.Product;

public interface ProductRepository {

	void saveProduct(Product product);

	Collection<Product> getProductCollection();

	Product getProductById(int pid);

	void updateRecord(Product producto,Product productn);

	void deleteProduct(int pid);

}
