package com.korea.controller;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.korea.k2.product.ProductService;
import com.korea.k2.product.ProductVO;

@Controller
public class ProductController {
	String path = "";
	String timeStr = "";

	@Autowired
	private ProductService service;
	
	// 파일 저장 시 위치 잡아주기(1)
	@Autowired
	private ServletContext servletContext;
	
	// 파일 저장 시 위치 잡아주기(2)
	@PostConstruct
	public void init() {
		path = servletContext.getRealPath("/product/files/");
	}
	
	
	@RequestMapping("/productInsert.do")
	private String insert(ProductVO vo) throws Exception {
		// 파일 저장시 시간 추가
		long time = System.currentTimeMillis();
		SimpleDateFormat daytime = new SimpleDateFormat("HHmmss");
		timeStr = daytime.format(time);

    	System.out.println("===> path : "+path);

		// 파일 저장 이름
		String fileName = "";
		
		MultipartFile updateFile = vo.getProductImg();
		fileName = updateFile.getOriginalFilename();
		
		File f = new File(path + fileName);
		
		// 저장 시 기존 있을 경우 시간추가해서 생성 및 없이 저장 시 space.png 로 저장
		if(!updateFile.isEmpty()) {
			if(f.exists()) {
				String onlyFileName = fileName.substring(0, fileName.lastIndexOf("."));
				String extention = fileName.substring(fileName.lastIndexOf("."));
				fileName = onlyFileName + "_" + timeStr + extention;
			}
			updateFile.transferTo(new File(path + fileName));
		} else {
			fileName = "space.png";
		}
		System.out.println("===> fileName 확인 : " + fileName);
		vo.setProductImgStr(fileName);		
		service.insert(vo);
		
		return "/productSelectAll.do";
	}
	
	@RequestMapping("/productSelectAll.do")
	private String selectAll(Model model, ProductVO vo) throws Exception {
		model.addAttribute("li", service.selectAll(vo));

		return "/product/product_selectAll.jsp";
	}
	
	@RequestMapping("/productSelectOne.do")
	private String selectOne(Model model, ProductVO vo) throws Exception {
		model.addAttribute("p", service.selectOne(vo));
		
		return "/product/product_selectOne.jsp";
	}
	
	@RequestMapping("/productDelete.do")
	private String delete(Model model, ProductVO vo) throws Exception {
		service.delete(vo);
		
		return "/productSelectAll.do";
	}
	
}
