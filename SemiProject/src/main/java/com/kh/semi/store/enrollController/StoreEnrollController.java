package com.kh.semi.store.enrollController;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolcy;
import com.kh.semi.store.enrollController.model.service.ApplicationService;
import com.kh.semi.store.enrollController.model.vo.AppStoreImage;
import com.kh.semi.store.enrollController.model.vo.Application;
import com.kh.semi.store.model.vo.Store;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * Servlet implementation class StoreEnrollController
 */
@WebServlet("/enroll.st")
public class StoreEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize =10* 10* 10* 10* 1024;
			String savePath = request.getSession().getServletContext().getRealPath("resources/appstore/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8",new MyFileRenamePolcy());
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			String storeName = multiRequest.getParameter("storeName");
			String storeType = multiRequest.getParameter("storeType");
			String storeAddress = multiRequest.getParameter("storeAddress");
			String storePhone = multiRequest.getParameter("storePhone");
			String storeTime = multiRequest.getParameter("storeTime");
			String businessNo = multiRequest.getParameter("businessNo");
			String storePrice = multiRequest.getParameter("storePrice");
			
			Application st = new Application(userNo,storeType,storeName,storeAddress,storePhone,storeTime,businessNo,storePrice);
			
			ArrayList<AppStoreImage> list = new ArrayList<AppStoreImage>();
			
			for(int i=0;i<100;i++) {
				String key = "storeImg"+i;
				AppStoreImage asi = new AppStoreImage();
				if(multiRequest.getOriginalFileName(key)!=null) {
					asi.setOriginName(multiRequest.getOriginalFileName(key));
					asi.setChangeName(multiRequest.getFilesystemName(key));
					asi.setImgRoot("resources/appstore/");
					
					list.add(asi);
				}
			}
			
			
			
			int result = new ApplicationService().enrollStore(st,list);
			
			if(result>0) {
				HttpSession session = request.getSession();
				response.sendRedirect(request.getContextPath());
			}else {
				System.out.println("실패");
			}
					
		}else {
			System.out.println("통신실패");
		}
		}
		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
