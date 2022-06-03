package com.last.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.last.domain.UserVO;
import com.last.service.LoginService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
//@AllArgsConstructor
@RequestMapping(value = "/login")
public class LoginController {
	@Autowired
	private LoginService loginService;

	// 로그인을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	// 로그인 페이지
	@GetMapping(value = "/loginForm")
	public String loginForm() {
		System.out.println("login Mapping"); // log4j가 안먹힘 -> sysout으로 대체
		return "/login/loginForm";
	}

	// 로그인 처리
	@RequestMapping(value = "/login", method= { RequestMethod.POST })
	//@PostMapping(value = "/login")
	public String loginCheck(@ModelAttribute UserVO vo, HttpSession session, HttpServletRequest request) {
		System.out.println(" POST : /login/login" + vo );
		boolean result = loginService.loginCheck(vo, session);
		String path ="";
		if (result == true) { // 로그인 성공
			// index.jsp로 이동
			path = "/";
			//mav.addObject("msg", "success");
		} else { // 로그인 실패
			// login.jsp로 이동
			path = "/login/loginForm";
			//mav.addObject("msg", "failure");
		}
		System.out.println("path ::: " + path);
		System.out.println("result :: " + result);
		
		return "redirect:"+ path;
	}
}
