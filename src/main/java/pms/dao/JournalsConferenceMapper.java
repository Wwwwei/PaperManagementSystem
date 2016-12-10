package pms.dao;

import java.util.List;
import java.util.Map;

import pms.entity.JournalsConference;

public interface JournalsConferenceMapper {
	/**
	 * 查询所有会议或者期刊实体
	 * @return
     */
//	public List<JournalsConference> findJournals_Conference();
	public List<JournalsConference> findAll();
	/**
	 * 根据教师flag查询会议或者期刊集合
	 * 
	 * @param flag
	 * @return
	 */
	//public List<JournalsConference> findJournals_ConferenceByFlag(Object flag);
	public List<JournalsConference> findByFlag(Integer flag);
	/**
	 * 根据id查询会议或者期刊实体
	 * 
	 * @param id
	 * @return
	 */
//	public JournalsConference findById(Integer journals_conference_id);
	public JournalsConference selectById(Integer journals_conference_id);

	/**
	 * 根据id和影响因子时间查询会议或者期刊实体
	 * 
	 * @param params
	 * @return
	 */
//	public JournalsConference findByIdAndYear(Map<String, Object> params);
	public JournalsConference selectByIdAndYear(Map<String, Object> params);
}
