package com.kh.semi.customerService.commnet.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.customerService.commnet.model.dao.CategoryDao;
import com.kh.semi.customerService.commnet.model.vo.Category;

public class CategroyService {

  public List<Category> selectList() {
    Connection conn = getConnection();

    List<Category> o = new CategoryDao().selectList(conn);

    close(conn);
    return o;

  }

}
