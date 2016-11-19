package pms.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.AuthorMapper;
import pms.entity.Author;
import pms.entity.AuthorProxy;
import pms.service.AuthorService;

@Service
public class AuthorServiceImpl implements AuthorService {

	@Autowired
	private AuthorMapper authorMapper;
	
	@Override
	public boolean insertAuthor(AuthorProxy authorProxy) {
		// TODO Auto-generated method stub
		if(authorMapper.insertAuthor(authorProxy)!=0)
			return true;
		return false;
	}
	
	public boolean deleteAuthor(int paper_id) {
		try{
			authorMapper.deleteAuthorByPaperId(paper_id);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally {
		}
//		if(authorMapper.deleteAuthorByPaperId(paper_id)!=0)
//			return true;
//		return false;
	}

	@Override
	public List<Author> findAuthor(int paper_id) {
		return authorMapper.findAuthorByPaperId(paper_id);
	}
	

}
