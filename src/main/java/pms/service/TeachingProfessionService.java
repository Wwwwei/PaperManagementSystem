package pms.service;

import java.util.List;

import pms.entity.TeachingProfession;

public interface TeachingProfessionService {
	public TeachingProfession getTeachingProfession(String teachingProfession_name);

	public List<TeachingProfession> getAllTeachingProfession();

}
