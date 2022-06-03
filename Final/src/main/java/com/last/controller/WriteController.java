package com.last.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.last.domain.UserVO;
import com.last.service.LoginService;
import com.last.service.WriteService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
//@AllArgsConstructor
@RequestMapping(value = "/write")
public class WriteController {
	@Autowired
	private WriteService writeService;

	@GetMapping(value = "/writeForm")
	public String loginForm() {
		System.out.println("register Mapping"); // log4j가 안먹힘 -> sysout으로 대체
		return "/write/writeAgreeForm";
	}

	// 회원가입 페이지
	@PostMapping(value = "/writeForm")
	public String loginForm(UserVO userVO) {

		System.out.println(userVO); // log4j가 안먹힘 -> sysout으로 대체
		System.out.println(writeService.existID(userVO));
		if(writeService.existID(userVO) == null) {
			writeService.register(userVO);
			return "redirect:/";
		}else {
			return "redirect:/write/writeForm";
		}
	}

}
