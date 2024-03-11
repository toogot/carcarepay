package com.kh.semi.customerService.FAQ.model.vo;

public class Faq {
<<<<<<< HEAD
	
	private int faqNo;
	private String faqTitle;
	private String faqDetail;
	
	public Faq() {}

	public Faq(int faqNo, String faqTitle, String faqDetail) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqDetail = faqDetail;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
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

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqDetail=" + faqDetail + "]";
	}

=======
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
>>>>>>> sh
}
