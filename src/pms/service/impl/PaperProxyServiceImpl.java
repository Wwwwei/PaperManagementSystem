package pms.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.PaperProxyMapper;
import pms.entity.Paper;
import pms.service.AuthorProxyService;
import pms.service.PaperProxyService;

@Service
public class PaperProxyServiceImpl implements PaperProxyService {

	@Autowired
	private PaperProxyMapper paperProxyMapper;
	@Resource(name = "authorProxyServiceImpl")
	private AuthorProxyService authorProxyService;

	@Override
	public Integer createPaperProxy(Paper paper) {
		// TODO Auto-generated method stub
		paperProxyMapper.insert(paper);
		return paper.getPaper_id();
	}

	@Override
	public Integer updatePaperProxy(Paper paper) {
		// TODO Auto-generated method stub
		paperProxyMapper.update(paper);
		return paper.getPaper_id();
	}

	@Override
	public Paper findPaperProxyById(Integer paperproxy_id) {
		// TODO Auto-generated method stub
		return paperProxyMapper.findById(paperproxy_id);

	}

	@Override
	public Integer deletePaperProxy(Integer paperproxy_id) {
		// TODO Auto-generated method stub
		authorProxyService.deleteAuthorProxyByPaperId(String.valueOf(paperproxy_id));
		return paperProxyMapper.delete(paperproxy_id);
	}

	@Override
	public boolean findPaperProxyByName(String paperproxy_name) {
		// TODO Auto-generated method stub
		if (paperProxyMapper.findByName(paperproxy_name) != null) {
			return true;
		}
		return false;
	}

}
