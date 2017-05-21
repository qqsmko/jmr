package com.jmr.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmr.IDao.TeacherMapper;
import com.jmr.model.Teacher;
import com.jmr.service.ITeacherService;

@Service
public class TeacherService implements ITeacherService {
	@Autowired
    TeacherMapper t;
	
    public List<Teacher> list(){
        return t.selectAll();
    };
    
    public void deleteOne(int num){
    	t.deleteByPrimaryKey(num);
    }
    
    public void updateOne(String teacherid,String name){
    	Teacher temp = new Teacher();
    	Integer id = Integer.parseInt(teacherid);
    	temp.setTeacherid(id);
    	if(name==""){
    		temp.setName(null);
    	}else{
    		temp.setName(name);
    	}
    	t.updateByPrimaryKeySelective(temp);
    }
    
	public void insertOne(String name){
		Teacher temp = new Teacher();
    	
    	temp.setTeacherid(null);
    	temp.setName(name);
    	t.insertSelective(temp);
	}
}
