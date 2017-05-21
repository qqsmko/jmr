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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.jmr.model.Region;
import com.jmr.model.Region;
import com.jmr.service.IRegionService;

@Controller
@RequestMapping("")
public class RegionController {
	@Autowired
	IRegionService t;
	
	@RequestMapping(value="region-list",method=RequestMethod.GET)
    public ModelAndView listRegion(){
        ModelAndView mav = new ModelAndView();
        List<Region> sl = t.list();
        
        // 鏀惧叆杞彂鍙傛暟
        mav.addObject("sl", sl);
        // 鏀惧叆jsp璺緞
        mav.setViewName("region-list");
        return mav;
    }
	
	@RequestMapping(value="region-list/delete",method=RequestMethod.POST)
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
	
	@RequestMapping(value="region-list/deleteall",method=RequestMethod.POST)
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
	
	@RequestMapping(value="region-update",method=RequestMethod.GET)
    public ModelAndView regionUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		
		String id = request.getParameter("id");
		mav.addObject("id",id);
		
        // 放入jsp路径
        mav.setViewName("region-update");
        return mav;
	}
	
	@RequestMapping(value="region-update/submit",method=RequestMethod.GET)
	@ResponseBody
	public String doUpdate(HttpServletRequest request, HttpServletResponse response){
		String regionid = request.getParameter("regionid");
		String regionname = request.getParameter("regionname");
		String parentregion = request.getParameter("parentregion");
		t.updateOne(regionid, regionname, parentregion);
		return "{\"success\":true}";
	}
	
	@RequestMapping(value="region-add",method=RequestMethod.GET)
    public ModelAndView regionAdd(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		
        // 放入jsp路径
        mav.setViewName("region-add");
        return mav;
	}
	
	@RequestMapping(value="region-add/submit",method=RequestMethod.GET)
	@ResponseBody
	public String doAdd(HttpServletRequest request, HttpServletResponse response){
		
		String regionname = request.getParameter("regionname");
		String parentregion = request.getParameter("parentregion");
		t.insertOne(regionname, parentregion);
		return "{\"success\":true}";
	}
	
	@RequestMapping(value="region-add/submit",method=RequestMethod.POST)
	@ResponseBody
	public String doAddPOST(@RequestBody Region temp){
		
		t.insertRegion(temp);
		return "{\"success\":true}";
	}
}
