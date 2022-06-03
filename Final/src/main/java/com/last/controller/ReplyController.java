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

import com.last.domain.ReplyVO;
import com.last.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/replies")
@AllArgsConstructor
public class ReplyController {
	private ReplyService service;
	
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		log.info("ReplVO : " + vo);
		int inserCount = service.register(vo);
		log.info("Reply Insert Count : " + inserCount);
		return inserCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{proID}/{page}",
	produces =
	{MediaType.APPLICATION_RSS_XML_VALUE,MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ReplyVO>>getList(
			@PathVariable("page")int page,
			@PathVariable("proID")Long proID){
		log.info("getList.........");
		return new ResponseEntity<> (service.getListByProID(proID),HttpStatus.OK);
	}
	
	@GetMapping(value="/{rid}",
			produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_VALUE})
		public ResponseEntity<ReplyVO>get(@PathVariable("rid")Long rid){
	log.info("get: " + rid);
	return new ResponseEntity<>(service.get(rid),HttpStatus.OK);
	}
	@DeleteMapping(value="/{rid}",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rid")Long rid){
		log.info("remove:" + rid);
		return service.remove(rid) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH},
			value = "/{rid}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
			public ResponseEntity<String>modify(@RequestBody ReplyVO vo, @PathVariable("rid")Long rid){
		vo.setRid(rid);
		log.info("rid :" + rid); log.info("modify :" + vo);
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
	
//	@PostMapping(value="/new",
//			consumes= "application/json",
//			produces = {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
//		log.info("Reply VO :" + vo);
//		int insertCount = service.register(vo);
//		log.info("Reply INSERT COUNT:" + insertCount);
//		return insertCount ==1 
//				? new ResponseEntity<>("success", HttpStatus.OK)
//						:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
}
