package com.kh.semi.customerService.commnet.model.dao;

//JDBCTemplate가 가지고 있는 모든걸 static으로 올린다0
import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.customerService.commnet.model.vo.Category;

public class CategoryDao {

  // 필드부 // 캡슐화 원칙
  private Properties prop = new Properties();

  public CategoryDao() {
    try {// 읽어들이고자 하는 xml파일 경로
      prop.loadFromXML(new FileInputStream(CategoryDao.class.getResource("/db/sql/category-mapper.xml").getPath()));
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public ArrayList<Category> selectList(Connection conn) {
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    ArrayList<Category> list = new ArrayList<Category>();

    String sql = prop.getProperty("selectList");

    try {
      pstmt = conn.prepareStatement(sql);

      rset = pstmt.executeQuery();

      while (rset.next()) {
        Category category = new Category();
        category.setCgNo(rset.getInt("cg_no"));
        category.setCgType(rset.getString("cg_type"));
        list.add(category);
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      close(rset);
      close(pstmt);
    }

    return list;
  }
}
