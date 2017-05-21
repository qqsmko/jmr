package com.jmr.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jmr.model.Teacher;
import com.jmr.service.ITeacherService;

@Controller
@RequestMapping("")
public class TeacherController {
	@Autowired
	ITeacherService t;
	
	@RequestMapping(value="teacher-list",method=RequestMethod.GET)
    public ModelAndView listTeacher(){
        ModelAndView mav = new ModelAndView();
        List<Teacher> sl = t.list();
        
        // 鏀惧叆杞彂鍙傛暟
        mav.addObject("sl", sl);
        // 鏀惧叆jsp璺緞
        mav.setViewName("teacher-list");
        return mav;
    }
	
	@RequestMapping(value="teacher-list/delete",method=RequestMethod.POST)
	@ResponseBody
	public String doDelete(HttpServletRequest request, HttpServletResponse response){
		String s = request.getParameter("id");
		try {
		    int b = Integer.valueOf(s).intValue();
		    t.deleteOne(b);
		    return "{\"success\":true}";
		} catch (NumberFormatException e) {
		    e.printStackTrace();
		}
		return "{\"success\":false}";
	}
	
	@RequestMapping(value="teacher-list/deleteall",method=RequestMethod.POST)
	@ResponseBody
	public String doDeleteAll( @RequestParam (value = "ids[]",required = false,defaultValue = "") String[] ids){
		int lens = ids.length;
		for(int i=0;i<lens;i++){
			try {
			    int b = Integer.valueOf(ids[i]).intValue();
			    t.deleteOne(b);
			} catch (NumberFormatException e) {
			    e.printStackTrace();
			    return "{\"success\":false}";
			}
		}
		return "{\"success\":true}";
	}
	
	@RequestMapping(value="teacher-update",method=RequestMethod.GET)
    public ModelAndView teacherUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		
		String id = request.getParameter("id");
		mav.addObject("id",id);
		
        // 放入jsp路径
        mav.setViewName("teacher-update");
        return mav;
	}
	
	@RequestMapping(value="teacher-update/submit",method=RequestMethod.GET)
	@ResponseBody
	public String doUpdate(HttpServletRequest request, HttpServletResponse response){
		String teacherid = request.getParameter("teacherid");
		String name = request.getParameter("name");
		t.updateOne(teacherid, name);
		return "{\"success\":true}";
	}
	
	@RequestMapping(value="teacher-add",method=RequestMethod.GET)
    public ModelAndView teacherAdd(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		
        // 放入jsp路径
        mav.setViewName("teacher-add");
        return mav;
	}
	
	@RequestMapping(value="teacher-add/submit",method=RequestMethod.GET)
	@ResponseBody
	public String doAdd(HttpServletRequest request, HttpServletResponse response){
		
		String name = request.getParameter("name");
		t.insertOne(name);
		return "{\"success\":true}";
	}
}