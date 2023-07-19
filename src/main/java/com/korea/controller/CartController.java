package com.korea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.korea.k2.cart.CartService;
import com.korea.k2.cart.CartVO;
import com.korea.k2.cart.OrderJumunseoVO;
import com.korea.k2.cart.OrderMoneyVO;
import com.korea.k2.cart.OrderOneVO;

@Controller
public class CartController {
	@Autowired
	private CartService service;
	
	@RequestMapping("/cartInsert.do")
	private String cartInsert(CartVO vo) throws Exception {
		System.out.println("===> cartInsert : " + vo);
		service.insert(vo);

		return "/cartSelectAll.do";
	}
	
	@RequestMapping("/cartDeleteOne.do")
	private String cartDeleteOne(CartVO vo) throws Exception {
		System.out.println("===> cartDeleteOne : " + vo);
		service.deleteOne(vo);

		return "/cartSelectAll.do";
	}
	
	@RequestMapping("/cartDeleteAll.do")
	private String cartDeleteAll(CartVO vo) throws Exception {
		System.out.println("===> cartDeleteAll : " + vo);
		service.deleteAll(vo);

		return "/cartSelectAll.do";
	}
	
	@RequestMapping("cartSelectAll.do")
	private String cartSelectAll(Model model, CartVO vo) throws Exception {
		System.out.println("===> cartSelectAll : " + vo);
		model.addAttribute("li", service.selectAll(vo));
		
		return "/cart/cart_selectAll.jsp";
	}
	
	@RequestMapping("cartUpdate.do")
	private String cartUpdate(
			@RequestParam String[] cartId, 
			@RequestParam String[] custno,
			@RequestParam String[] productId,
			@RequestParam String[] amount) throws Exception {
		String custnoStr = "";
		
		for(int i = 0; i < cartId.length; i++) {
			CartVO vo = new CartVO();
			custnoStr = custno[i];
			vo.setCartId(Integer.parseInt(cartId[i]));
			vo.setAmount(Integer.parseInt(amount[i]));
			service.update(vo);
		}
				
		return "redirect:/cartSelectAll.do?custno=" + custnoStr;
	}
	
	@RequestMapping("cartOrder.do")
	private String cartOrder(
			@RequestParam String[] cartId, 
			@RequestParam String[] custno,
			@RequestParam String[] productId,
			@RequestParam String[] productName,
			@RequestParam String[] amount, OrderMoneyVO Mvo) throws Exception {
		Mvo.setOcustno(Integer.parseInt(custno[0]));
		service.insertOrderMoney(Mvo);
		int orderG = service.orderG(Mvo);
		
		int custnoStr = 0;
		
		OrderJumunseoVO Ovo = null;
				
		for(int i = 0; i < cartId.length; i++) {
			Ovo = new OrderJumunseoVO();
			custnoStr = Integer.parseInt(custno[i]);
			Ovo.setCartId(Integer.parseInt(cartId[i]));
			Ovo.setCustno(Integer.parseInt(custno[i]));
			Ovo.setProductId(Integer.parseInt(productId[i]));
			Ovo.setProductName(productName[i]);
			Ovo.setAmount(Integer.parseInt(amount[i]));
			Ovo.setOrderG(orderG);
			
			service.insertOrderJumunseo(Ovo);
			System.out.println("===> cartOrder : " + Ovo);
		}
		
		CartVO cartVO = new CartVO();
		cartVO.setCustno(custnoStr);
		service.deleteAll(cartVO);
		
		String custnoK = String.valueOf(custnoStr);
		
		return "redirect:/cartSelectAll.do?custno=" + custnoK;
	}
	
	@RequestMapping("orderSelectAll.do")
	private String orderSelectAll(Model model, OrderMoneyVO Mvo) throws Exception {
		System.out.println("===> orderSelectAll : " + Mvo);
		model.addAttribute("li", service.orderSelectAll(Mvo));
		
		return "/cart/order_selectAll.jsp";
	}
	
	@RequestMapping("/orderSelectOne.do")
	private String orderSelectOne(Model model, OrderOneVO vo) throws Exception {
		System.out.println("===> orderSelectOne : " + vo);
		model.addAttribute("one", service.orderSelectOne(vo));
		
		return "/cart/order_selectOne.jsp";
	}
		
}
