package com.example.spring01.service;

import java.util.List;

import com.example.spring01.model.dto.MemberDTO;
import com.example.spring01.model.dto.ProductDTO;

public interface ProductService {
	public List<ProductDTO> productList();
	public ProductDTO productDetail(int productId);
	public void productInsert(ProductDTO dto);
	public void productUpdate(ProductDTO dto); 
	public void productDelete(int productId);
	String fileInfo(int productId);	
}
