package com.jmr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jmr.model.Attendance;
import com.jmr.service.IAttendanceService;

@Controller
@RequestMapping("")
public class AttendanceController {
	@Autowired
	IAttendanceService t;
	
	@RequestMapping("attendance-list")
    public ModelAndView listStudent(){
        ModelAndView mav = new ModelAndView();
        List<Attendance> sl = t.list();
        
        // 放入转发参数
        mav.addObject("sl", sl);
        // 放入jsp路径
        mav.setViewName("attendance-list");
        return mav;
    }
}
