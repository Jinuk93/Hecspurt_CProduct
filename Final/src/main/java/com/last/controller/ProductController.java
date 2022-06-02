package com.last.controller;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.last.domain.ProductAttachVO;
import com.last.domain.ProductVO;
import com.last.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {
   private ProductService service;
   
   @GetMapping("/list")
   public void list(Model model) {
      log.info("list");
      model.addAttribute("list", service.getList());
   }
   @PostMapping("/register")
   public String register(ProductVO product, RedirectAttributes rttr) {
	   log.info("register :" + product);
	   
	   service.register(product);
	   rttr.addFlashAttribute("result", product.getProID());
	   return "redirect:/product/list";
   }
   
   
   @PostMapping("/register2")
   public String register2(ProductVO product, RedirectAttributes rttr) {
	   log.info("register :" + product);
	   
	   
	   MultipartFile uploadFile = product.getFile();
	   
	   
	   String uploadFolder = "E:\\upload\\";
       File uploadPath = new File(uploadFolder);
       log.info("upload Path: " + uploadPath);
       if (!uploadPath.exists()) {
           uploadPath.mkdirs();
       }
	   
       String uploadFileName = uploadFile.getOriginalFilename();
       log.info("uploadFileName: " + uploadFileName);

       product.setImageName(uploadFileName);
       
       File saveFile = new File(uploadPath, uploadFileName);
	   
       
       try {
		uploadFile.transferTo(saveFile);
	} catch (IOException e) {
		log.error(e.getMessage());
//		e.printStackTrace();
	} 
       
       
       
       
	  service.register2(product);
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   rttr.addFlashAttribute("result", product.getProID());
	   return "redirect:/product/list";
   }
   
   @GetMapping({"/get", "/modify"})
   public void get(@RequestParam("proID") Long proID, Model model) {
	   log.info("/get");
	   model.addAttribute("product" , service.get(proID));
   }
   @PostMapping("/modify")
   public String get(ProductVO product, RedirectAttributes rttr) {
//	   console.log("serjlskjdflkasjdlkasjdlkaskdjsa");
	   log.info("modify : " + product);
	   if(service.modify(product)) {
		   rttr.addFlashAttribute("result", "success");
	   }
	   return "redirect:/product/list";
   }
//   @PostMapping("/remove")
//   public String remove(@RequestParam("bno")Long
//		   bno, RedirectAttributes rttr) {
//	   log.info("remove......" + bno);
//	   if(service.remove(bno)) {
//		   deleteFile(attachList);
//		   rttr.addFlashAttribute("result","success");
//	   }
//	   return "redirect:/product/list";
//   }
   @PostMapping("/remove")
	public String remove(@RequestParam("proID") Long proID, RedirectAttributes rttr) {
		log.info("remove��.." + proID);

		List<ProductAttachVO> attachList = service.getAttachList(proID);
		if (service.remove(proID)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/product/list";
	}
   
   
   
   
   private void deleteFiles(List<ProductAttachVO> attachList) {
		if (attachList == null || attachList.size() == 0) {
			return;
		}

		log.info("delete attach files......");
		log.info("attachList : " + attachList);

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("e:/upload/" + attach.getUploadPath() + "/" + attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);

				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("e:/upload/" + attach.getUploadPath() + "/s_" + attach.getUuid() + "_" + attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error : " + e.getMessage());
			}
		});    // forEach
	}
   
   
   
   
   @GetMapping("/register")
   public void register() {
   }
   
   @GetMapping("/register2")
   public void register2() {
   }

   @GetMapping(value = "/getAttachList"
		   ,produces=MediaType.APPLICATION_JSON_VALUE)
   @ResponseBody
   public ResponseEntity<List<ProductAttachVO>>getAttachList(Long proID){
	   log.info("getAttachList" + proID);
	   return new ResponseEntity<>(service.getAttachList(proID),HttpStatus.OK);
   }
   
}

