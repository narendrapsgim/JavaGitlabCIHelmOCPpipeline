package com.jvm.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/")
public class Web {
	
	@GetMapping("/")
	public String callweb() {
		return "Demo for Java Springboot Openshift";
	}

}
