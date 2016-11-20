package pms.service;

import java.util.List;

import pms.entity.Journals_Conference;

public interface Journals_ConferenceService {

	/**
	 * 查询所有的期刊论文等级
	 *
	 * @return
	 */
	public List<Journals_Conference> findJournals_Conference();

	/**
	 * 根据教师flag查询会议或者期刊集合
	 * 
	 * @param flag
	 * @return
	 */
	public List<Journals_Conference> findJournals_ConferenceByFlag(Integer flag);

	/**
	 * 根据id和影响因子时间查询期刊论文实体
	 * 
	 * @param id
	 * @param year
	 * @return
	 */
	public Journals_Conference findByIdAndYear(Integer id, Integer year);

}
