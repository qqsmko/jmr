package com.jmr.IDao;

import com.jmr.model.Attendance;
import java.util.List;

public interface AttendanceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Attendance record);

    int insertSelective(Attendance record);

    Attendance selectByPrimaryKey(Integer id);

    List<Attendance> selectAll();
    
    int updateByPrimaryKeySelective(Attendance record);

    int updateByPrimaryKey(Attendance record);
}