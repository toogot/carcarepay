package com.kh.semi.customerService.commnet.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Cs {
  private Integer csNo;
  private Integer userNo;
  private String csTitle;
  private String csDetail;
  private Date csDate;
  private String csSecret;
  private String csPwd;
  private Integer cgNo;
  private String comComment;
  private String cgType;
  private Date comDate;
  private Integer attNo;

  public Date getComDate() {
    return comDate;
  }

  public void setComDate(Date comDate) {
    this.comDate = comDate;
  }

  public Integer getCsNo() {
    return csNo;
  }

  public void setCsNo(Integer csNo) {
    this.csNo = csNo;
  }

  public Integer getUserNo() {
    return userNo;
  }

  public void setUserNo(Integer userNo) {
    this.userNo = userNo;
  }

  public String getCsTitle() {
    return csTitle;
  }

  public void setCsTitle(String csTitle) {
    this.csTitle = csTitle;
  }

  public String getCsDetail() {
    return csDetail;
  }

  public void setCsDetail(String csDetail) {
    this.csDetail = csDetail;
  }

  public Date getCsDate() {
    return csDate;
  }

  public void setCsDate(Date csDate) {
    this.csDate = csDate;
  }

  public String getCsSecret() {
    return csSecret;
  }

  public void setCsSecret(String csSecret) {
    this.csSecret = csSecret;
  }

  public String getCsPwd() {
    return csPwd;
  }

  public void setCsPwd(String csPwd) {
    this.csPwd = csPwd;
  }

  public Integer getCgNo() {
    return cgNo;
  }

  public void setCgNo(Integer cgNo) {
    this.cgNo = cgNo;
  }

  public String getComComment() {
    return comComment;
  }

  public void setComComment(String comComment) {
    this.comComment = comComment;
  }

  public String getCgType() {
    return cgType;
  }

  public void setCgType(String cgType) {
    this.cgType = cgType;
  }

  public String getCsDateFormat() {
    if (csDate == null) {
      return "";
    }
    return new SimpleDateFormat("yyyy-MM-dd").format(csDate);
  }

  public String getComDateFormat() {
    if (comDate == null) {
      return "";
    }
    return new SimpleDateFormat("yyyy-MM-dd").format(comDate);
  }

  public Integer getAttNo() {
    return attNo;
  }

  public void setAttNo(Integer attNo) {
    this.attNo = attNo;
  }
}
