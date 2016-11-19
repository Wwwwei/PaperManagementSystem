package pms.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class DateUtil {
	private final static int startYear = 2000;

	public static List<String> getYears() {
		List<String> years = new ArrayList<String>();
		Calendar calendar = Calendar.getInstance();
		// 获得当前时间，声明时间变量
		int endYear = calendar.get(Calendar.YEAR);
		for (int i = startYear; i <= endYear; i++) {
			years.add(String.valueOf(i));
		}
		return years;

	}

	public static String get_birth(int age) {
		Calendar calendar = Calendar.getInstance();
		// 获得当前时间，声明时间变量
		int year = calendar.get(Calendar.YEAR);
		int mouth = calendar.get(Calendar.MONTH);
		int date = calendar.get(Calendar.DATE);
		String _mouth = mouth < 10 ? "0" + (mouth + 1) : "" + (mouth + 1);
		String _date = date < 10 ? "0" + date : "" + date;
		String _year = year - age + "";
		return _year + "-" + _mouth + "-" + _date;
	}

	public static String changeDateFormat(String dateStr) {
		String[] dates = dateStr.split("/");
		StringBuilder sb =new StringBuilder();
		if (dates.length != 3)
			return null;
		for(int i=0;i<dates.length;i++){
			if(!dates[i].matches("^[0-9]+$"))
				return null;
			if(i==0&&dates[i].length()!=4)
				return null;
			if(i>0&&dates[i].length()>2)
				return null;
			if(i==0) sb.append(dates[i]);
			if(i>0)
				sb.append("-"+(Integer.valueOf(dates[i])<10?"0"+dates[i]:dates[i]));
		}
		return sb.toString();
	}

}
