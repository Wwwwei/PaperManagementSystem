package pms.dao;

import java.util.List;
import java.util.Map;

import pms.entity.Journals_Conference;

public interface JournalsConferenceMapper {
	/**
	 * 查询所有会议或者期刊实体
	 * @return
     */
//	public List<Journals_Conference> findJournals_Conference();
	public List<Journals_Conference> findAll();
	/**
	 * 根据教师flag查询会议或者期刊集合
	 * 
	 * @param flag
	 * @return
	 */
	//public List<Journals_Conference> findJournals_ConferenceByFlag(Object flag);
	public List<Journals_Conference> findByFlag(Integer flag);
	/**
	 * 根据id查询会议或者期刊实体
	 * 
	 * @param id
	 * @return
	 */
//	public Journals_Conference findById(Integer journals_conference_id);
	public Journals_Conference selectById(Integer journals_conference_id);

	/**
	 * 根据id和影响因子时间查询会议或者期刊实体
	 * 
	 * @param params
	 * @return
	 */
//	public Journals_Conference findByIdAndYear(Map<String, Object> params);
	public Journals_Conference selectByIdAndYear(Map<String, Object> params);
}
