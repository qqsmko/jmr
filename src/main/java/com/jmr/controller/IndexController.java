package com.jmr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("")
public class IndexController {
	
	@RequestMapping("index")
    public ModelAndView listStudent(){
        ModelAndView mav = new ModelAndView();
        
        // 放入jsp路径
        mav.setViewName("index");
        return mav;
    }
	
	@RequestMapping("welcome")
    public ModelAndView doWelcomeGET(){
        ModelAndView mav = new ModelAndView();
        
        // 放入jsp路径
        mav.setViewName("welcome");
        return mav;
    }
}
