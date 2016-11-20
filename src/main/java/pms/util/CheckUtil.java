package pms.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class CheckUtil {
	/**
	 * 判断一个字符串是否为数字串
	 * @param str
	 * @return
	 */
	public static boolean isNumeric(String str){ 
		   Pattern pattern = Pattern.compile("[0-9]*"); 
		   Matcher isNum = pattern.matcher(str);
		   if( !isNum.matches() ){
		       return false; 
		   } 
		   return true; 
		}


}
