package com.jmr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//import com.jmr.model.t_class-series;
//import com.jmr.service.IClassSeriesService;

@Controller
@RequestMapping("")
public class ClassSeriesController {
	@Autowired
	//IClassSeriesService t;
	
	@RequestMapping("class-series-list")
    public ModelAndView listStudent(){
        ModelAndView mav = new ModelAndView();
        //List<t_class-series> sl = t.list();
        
        // 放入转发参数
        //mav.addObject("sl", sl);
        // 放入jsp路径
        mav.setViewName("class-series-list");
        return mav;
    }
}
