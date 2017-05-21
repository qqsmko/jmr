package com.jmr.service;

import java.util.List;

import com.jmr.model.Student;

public interface IStudentService {

	List<Student> list();
	Student getOne(int num);
	void setOnesState(int num);
	void deleteOne(int num);
	void updateOne(String studentid,String name,String gender,String birthday,String telephone,String email,String address,String nation,String education,String insuredstate);
	void insertOne(String name,String gender,String birthday,String telephone,String email,String address,String nation,String education,String insuredstate);

}
