package com.user.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.domain.UserVO;
import com.user.service.UserWriteService;

@Controller
@RequestMapping(value="/write")
public class UserWriteController {
	
	@Autowired
	private UserWriteService memberWriteService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; //암호 복호화

	@GetMapping(value="/memberAgree")
	public String writeAgreeForm(Model model) {
		model.addAttribute("display", "write/writeAgreeForm.jsp");
		return "/index";
	}
	@GetMapping(value="memberWrite")
	public String memberWrite(Model model) {
		model.addAttribute("display", "write/memberWrite.jsp");
		return "/index";
	}

	@PostMapping("/writeEmailCheck")
	@ResponseBody
	public String writeEmailCheck(@ModelAttribute UserVO memberDTO) {
		
		UserVO memberDTO2 = memberWriteService.writeEmailCheck(memberDTO);
		
		if(memberDTO2 == null)
			return "writeEmailCheck_non_exist";
		else
			return memberDTO2.getId();
	}
	
	//이메일 발송
	@GetMapping(value="/writeEmailSend")
	@ResponseBody
	public String writeEmailSend(String email) throws Exception{
		System.out.println("UserWriteController 인증 이메일 : " + email);
		
		int checkNum = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		System.out.println("UserWriteController 인증번호 : " + checkNum);
		
		//이메일 보내기
		String setFrom = "@gmail.com";
		String toMail = email;
		String title = "이메일 인증번호가 발급되었습니다.";
		String content = 
                "안녕하세요. 헥토몰입니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		String num = checkNum + "";
		
		return num;
	}
	
	@PostMapping("/writeIdCheck")
	@ResponseBody
	public String writeIdCheck(String id) {
		MemberDTO memberDTO2 = memberWriteService.writeIdCheck(id);
		
		if(memberDTO2 == null)
			return "writeIdCheck_non_exist";
		else
			return memberDTO2.getId();
	}
	
	@RequestMapping(value="/writeOk", method=RequestMethod.POST)
	public String write(@ModelAttribute MemberDTO memberDTO, Model model) {
		memberDTO.setPwd(bcryptPasswordEncoder.encode(memberDTO.getPwd()));
		if(memberDTO.getIdPwdQuestion()=="false" || memberDTO.getIdPwdAnswer()=="") {
	         memberDTO.setIdPwdQuestion("false");
	         memberDTO.setIdPwdAnswer("false");
	    }
		
		if(memberDTO.getWritePath()=="")
			memberDTO.setWritePath("false");
		
		memberWriteService.write(memberDTO);
		model.addAttribute("id", memberDTO.getId());
		model.addAttribute("display", "write/writeOk.jsp");
		return "/index";
	}
	
}
