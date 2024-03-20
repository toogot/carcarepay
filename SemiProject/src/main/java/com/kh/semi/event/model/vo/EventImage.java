package com.kh.semi.event.model.vo;

public class EventImage {
  private Integer imgNo;
  private String imgRoot;
  private String originName;
  private String changeName;
  private Integer imgLevel;
  private String status;
  private Integer evNo;

  public Integer getImgNo() {
    return imgNo;
  }

  public void setImgNo(Integer imgNo) {
    this.imgNo = imgNo;
  }

  public String getImgRoot() {
    return imgRoot;
  }

  public void setImgRoot(String imgRoot) {
    this.imgRoot = imgRoot;
  }

  public String getOriginName() {
    return originName;
  }

  public void setOriginName(String originName) {
    this.originName = originName;
  }

  public String getChangeName() {
    return changeName;
  }

  public void setChangeName(String changeName) {
    this.changeName = changeName;
  }

  public Integer getImgLevel() {
    return imgLevel;
  }

  public void setImgLevel(Integer imgLevel) {
    this.imgLevel = imgLevel;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public Integer getEvNo() {
    return evNo;
  }

  public void setEvNo(Integer evNo) {
    this.evNo = evNo;
  }
}
