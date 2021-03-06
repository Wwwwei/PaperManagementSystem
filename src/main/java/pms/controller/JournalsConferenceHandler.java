package pms.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pms.entity.JournalsConference;
import pms.service.JournalsConferenceService;

@Controller
public class JournalsConferenceHandler {
	@Resource(name = "journalsConferenceServiceImpl")
	private JournalsConferenceService journalsConferenceService;

	@ResponseBody
	@RequestMapping(value = "/journals_conference/findByFlag", method = RequestMethod.POST)
	public List<JournalsConference> findByFlag(@RequestParam("flag") int flag, HttpServletRequest request) {
		List<JournalsConference>  journalsORconference= journalsConferenceService.findJournals_ConferenceByFlag(flag);
		//System.out.println(x.get(0).getJournals_conference_id());
		return journalsORconference;
	}

}
