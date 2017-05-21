package com.jmr.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmr.IDao.ClassMapper;
import com.jmr.model.Class;
import com.jmr.model.Class;
import com.jmr.service.IClassService;

@Service
public class ClassService implements IClassService {
	@Autowired
    ClassMapper t;
	
    public List<Class> list(){
        return t.selectAll();
    };
    
    public List<Class> listApplication(){
        return t.selectApplication();
    };
    
    public void deleteOne(int num){
    	t.deleteByPrimaryKey(num);
    }
    
    public void updateOne(String classid,String classname,String applynumber,String startdate,String enddate,String remark,String applyperson){
    	
    	Class temp = new Class();
    	Integer id = Integer.parseInt(classid);
    	temp.setClassid(id);
    	if(classname==""){
    		temp.setClassname(null);
    	}else{
    		temp.setClassname(classname);
    	}
    	if(applynumber==""){
    		temp.setApplynumber(null);
    	}else{
    		Integer applynumberb = Integer.parseInt(applynumber);
    		temp.setApplynumber(applynumberb);
    	}
    		try{
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    		Date startdateb = sdf.parse(startdate);
	    		temp.setStartdate(startdateb);
	    	}catch(ParseException e){
	    		temp.setStartdate(null);
	    		System.out.println(e.getMessage());
	    	}
    		try{
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    		Date enddateb = sdf.parse(enddate);
	    		temp.setEnddate(enddateb);
	    	}catch(ParseException e){
	    		temp.setEnddate(null);
	    		System.out.println(e.getMessage());
	    	}
    	if(remark==""){
    		temp.setRemark(null);
    	}else{
    		temp.setRemark(remark);
    	}
    	if(applyperson==""){
    		temp.setApplyperson(null);
    	}else{
    		temp.setApplyperson(applyperson);
    	}
    	t.updateByPrimaryKeySelective(temp);
    }
    
    public void insertOne(String classname,String applynumber,String startdate,String enddate,String remark,String applyperson){
    	
    	Class temp = new Class();
    	
    	temp.setClassid(null);
    	temp.setClassname(classname);
    	Integer applynumberb = Integer.parseInt(applynumber);
    	temp.setApplynumber(applynumberb);
    	try{
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    		Date startdateb = sdf.parse(startdate);
	    		temp.setStartdate(startdateb);
	    	}catch(ParseException e){
	    		temp.setStartdate(null);
	    		System.out.println(e.getMessage());
	    	}
    		try{
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    		Date enddateb = sdf.parse(enddate);
	    		temp.setEnddate(enddateb);
	    	}catch(ParseException e){
	    		temp.setEnddate(null);
	    		System.out.println(e.getMessage());
	    	}
    		temp.setRemark(remark);
    		temp.setApplyperson(applyperson);
    	t.insertSelective(temp);
    }
    
    public void updateOnesState(int id, int num){
    	Class temp = new Class();
    	temp.setClassid(id);
    	temp.setApplystate(num);
    	t.updateState(temp);
    }
}
