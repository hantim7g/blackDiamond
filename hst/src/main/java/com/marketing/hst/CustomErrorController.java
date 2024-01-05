package com.marketing.hst;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;

import jakarta.servlet.http.HttpSession;


@Controller
public class CustomErrorController implements ErrorController {

@Autowired
private ProductRepository prodRepository; 
    @RequestMapping("/error")
	public ModelAndView home(HttpSession ht) throws JsonProcessingException {
    	String login=ht.getAttribute("login")!=null ?ht.getAttribute("login").toString():"0";
		if(login.equalsIgnoreCase("1")) {
			 Date today = new Date();
		 		
		 		ModelAndView mv = new ModelAndView("home");
		 		mv.addObject("productList", prodRepository.findActiveProducts(today));
		 		return mv;
			
		}
		return new ModelAndView("login");
		

	
	}
	/*
	 * @Override public String getErrorPath() { return "/error"; }
	 */
}
