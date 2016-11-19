package pms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.TeachingProfessionMapper;
import pms.entity.TeachingProfession;
import pms.service.TeachingProfessionService;

@Service
public class TeachingProfessionServiceImpl implements TeachingProfessionService {

	@Autowired
	private TeachingProfessionMapper teachingProfessionMapper;
	
	@Override
	public TeachingProfession getTeachingProfession(String teachingProfession_name) {
		return teachingProfessionMapper.findTeachingProfessionByName(teachingProfession_name);
	}

	

}
