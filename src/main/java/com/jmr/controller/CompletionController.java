package com.jmr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//import com.jmr.model.t_completion;
//import com.jmr.service.ICompletionService;

@Controller
@RequestMapping("")
public class CompletionController {
	@Autowired
	//ICompletionService t;
	
	@RequestMapping("completion-set")
    public ModelAndView listStudent(){
        ModelAndView mav = new ModelAndView();
        //List<t_completion> sl = t.list();
        
        // 放入转发参数
        //mav.addObject("sl", sl);
        // 放入jsp路径
        mav.setViewName("completion-set");
        return mav;
    }
	
	@RequestMapping("completion-check")
    public ModelAndView completionCheck(){
        ModelAndView mav = new ModelAndView();
        //List<t_completion> sl = t.list();
        
        // 放入转发参数
        //mav.addObject("sl", sl);
        // 放入jsp路径
        mav.setViewName("completion-check");
        return mav;
    }
	
	@RequestMapping("completion-info")
    public ModelAndView completionInfo(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("completion-info");
        return mav;
    }
	
	@RequestMapping("completion-checking")
    public ModelAndView completionChecking(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("completion-checking");
        return mav;
    }
}
