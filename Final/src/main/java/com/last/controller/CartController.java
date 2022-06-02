package com.last.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.last.domain.CartVO;
import com.last.service.CartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/cart")
@RestController
@Log4j
@AllArgsConstructor
public class CartController {
	private CartService service;
	
	@PostMapping(value="/new", consumes="application/json",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody CartVO vo){
		log.info("Cart vo : "+vo);
		int insertCount=service.register(vo);
		return insertCount==1? new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@PostMapping(value="/get",consumes="application/json")
	public ResponseEntity<CartVO> get(@RequestBody CartVO vo){
		log.info("get Cart");
		return new ResponseEntity<>(service.get(vo),HttpStatus.OK);
	}
	@GetMapping(value="/list/{userID}",produces= {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<CartVO>> getList(@PathVariable("userID")String userID){
		log.info("get List Cart");
		return new ResponseEntity<>(service.getListByID(userID),HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{cID}",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("cID")int cID){
		log.info("remove : "+cID);
		return service.remove(cID)==1?new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH},
			value="/{cID}",consumes="application/json",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody CartVO vo,@PathVariable("cID")int cID){
		vo.setCID(cID);
		return service.modify(vo)==1?new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
