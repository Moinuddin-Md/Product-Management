package com.cetpa.controller;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cetpa.entity.Product;
import com.cetpa.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("insert-form")
	public ModelAndView getInsertFormView() {
		ModelAndView view=new ModelAndView("insert.jsp");
		return view;
	}
	
	@PostMapping("save-record")
	public String saveProductRecord(Product product, Model model) {
		
		Product existingProduct=productService.getProduct(product.getPid());
		if(existingProduct != null) {
			model.addAttribute("pid",product.getPid());
			return "error.jsp";
		}
		else {
			productService.saveRecord(product);
			return "save-success.jsp";
		}
	}
	
	@GetMapping("product-list")
	public String getProductList(Model model){
		
		Collection<Product> products=productService.getList(); 
		model.addAttribute("plist",products);
		return "product-list.jsp";
	}
	
	@GetMapping("search-record")
	public String getSearchRecordView() {
		
		return "search.jsp";
	}
	
	@GetMapping("show-record")
	public String getProductRecord(int pid,Model model) {
		
		Product product=productService.getProduct(pid);
		if(product==null) {
			model.addAttribute("pid",pid);
			model.addAttribute("msg","Product Record Not Found!..");
			return "search.jsp";
		}
		model.addAttribute("product",product);
		return "show-record.jsp";
	}
	
	@GetMapping("edit-record")
	public String getEditRecordView() {
		
		return "edit.jsp";
	}

	@GetMapping("show-edit-record")
	public String getProductRecordToEdit(int pid,Model model) {
		
		Product product=productService.getProduct(pid);
		if(product==null) {
			model.addAttribute("pid",pid);
			model.addAttribute("msg","Product Record Not Found!..");
			return "search.jsp";
		}
		model.addAttribute("product",product);
		return "edit-show.jsp";
	}
	
	@PostMapping("update-product")
	public String updateProductRecord(Product productn){
		productService.updateProduct(productn);
		return "update-success.jsp";
	}
	
	@GetMapping("delete-record")
	public String getDeletRecordView() {
		
		return "delete.jsp";
	}
	
	@GetMapping("confirm-delete")
	public String getConfirmDeleteView(int pid,Model model) {
		Product product=productService.getProduct(pid);
		if(product==null) {
			model.addAttribute("pid",pid);
			model.addAttribute("msg","Product Record Not Found!..");
			return "search.jsp";
		}
		model.addAttribute("product",product);
		return "confirm-delete.jsp";
	}
	
	@GetMapping("delete-product-record")
	public String getdeleteProductRecordView(int pid) {
		productService.deleteProductRecord(pid);
		return "delete-success.jsp";
	}
	
}
