package com.last.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.domain.Criteria;
import com.last.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main/*")
@AllArgsConstructor
public class MainController {
	private ProductService service;
	@GetMapping("/list")
	public void list(Model model,Criteria cri) {
		 model.addAttribute("list", service.getList());
	}
}
