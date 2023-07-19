package com.korea.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.k2.login.LoginService;
import com.korea.k2.shop.MemberVO;

@Controller
public class LoginController {
	@Autowired
	private LoginService service;
	
	@RequestMapping("/login.do")
	private String login(Model model, MemberVO vo, HttpSession session) throws Exception {
		MemberVO m = service.login(vo);
		
		if(m == null || m.equals(null)) {
			System.out.println("===> 아이디가 존재하지 않습니다.");
			
			return "/login/login.jsp";
		} else {
			if(BCrypt.checkpw(vo.getPassword(), m.getPassword())) {
				System.out.println("===> 로그인 성공");
				session.setAttribute("m", m);
				
				return "/productSelectAll.do";
			} else {
				System.out.println("===> 패스워드가 일치하지 않습니다.");
				
				return "/login/login.jsp";
			}
		}
	}
	
	@RequestMapping("/logout.do")
	private String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "/index.jsp";
	}
}
