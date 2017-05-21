package com.jmr.service.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmr.IDao.InstitutionsMapper;
import com.jmr.model.Institutions;
import com.jmr.service.IInstitutionsService;

@Service
public class InstitutionsService implements IInstitutionsService {
	@Autowired
    InstitutionsMapper t;
	
    public List<Institutions> list(){
        return t.selectAll();
    };
    
    public Map<String,Object> getDataTest(int draw,int start,int length){
    	int totalNum = t.selectCount();
    	List<Institutions> dataSet = t.selectByPage(start,length);
    	Map<String,Object> ansMap = new HashMap<String,Object>();
    	ansMap.put("draw",draw);
    	ansMap.put("recordsTotal",totalNum);
		ansMap.put("recordsFiltered",totalNum);
		ansMap.put("data",dataSet);
    	return ansMap;
    }
    
    public Map<String,Object> getData(int draw,int start,int length){
    	Map<String,Object> ansMap = new HashMap<String,Object>();
    	ansMap.put("draw",draw);
    	ansMap.put("recordsTotal",300);
		ansMap.put("recordsFiltered",300);
		List<Institutions> sl = new ArrayList<Institutions>();
		sl.add(t.selectByPrimaryKey(1));
		sl.add(t.selectByPrimaryKey(2));
		sl.add(t.selectByPrimaryKey(3));
		sl.add(t.selectByPrimaryKey(4));
		sl.add(t.selectByPrimaryKey(5));
		sl.add(t.selectByPrimaryKey(6));
		sl.add(t.selectByPrimaryKey(7));
		sl.add(t.selectByPrimaryKey(8));
		sl.add(t.selectByPrimaryKey(9));
		sl.add(t.selectByPrimaryKey(10));
		ansMap.put("data",sl);
		return ansMap;
    }
    
    public void deleteOne(int num){
    	//t.deleteByPrimaryKey(num);
    	t.softDelete(num);
    }
    
    public void updateOne(Institutions institutions){
    	t.updateByPrimaryKeySelective(institutions);
    }
    
    public void insertOne(Institutions institutions){
    	institutions.setState(2);
    	t.insertSelective(institutions);
    }
    
    public void setOnesState(int id,int num){
    	Institutions temp = t.selectByPrimaryKey(id);
    	temp.setState(num);
    	t.updateByPrimaryKeySelective(temp);
    }
}
