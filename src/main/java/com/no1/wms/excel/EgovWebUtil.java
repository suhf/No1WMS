package com.no1.wms.excel;

//../을 통해 부모디렉토리로 이동하는 방법을 막기 위한 보안
public class EgovWebUtil {
	public static String filePathBlackList(String value) {
	    String returnValue = value;
	    if (returnValue == null || returnValue.trim().equals("")) {
	        return "";
	    }
	 
	    returnValue = returnValue.replaceAll("\\.\\./", ""); 
	    returnValue = returnValue.replaceAll("\\.\\.\\\\", "");
	 
	    return returnValue;
	}
	
}
