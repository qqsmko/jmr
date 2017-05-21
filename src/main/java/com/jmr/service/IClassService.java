package com.jmr.service;

import java.util.List;

import com.jmr.model.Class;

public interface IClassService {

	List<Class> list();
	List<Class> listApplication();
	void deleteOne(int num);
	void updateOne(String classid,String classname,String applynumber,String startdate,String enddate,String remark,String applyperson);
	void insertOne(String classname,String applynumber,String startdate,String enddate,String remark,String applyperson);
	void updateOnesState(int id, int num);
}