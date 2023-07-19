package com.korea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.k2.guestbook.GuestBookService;
import com.korea.k2.guestbook.GuestBookVO;

@Controller
public class GuestBookController {
	@Autowired
	private GuestBookService service;
	
	@RequestMapping("/guestbookInsert.do")
	private String guestbookInsert(GuestBookVO vo) throws Exception {
		String [] str1 = {"박","석","김","이","최","강","배","서","양"};
		String [] str2 = {"한영","기범","대경","상준","윤영","선주","주영","진호","지효"};
		String [] title = {"상품 너무 좋았어요.","적극 추천합니다.","배송이 엄청 빨라요.","평균 이상입니다.","보통이에요.","이를 수가 없어요.","정말 정말 찾던 물건이에요.","재구매 할게요.","이런 상품 정말 없어요."};
		
		for(int i = 1; i <= 555; i++) {
			int k1 = (int) (Math.random()*9);
			int k2 = (int) (Math.random()*9);
			int k3 = (int) (Math.random()*9);
			
			vo.setWriter(str1[k1] + str2[k2]);
			vo.setTitle(title[k3]);
			System.out.println("===> guestbookInsert : " + str1[k1] + str2[k2] + " : " + title[k3]);
			service.insert(vo);
		}

		return "/guestbook/guestbook_insert.jsp";
	}

	@RequestMapping("/guestbookList.do")
	private String guestbookList(Model model, GuestBookVO vo) throws Exception {
		System.out.println("===> guestbookList : " + vo);
		
		model.addAttribute("cnt", service.cnt(vo));  // VO 미작성 시 해당 변수에 값이 담겨서 넘어감
		model.addAttribute("li", service.list(vo));
		
		return "/guestbook/guestbook_list.jsp";
	}
	
}
