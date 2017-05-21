package com.jmr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//import com.jmr.model.t_ledger;
//import com.jmr.service.ILedgerService;

@Controller
@RequestMapping("")
public class LedgerController {
	@Autowired
	//ILedgerService t;
	
	@RequestMapping("ledger-list")
    public ModelAndView listStudent(){
        ModelAndView mav = new ModelAndView();
        //List<t_ledger> sl = t.list();
        
        // 放入转发参数
        //mav.addObject("sl", sl);
        // 放入jsp路径
        mav.setViewName("ledger-list");
        return mav;
    }
	
	@RequestMapping("ledger-application")
    public ModelAndView ledgerApplication(){
        ModelAndView mav = new ModelAndView();
        //List<t_ledger> sl = t.list();
        
        // 放入转发参数
        //mav.addObject("sl", sl);
        // 放入jsp路径
        mav.setViewName("ledger-application");
        return mav;
    }
}
