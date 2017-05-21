package com.jmr.controller;

import java.util.List;
import java.util.Map;

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

import com.jmr.model.Institutions;
import com.jmr.service.IInstitutionsService;

@Controller
@RequestMapping("")
public class InstitutionsController {
	@Autowired
	IInstitutionsService institutionsService;
	
	@RequestMapping(value="institutions-list",method=RequestMethod.GET)
    public ModelAndView doListGET(){
        ModelAndView mav = new ModelAndView();
        List<Institutions> sl = institutionsService.list();
        
        // 鏀惧叆杞彂鍙傛暟
        mav.addObject("sl", sl);
        // 鏀惧叆jsp璺緞
        mav.setViewName("institutions-list");
        return mav;
    }
	
	@RequestMapping(value="institutions-list",method=RequestMethod.POST)
	@ResponseBody
	public String doListPOST(@RequestParam int id){
		System.out.println(id);
		institutionsService.setOnesState(id, 1);
        return "{\"success\":true}";
    }
	
	@RequestMapping("institutions-check")
    public ModelAndView institutionsCheck(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("institutions-check");
        return mav;
    }
	
	@RequestMapping("institutions-new")
    public ModelAndView institutionsNew(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("institutions-new");
        return mav;
    }
	
	@RequestMapping(value="institutions-new/submit",method=RequestMethod.POST)
	@ResponseBody
	public String institutionsNewPOST(@RequestBody Institutions institutions){
        institutionsService.insertOne(institutions);
        return "{\"success\":true}";
    }
	
	@RequestMapping(value="institutions-list/delete",method=RequestMethod.POST)
	@ResponseBody
	public String doDelete(@RequestParam int id){
		institutionsService.deleteOne(id);
		return "{\"success\":true}";
	}
	
	@RequestMapping(value="institutions-list/deleteall",method=RequestMethod.POST)
	@ResponseBody
	public String doDeleteAll(@RequestParam (value = "ids[]",required = false,defaultValue = "") String[] ids){
		int lens = ids.length;
		for(int i=0;i<lens;i++){
			try {
			    int b = Integer.valueOf(ids[i]).intValue();
			    institutionsService.deleteOne(b);
			} catch (NumberFormatException e) {
			    e.printStackTrace();
			    return "{\"success\":false}";
			}
		}
		return "{\"success\":true}";
	}
	
	@RequestMapping(value="institutions-update",method=RequestMethod.GET)
    public ModelAndView doUpdateGET(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		
		String id = request.getParameter("id");
		mav.addObject("id",id);
		
        // 放入jsp路径
        mav.setViewName("institutions-update");
        return mav;
	}
	
	@RequestMapping(value="institutions-update/submit",method=RequestMethod.POST)
	@ResponseBody
	public Institutions doUpdatePOST(@RequestBody Institutions institutions){
		institutionsService.updateOne(institutions);
		return institutions;
	}
	
	@RequestMapping(value="institutions-list/data-source-test",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> doDataPOST(@RequestParam int draw,@RequestParam int start,@RequestParam int length){
		return institutionsService.getData(draw,start,length);
	}
	
	@RequestMapping(value="institutions-list/data-source",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> doDataTestPOST(@RequestParam int draw,@RequestParam int start,@RequestParam int length){
		return institutionsService.getDataTest(draw,start,length);
	}
	
	/*@RequestMapping(value="institutions-add",method=RequestMethod.GET)
    public ModelAndView institutionsAdd(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		
        // 放入jsp路径
        mav.setViewName("institutions-add");
        return mav;
	}
	
	@RequestMapping(value="institutions-add/submit",method=RequestMethod.GET)
	@ResponseBody
	public String doAdd(HttpServletRequest request, HttpServletResponse response){
		
		String name = requesinstitutionsService.getParameter("name");
		String gender = requesinstitutionsService.getParameter("gender");
		String birthday = requesinstitutionsService.getParameter("birthday");
		String telephone = requesinstitutionsService.getParameter("telephone");
		String email = requesinstitutionsService.getParameter("email");
		String address = requesinstitutionsService.getParameter("address");
		String nation = requesinstitutionsService.getParameter("nation");
		String education = requesinstitutionsService.getParameter("education");
		String insuredstate = requesinstitutionsService.getParameter("insuredstate");
		//institutionsService.insertOne(name,gender,birthday,telephone,email,address,nation,education,insuredstate);
		return "{\"success\":true}";
	}*/
}
