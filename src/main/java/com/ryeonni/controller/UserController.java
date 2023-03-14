package com.ryeonni.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ryeonni.user.BCrypt;
import com.ryeonni.user.UserService;
import com.ryeonni.user.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService service;

	@RequestMapping("/index.do")
	String index() {
		return "/index.jsp";
	}

	@RequestMapping("/idCheck.do")
	void idCheck(UserVO vo, HttpServletResponse response) throws Exception {
		String userId = service.idCheck(vo);
		PrintWriter out = response.getWriter();
		out.print(userId);
	}

	@RequestMapping("/userJoinOk.do")
	String userJoin(UserVO vo) {
		String Pwd = BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt());
		vo.setPassword(Pwd);
		service.insert(vo);
		return "/index.jsp";
	}
	
	@RequestMapping("/userLogin.do")
	void userLogin(UserVO vo, HttpServletResponse response, HttpSession session) throws Exception {
		PrintWriter out = response.getWriter();
		UserVO uservo = service.login(vo);
		
		if(uservo == null || uservo.equals(null)) { 
			out.print(0);
		} else {
			if(BCrypt.checkpw(vo.getPassword(), uservo.getPassword())) {
				session.setAttribute("userId", vo.getId());
				out.print(1);
			} else {
				out.print(0);
			}
		}
	} 
	
	@RequestMapping("/Logout.do")
	String userLogout(HttpSession session) {
		session.invalidate();
		return "user/Login.jsp";
	}

	@RequestMapping("/userEdit.do")
	String userEdit(UserVO vo) {
		String Pwd = BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt());
		vo.setPassword(Pwd);
		service.update(vo);
		return "/index.jsp";
	}

	@RequestMapping("/userDelete.do")
	String userDelete(UserVO vo) {
		service.delete(vo);
		return "/index.jsp";
	}

	@RequestMapping("/userOne.do")
	String userOne(UserVO vo, HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		vo.setId(userId);
		model.addAttribute("li", service.userOne(vo));
		return "user/Edit.jsp";
	}

	@RequestMapping("/userList.do")
	String userList(Model model) {
		model.addAttribute("list", service.userAll());
		return "user/List.jsp";
	}

	@RequestMapping("/userOneAdmin.do")
	String userOneAdmin(UserVO vo, Model model) {
		model.addAttribute("li", service.userOne(vo));
		return "user/Edit_Admin.jsp";
	}

}
