package com.jmr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmr.IDao.AttendanceMapper;
import com.jmr.model.Attendance;
import com.jmr.service.IAttendanceService;

@Service
public class AttendanceService implements IAttendanceService {
	@Autowired
    AttendanceMapper t;
	
    public List<Attendance> list(){
        return t.selectAll();
    };
}
