package com.kh.semi.customerService.FAQ.model.vo;

public class Faq {
  private Integer faqNo;
  private String faqTitle;
  private String faqDetail;
  private Integer faqCount;
  private String faqCate;

  public Integer getFaqNo() {
    return faqNo;
  }

  public void setFaqNo(Integer faqNo) {
    this.faqNo = faqNo;
  }

  public String getFaqTitle() {
    return faqTitle;
  }

  public void setFaqTitle(String faqTitle) {
    this.faqTitle = faqTitle;
  }

  public String getFaqDetail() {
    return faqDetail;
  }

  public void setFaqDetail(String faqDetail) {
    this.faqDetail = faqDetail;
  }

  public Integer getFaqCount() {
    return faqCount;
  }

  public void setFaqCount(Integer faqCount) {
    this.faqCount = faqCount;
  }

  public String getFaqCate() {
    return faqCate;
  }

  public void setFaqCate(String faqCate) {
    this.faqCate = faqCate;
  }
}
