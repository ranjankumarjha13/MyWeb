package com.focus.dto;

/**
 * Created by admin on 07-01-2019.
 */
public class MobileDTO {
    private String mobilename;
    private String manufactureyear;
    private String mobileImei;
    private String mobilemodel;
    private String mobileDescription;
    private MobileButtonActionDto[] mobileButtonActionDtos;
    public MobileButtonActionDto[] getMobileButtonActionDtos() {
        return mobileButtonActionDtos;
    }
    public void setMobileButtonActionDtos(MobileButtonActionDto[] mobileButtonActionDtos) {
        this.mobileButtonActionDtos = mobileButtonActionDtos;
    }
    public String getMobilename() {
        return mobilename;
    }

    public void setMobilename(String mobilename) {
        this.mobilename = mobilename;
    }

    public String getManufactureyear() {
        return manufactureyear;
    }

    public void setManufactureyear(String manufactureyear) {
        this.manufactureyear = manufactureyear;
    }

    public String getMobileImei() {
        return mobileImei;
    }

    public void setMobileImei(String mobileImei) {
        this.mobileImei = mobileImei;
    }

    public String getMobilemodel() {
        return mobilemodel;
    }

    public void setMobilemodel(String mobilemodel) {
        this.mobilemodel = mobilemodel;
    }

    public String getMobileDescription() {
        return mobileDescription;
    }

    public void setMobileDescription(String mobileDescription) {
        this.mobileDescription = mobileDescription;
    }
}

