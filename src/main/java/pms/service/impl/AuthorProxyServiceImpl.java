package pms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.AuthorProxyMapper;
import pms.entity.AuthorProxy;
import pms.service.AuthorProxyService;

@Service
public class AuthorProxyServiceImpl implements AuthorProxyService {
	@Autowired
	private AuthorProxyMapper authorProxyMapper;

	@Override
	public Integer createAuthorProxy(AuthorProxy authorProxy) {
		// TODO Auto-generated method stub
		authorProxyMapper.insert(authorProxy);
		return authorProxy.getAuthor_id();
	}

	@Override
	public Integer updateAuthorProxy(AuthorProxy authorProxy) {
		// TODO Auto-generated method stub
		authorProxyMapper.update(authorProxy);
		return authorProxy.getAuthor_id();
	}

	@Override
	public List<AuthorProxy> findAuthorProxyListByPaperProxyId(String paperproxy_id) {
		// TODO Auto-generated method stub
		return authorProxyMapper.findByPaperProxyId(paperproxy_id);
	}

	@Override
	public AuthorProxy findAuthorProxyById(String authorProxy_id) {
		// TODO Auto-generated method stub
		return authorProxyMapper.findById(authorProxy_id);
	}

	@Override
	public Integer deleteAuthorProxy(String authorProxy_id) {
		// TODO Auto-generated method stub
		return authorProxyMapper.delete(authorProxy_id);
	}

	@Override
	public Integer deleteAuthorProxyByPaperId(String paper_id) {
		// TODO Auto-generated method stub
		return authorProxyMapper.deleteAll(paper_id);
	}

}
