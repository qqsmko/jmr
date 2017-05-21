package com.jmr.IDao;

import com.jmr.model.Class;
import java.util.List;

public interface ClassMapper {
    int deleteByPrimaryKey(Integer classid);

    int insert(Class record);

    int insertSelective(Class record);

    Class selectByPrimaryKey(Integer classid);

    List<Class> selectAll();
    
    List<Class> selectApplication();
    
    int updateByPrimaryKeySelective(Class record);

    int updateByPrimaryKey(Class record);
    
    int updateState(Class record);
}