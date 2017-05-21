package com.jmr.IDao;

import com.jmr.model.Region;
import java.util.List;

public interface RegionMapper {
    int deleteByPrimaryKey(Integer regionid);

    int insert(Region record);

    int insertSelective(Region record);

    Region selectByPrimaryKey(Integer regionid);
    
    List<Region> selectAll();

    int updateByPrimaryKeySelective(Region record);

    int updateByPrimaryKey(Region record);
}