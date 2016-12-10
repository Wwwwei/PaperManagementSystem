package pms.service;

import java.util.List;

import pms.entity.JournalsConference;

public interface JournalsConferenceService {

	/**
	 * 查询所有的期刊论文等级
	 *
	 * @return
	 */
	//public List<JournalsConference> findJournals_Conference();
	public List<JournalsConference> findAllJournals_Conference();
	/**
	 * 根据教师flag查询会议或者期刊集合
	 * 
	 * @param flag
	 * @return
	 */
	public List<JournalsConference> findJournals_ConferenceByFlag(Integer flag);

	/**
	 * 根据id和影响因子时间查询期刊论文实体
	 * 
	 * @param id
	 * @param year
	 * @return
	 */
	public JournalsConference findJournals_ConferenceByIdAndYear(Integer id, Integer year);

}
