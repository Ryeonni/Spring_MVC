package com.ryeonni.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ryeonni.board.BoardService;
import com.ryeonni.board.BoardVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	@RequestMapping("/Register.do") 
	String Register() {
		return "board/Register.jsp";
	}

	@RequestMapping("/boardRegisterOK.do") 
	String boardRegisterOk(BoardVO vo, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		vo.setWriter(userId);
		service.insert(vo);
		return "/boardList.do";
	}
	
	@RequestMapping("/boardEdit.do")
	String boardEdit(BoardVO vo) {
		service.update(vo);
		return "/boardList.do";
	}

	@RequestMapping("/boardDelete.do")
	String boardDelete(BoardVO vo) {
		service.delete(vo);
		return "/index.do";
	}

	@RequestMapping("/boardOne.do")
	String boardOne(BoardVO vo, Model model) {
		service.cnt(vo);
		model.addAttribute("one", service.boardOne(vo));
		return "board/Edit.jsp";
	}

	@RequestMapping("/boardList.do")
	String boardList(BoardVO vo, Model model) {
		int start;
		if(vo.getStart() == 0) {
			start = 1;
		} else {
			start = vo.getStart();
		}

		int pageSize = 10;
		int pageListSize = 3;
		int total = service.boardTotal(vo);
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
		model.addAttribute("list", service.boardAll(vo));
		return "board/List.jsp";
	}
}
