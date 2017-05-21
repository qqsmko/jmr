package com.jmr.service;

import java.util.List;

import com.jmr.model.Teacher;

public interface ITeacherService {

	List<Teacher> list();
	void deleteOne(int num);
	void updateOne(String teacherid,String name);
	void insertOne(String name);
}
