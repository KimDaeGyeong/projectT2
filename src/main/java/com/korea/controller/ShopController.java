package com.korea.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.k2.shop.MemberVO;
import com.korea.k2.shop.MoneyVO;
import com.korea.k2.shop.ShopService;

@Controller
public class ShopController {
	ShopController(){
		// System.out.println("===> ShopController 확인");
	}
	
	@Autowired
	private ShopService service;
	
	@RequestMapping("/shopSelectAll.do")
	private String selectAll(Model model, MemberVO vo) {
		model.addAttribute("li", service.selectAll(vo));
		
		return "/shop/shop_selectAll.jsp";
	}
	
	@RequestMapping("/shopForm.do")
	private String shopForm(Model model) {
		model.addAttribute("custno", service.custNo());

		return "/shop/shop_form.jsp";
	}
	
	@RequestMapping("/shopFormOk.do")
	private String shopForm(MemberVO vo) {
		// System.out.println("===> vo 확인 : " + vo);
		String password = BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt());
		vo.setPassword(password);
		
		service.shopForm(vo);

		return "/shopSelectAll.do";
	}
	
	@RequestMapping("/shopSelectOne.do")
	private String selectOne(HttpSession session, MemberVO vo) {
		// System.out.println("===> vo 확인 : " + vo);
		session.setAttribute("m", service.selectOne(vo));
		
		return "/shop/shop_selectOne.jsp";
	}
	
	@RequestMapping("/shopUpdate.do")
	private String shopUpdate(MemberVO vo) {
		// System.out.println("===> vo 확인 : " + vo);
		service.shopUpdate(vo);

		return "/shopSelectAll.do";
	}
	
	@RequestMapping("/shopMoney.do")
	private String shopMoney(Model model, MoneyVO vo) {
		model.addAttribute("li", service.shopMoney());
		
		return "/shop/shop_money.jsp";
	}
	
	@RequestMapping("/IdCk.do")
	private void IdCk(HttpServletResponse response, MemberVO vo) throws Exception {
		PrintWriter out = response.getWriter();
		String str = service.idCk(vo);
		System.out.println("===> str : " + str);
		if(str == null) {
			if(vo.getId() != "") {
				out.print("T");
			}
		} else {
			out.print("F");
		}
	}
		
}
