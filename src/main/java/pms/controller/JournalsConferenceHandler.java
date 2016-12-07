package pms.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pms.entity.Journals_Conference;
import pms.service.JournalsConferenceService;

@Controller
public class JournalsConferenceHandler {
	@Resource(name = "journals_ConferenceServiceImpl")
	private JournalsConferenceService journals_ConferenceService;

	@ResponseBody
	@RequestMapping(value = "/journals_conference/findByFlag", method = RequestMethod.POST)
	public List<Journals_Conference> findByFlag(@RequestParam("flag") int flag, HttpServletRequest request) {
		List<Journals_Conference>  journalsORconference= journals_ConferenceService.findJournals_ConferenceByFlag(flag);
		//System.out.println(x.get(0).getJournals_conference_id());
		return journalsORconference;
	}

}
