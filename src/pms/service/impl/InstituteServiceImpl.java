package pms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.InstituteMapper;
import pms.entity.Institute;
import pms.service.InstituteService;

@Service
public class InstituteServiceImpl implements InstituteService {
	
	@Autowired
	private InstituteMapper instituteMapper;
	

	@Override
	public Institute getInstitue(String institute_name) {
		// TODO Auto-generated method stub
		return instituteMapper.findInstitueByName(institute_name);
	}


	@Override
	public List<Institute> getAllInstitute() {
		// TODO Auto-generated method stub
		System.out.println("-------");
		return instituteMapper.findAllInstitute();
	}

}
