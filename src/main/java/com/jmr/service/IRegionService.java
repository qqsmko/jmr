package com.jmr.service;

import java.util.List;

import com.jmr.model.Region;

public interface IRegionService {

	List<Region> list();
	void deleteOne(int num);
	void updateOne(String regionid,String regionname,String parentregion);
	void insertOne(String regionname,String parentregion);
	void insertRegion(Region r);
}
