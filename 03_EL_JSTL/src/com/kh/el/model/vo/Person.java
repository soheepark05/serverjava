package com.kh.el.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
//어노테이션
@Data //lombok.jr 다운로드파일을 저기 옆에 라이브러리에다가 복사해야댐..
//@Getter
@AllArgsConstructor
@NoArgsConstructor
//@EqualsAndHashCode

public class Person {
	
	
	private String name;
	
	private int age;
	
	private char gender;
	
}
