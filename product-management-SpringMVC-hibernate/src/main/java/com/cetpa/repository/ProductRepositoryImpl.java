package com.cetpa.repository;



import java.util.Collection;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.cetpa.entity.Product;

@Repository
public class ProductRepositoryImpl implements ProductRepository{


	private Session session;
	private Transaction transaction;
	public ProductRepositoryImpl(SessionFactory factory) {
		session=factory.openSession();
		transaction=session.getTransaction();
	}
	
	@Override
	public void saveProduct(Product product) {

//		transaction.begin();//because session is already opened
		//session.save(product);//Deprecated since spring 6.0
		session.persist(product);
		transaction.commit();
	}

	@Override
	public Collection<Product> getProductCollection() {
		
		Query<Product> query=session.createQuery("from Product",Product.class);
		Collection<Product> products=query.list();
		return products;
	}

	@Override
	public Product getProductById(int pid) {

		Product product=session.get(Product.class,pid);
		
		return product;
	}

	@Override
	public void updateRecord(Product producto,Product productn) {

			transaction.begin();
			producto.setName(productn.getName());
			producto.setBrand(productn.getBrand());
			producto.setPrice(productn.getPrice());
			transaction.commit();
	}

	@Override
	public void deleteProduct(int pid) {
				Product product = session.get(Product.class, pid);
				transaction.begin();
		        session.delete(product); // Deprecated since since spring 6.0
		        transaction.commit(); // Commit the transaction
		
		
	}

}
