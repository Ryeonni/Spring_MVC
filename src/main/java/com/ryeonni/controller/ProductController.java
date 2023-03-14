package com.ryeonni.controller;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ryeonni.product.ProductService;
import com.ryeonni.product.ProductVO;

@Controller
public class ProductController {
	String imgpath="";
	String timeStr="";
	
	@Autowired 
	private ServletContext servletContext;
	
	@Autowired
	private ProductService service;
	
	@PostConstruct
	public void init() {
		imgpath = servletContext.getRealPath("/product/image/");
	}
	
	@RequestMapping("/productRegister.do")
	String insert(ProductVO vo) throws Exception {
		MultipartFile image = vo.getImg();
		String fileName = image.getOriginalFilename(); 
		
		File file = new File(imgpath+fileName);
		if(!image.isEmpty()) { 
			if(file.exists()) { // 파일중복처리 
				//System.out.println("중복 파일이 존재합니다!!");
				fileName = ReName(fileName);
			}
			image.transferTo(new File(imgpath+fileName));  
		} else {
			fileName = "space.png"; 
		}
		vo.setProductImgStr(fileName);
		service.insert(vo);
		return "/productList.do";
	}
	
	private String ReName(String fileName) {
		long time = System.currentTimeMillis();
		SimpleDateFormat daytime = new SimpleDateFormat("HHmmss");
		timeStr = daytime.format(time);
		
		String onlyFileName = fileName.substring(0,fileName.lastIndexOf(".")); 
		String extension = fileName.substring(fileName.lastIndexOf("."));  
		String RefileName = onlyFileName + "_" + timeStr + extension;
		return RefileName;
	}

	@RequestMapping("/productOne.do")
	String productOne(ProductVO vo, Model model) {
		service.cnt(vo);
		model.addAttribute("one", service.productOne(vo));	
		return "product/Edit.jsp";
	}
	
	@RequestMapping("/productOneAdmin.do")
	String productOneAdmin(ProductVO vo, Model model) {
		model.addAttribute("one", service.productOne(vo));	
		return "product/Edit_admin.jsp";
	}
	
	@RequestMapping("/productList.do")
	String productList(ProductVO vo, Model model) {
		int start;
		if(vo.getStart() == 0) {
			start = 1;
		} else {
			start = vo.getStart();
		}
		
		int pageSize = 5;
		int pageListSize = 4;
		int total = service.productTotal(vo);
		int totalPage = (int)(Math.ceil((double)total / pageSize));
		int nowPage = start / pageSize +1;
		int listStartPage = (nowPage -1)/pageListSize*pageListSize+1;
		int listEndPage = listStartPage + pageListSize -1;
		int endPage = (totalPage -1) * pageSize +1;
		
		vo.setStart(start);
		vo.setPageSize(pageSize);
		vo.setPageListSize(pageListSize);
		vo.setTotal(total);
		vo.setTotalPage(totalPage);
		vo.setNowPage(nowPage);
		vo.setListStartPage(listStartPage);
		vo.setListEndPage(listEndPage);
		vo.setEndPage(endPage);
		
		model.addAttribute("page", vo);	
		model.addAttribute("list", service.productAll(vo));		
		return "product/List.jsp";
	}
	
	@RequestMapping("/productUpdate.do")
	String productUpdate(ProductVO vo)  throws Exception {
		MultipartFile updateImage = vo.getImg();
		String fileName = updateImage.getOriginalFilename(); 
		
		File file = new File(imgpath+fileName);
		if(!updateImage.isEmpty()) { 
			ProductVO delvo = service.productOne(vo);
			String delProductFile = delvo.getProductImgStr();
			
			File delFile = new File(imgpath + delProductFile); 
			if(delFile.exists()) { 
				if(!delFile.equals("space.png")) {
					delFile.delete();
				}
			}
			if(file.exists()) { 
				//System.out.println("중복 파일이 존재합니다!!");
				fileName = ReName(fileName);
			}
			updateImage.transferTo(new File(imgpath+fileName)); 
		} 
		vo.setProductImgStr(fileName);
		service.update(vo);
		return "/productList.do";
	}

}
