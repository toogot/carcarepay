package com.kh.semi.customerService.commnet.model.vo;

import java.util.Date;

public class CsComment {
  private Integer comNo;
  private Integer csNo;
  private Date comDate;
  private String comComment;
  private Integer userNo;

  public Integer getComNo() {
    return comNo;
  }

  public void setComNo(Integer comNo) {
    this.comNo = comNo;
  }

  public Integer getCsNo() {
    return csNo;
  }

  public void setCsNo(Integer csNo) {
    this.csNo = csNo;
  }

  public Date getComDate() {
    return comDate;
  }

  public void setComDate(Date comDate) {
    this.comDate = comDate;
  }

  public String getComComment() {
    return comComment;
  }

  public void setComComment(String comComment) {
    this.comComment = comComment;
  }

  public Integer getUserNo() {
    return userNo;
  }

  public void setUserNo(Integer userNo) {
    this.userNo = userNo;
  }
}
