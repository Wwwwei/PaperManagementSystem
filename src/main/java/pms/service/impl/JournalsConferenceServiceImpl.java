package pms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.JournalsConferenceMapper;
import pms.entity.Journals_Conference;
import pms.service.JournalsConferenceService;

@Service
public class JournalsConferenceServiceImpl implements JournalsConferenceService {

	@Autowired
	private JournalsConferenceMapper journalsConferenceMapper;

	@Override
	public List<Journals_Conference> findAllJournals_Conference() {
		// TODO Auto-generated method stub
//		List<Journals_Conference> journals_Conferences = journals_ConferenceMapper.findJournals_Conference();
		List<Journals_Conference> journals_Conferences = journalsConferenceMapper.findAll();
		return journals_Conferences;
	}

	@Override
	public List<Journals_Conference> findJournals_ConferenceByFlag(Integer flag) {
		// TODO Auto-generated method stub
		if (flag != null) {
			//return journals_ConferenceMapper.findJournals_ConferenceByFlag(flag);
		return journalsConferenceMapper.findByFlag(flag);
		} else {
			return null;
		}
	}

	@Override
	public Journals_Conference findJournals_ConferenceByIdAndYear(Integer id, Integer year) {
		// TODO Auto-generated method stub
		if (null != id && null != year) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("journals_conference_id", id);
			params.put("journals_conference_year", year);
			return journalsConferenceMapper.selectByIdAndYear(params);
		} else {
			return null;
		}
	}

}
