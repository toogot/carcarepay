package com.kh.semi.customerService.notice.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Notice {
  private Integer notiCode;
  private String notiTitle;
  private String notiContent;
  private Date notiDate;
  private Integer notiCount;
  private Integer userNo;

  public Integer getNotiCode() {
    return notiCode;
  }

  public void setNotiCode(Integer notiCode) {
    this.notiCode = notiCode;
  }

  public String getNotiTitle() {
    return notiTitle;
  }

  public void setNotiTitle(String notiTitle) {
    this.notiTitle = notiTitle;
  }

  public String getNotiContent() {
    return notiContent;
  }

  public void setNotiContent(String notiContent) {
    this.notiContent = notiContent;
  }

  public Date getNotiDate() {
    return notiDate;
  }

  public void setNotiDate(Date notiDate) {
    this.notiDate = notiDate;
  }

  public Integer getNotiCount() {
    return notiCount;
  }

  public void setNotiCount(Integer notiCount) {
    this.notiCount = notiCount;
  }

  public Integer getUserNo() {
    return userNo;
  }

  public void setUserNo(Integer userNo) {
    this.userNo = userNo;
  }

  public String getNotiDateFormat() {
    if (notiDate == null) {
      return null;
    }
    return new SimpleDateFormat("yyyy-MM-dd").format(notiDate);
  }
}
