package pms.dao;

import java.util.List;

import pms.entity.TeachingProfession;

public interface TeachingProfessionMapper {

	public TeachingProfession findTeachingProfessionByName(String teachingProfession_name);

	public List<TeachingProfession> getAllTeachingProfession();

}
