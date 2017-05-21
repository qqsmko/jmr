package com.jmr.model;

import java.util.Date;

public class Institutions {
    private Integer institutionsid;

    private Integer regionid;

    private String institutionsname;

    private String institutionscode;

    private String responsible;

    private String telephone;

    private String address;

    private Integer employeecount;

    private Date applydate;

    private Date approvaldate;

    private Integer state;

    private String applyemail;
    
    public Integer getInstitutionsid() {
        return institutionsid;
    }

    public void setInstitutionsid(Integer institutionsid) {
        this.institutionsid = institutionsid;
    }

    public Integer getRegionid() {
        return regionid;
    }

    public void setRegionid(Integer regionid) {
        this.regionid = regionid;
    }

    public String getInstitutionsname() {
        return institutionsname;
    }

    public void setInstitutionsname(String institutionsname) {
        this.institutionsname = institutionsname == null ? null : institutionsname.trim();
    }

    public String getInstitutionscode() {
        return institutionscode;
    }

    public void setInstitutionscode(String institutionscode) {
        this.institutionscode = institutionscode == null ? null : institutionscode.trim();
    }

    public String getResponsible() {
        return responsible;
    }

    public void setResponsible(String responsible) {
        this.responsible = responsible == null ? null : responsible.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getEmployeecount() {
        return employeecount;
    }

    public void setEmployeecount(Integer employeecount) {
        this.employeecount = employeecount;
    }

    public Date getApplydate() {
        return applydate;
    }

    public void setApplydate(Date applydate) {
        this.applydate = applydate;
    }

    public Date getApprovaldate() {
        return approvaldate;
    }

    public void setApprovaldate(Date approvaldate) {
        this.approvaldate = approvaldate;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
    
    public void setApplyemail(String applyemail){
    	this.applyemail = applyemail;
    }
    
    public String getApplyemail(){
    	return applyemail;
    }
}