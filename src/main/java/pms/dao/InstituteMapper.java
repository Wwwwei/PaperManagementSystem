package pms.dao;

import java.util.List;

import pms.entity.Institute;

public interface InstituteMapper {
	public Institute findInstitueByName(String institute_name);
	
	public List<Institute> findAllInstitute();

}
