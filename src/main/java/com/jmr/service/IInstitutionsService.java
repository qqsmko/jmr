package com.jmr.service;

import java.util.List;
import java.util.Map;

import com.jmr.model.Institutions;

public interface IInstitutionsService {

	List<Institutions> list();
	Map<String,Object> getData(int draw,int start,int length);
	Map<String,Object> getDataTest(int draw,int start,int length);
	void deleteOne(int num);
	void updateOne(Institutions institutions);
	void insertOne(Institutions institutions);
	void setOnesState(int id,int num);
}
