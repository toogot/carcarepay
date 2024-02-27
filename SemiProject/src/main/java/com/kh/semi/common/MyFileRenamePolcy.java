package com.kh.semi.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolcy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) {
		
		String originName = originFile.getName();
		
		String currentTime = new SimpleDateFormat("YYYYMMDDHHmmss").format(new Date());
		
		int random = (int)(Math.random()*10000+1000);
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime+random+ext;
		
		
		return new File(originFile.getParent(),changeName);
	}
	
}
