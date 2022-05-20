package com.htmall.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

/*
 * My Batis의 Mapper
 * -SQL을 설정하는 역할
 * - xml과 인터페이스 + 어노테이션
 */

public interface TimeMapper {

		@Select("SELECT SYSDATE FROM DUAL")
		public String getTime();
		public String getTime2();
}


