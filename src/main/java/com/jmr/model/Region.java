package com.jmr.model;

public class Region {
    private Integer regionid;

    private String regionname;

    private Integer parentregion;

    public Integer getRegionid() {
        return regionid;
    }

    public void setRegionid(Integer regionid) {
        this.regionid = regionid;
    }

    public String getRegionname() {
        return regionname;
    }

    public void setRegionname(String regionname) {
        this.regionname = regionname == null ? null : regionname.trim();
    }

    public Integer getParentregion() {
        return parentregion;
    }

    public void setParentregion(Integer parentregion) {
        this.parentregion = parentregion;
    }
}