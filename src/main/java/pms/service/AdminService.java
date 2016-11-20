package pms.service;

import pms.entity.Admin;

public interface AdminService {
	
	/**
	 * 重置教师密码
	 * @param teacher_no
	 * @return
	 */
	public boolean resetPassword(String teacher_no, int teacher_id);
	
	public Admin login(Admin admin);
	

}
