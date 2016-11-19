package pms.dao;

import pms.entity.Admin;

public interface AdminMapper {
	
	/**
	 * 修改重置教师密码
	 * @param teacher_no
	 * @return
	 */
	public int resetPassword(String teacher_no);
	
	public Admin findAdminByLogin(Admin admin);
}
