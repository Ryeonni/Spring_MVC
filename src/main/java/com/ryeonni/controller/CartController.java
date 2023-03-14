package com.ryeonni.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ryeonni.cart.CartService;
import com.ryeonni.cart.CartVO;

@Controller
public class CartController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private CartService service;
	
	@RequestMapping("/cartInsert.do")
	String cartInsert(CartVO vo) {
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId); 
		
		//동일상품이 장바구니에 있는지 확인
		int count = service.countCart(vo.getProductIdx(), userId);
		
		if(count == 0) {
			//없으면 장바구니에 추가
			service.insert(vo);
		} else {
			//있으면 수량변경
			service.updateCart(vo);
		}
		return "/cartList.do";
	}
	
	@RequestMapping("/cartList.do")
	String cartList(CartVO vo) {
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		
		int count = service.userCart(vo); 
		
		session.setAttribute("count", count);
		session.setAttribute("list", service.cartAll(vo)); 
		session.setAttribute("totalPrice", service.totalCart(userId)); 
		return "/cart/List.jsp";
	}
	
	@RequestMapping("/cartUpdate.do")
	String cartUpdate(@RequestParam String[] amount, @RequestParam String[] cartIdx)  throws Exception {
		String userId = (String)session.getAttribute("userId");
		
		for(int i=0; i < cartIdx.length; i++) {
			CartVO vo = new CartVO();
			vo.setUserId(userId);
			vo.setAmount(Integer.parseInt(amount[i]));
			vo.setCartIdx(Integer.parseInt(cartIdx[i]));
			service.update(vo);
		}
		return "redirect:/cartList.do";
	}
	
	@RequestMapping("/cartDelete.do")
	String cartDelete(CartVO vo) {
		service.delete(vo);
		return "/cartList.do";
	}
	
	@RequestMapping("/cartDeleteAll.do")
	String cartDeleteAll(CartVO vo) {
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		service.deleteAll(vo);
		return "/cartList.do";
	}
	
	@RequestMapping("/insertOrder.do")
	String insertOrder(@RequestParam String[] cartIdx, @RequestParam String[] amount, @RequestParam String[] productIdx) throws Exception {
		String userId = (String)session.getAttribute("userId");
		
		for(int i=0; i<productIdx.length; i++) {
			CartVO vo = new CartVO();
			vo.setCartIdx(Integer.parseInt(cartIdx[i]));
			vo.setProductIdx(Integer.parseInt(productIdx[i]));
			vo.setUserId(userId);
			vo.setAmount(Integer.parseInt(amount[i]));
			service.insertOrder(vo);			
		}
		
		// 주문완료 후 장바구니 비우기 
		CartVO vo = new CartVO();
		vo.setUserId(userId);
		service.deleteAll(vo);
		return "cart/OrderEnd.jsp";
	}
	
	@RequestMapping("/userSales.do")
	String userSales(Model model) {
		model.addAttribute("list", service.userSales());
		return "cart/buyerGraph.jsp";
	}
}
