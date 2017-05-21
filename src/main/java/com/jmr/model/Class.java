package com.jmr.model;

import java.util.Date;

public class Class {
    private Integer classid;

    private Integer classseriesid;

    private String classname;

    private Integer applynumber;

    private Date startdate;

    private Date enddate;

    private String remark;

    private String applyperson;

    private Integer applystate;
    
    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public Integer getClassseriesid() {
        return classseriesid;
    }

    public void setClassseriesid(Integer classseriesid) {
        this.classseriesid = classseriesid;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname == null ? null : classname.trim();
    }

    public Integer getApplynumber() {
        return applynumber;
    }

    public void setApplynumber(Integer applynumber) {
        this.applynumber = applynumber;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getApplyperson() {
        return applyperson;
    }

    public void setApplyperson(String applyperson) {
        this.applyperson = applyperson == null ? null : applyperson.trim();
    }
    
    public Integer getApplystate() {
        return applystate;
    }

    public void setApplystate(Integer applystate) {
        this.applystate = applystate;
    }
}