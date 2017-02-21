package pms.service;

import java.util.List;

import pms.entity.Institute;
import pms.entity.TeachingProfession;

public interface InstituteService {

	public Institute getInstitue(String institute_name);

	public List<Institute> getAllInstitute();


}
