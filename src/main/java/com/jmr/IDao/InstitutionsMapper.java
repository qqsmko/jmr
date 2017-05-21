package com.jmr.IDao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jmr.model.Institutions;

public interface InstitutionsMapper {
    int deleteByPrimaryKey(Integer institutionsid);

    int insert(Institutions record);

    int insertSelective(Institutions record);

    Institutions selectByPrimaryKey(Integer institutionsid);

    List<Institutions> selectAll();

    List<Institutions> selectByPage(@Param("start")int start,@Param("length")int length);
    
    int selectCount();
    
    int updateByPrimaryKeySelective(Institutions record);

    int updateByPrimaryKey(Institutions record);
    
    int softDelete(Integer institutionsid);
}