package pms.dao;

import java.util.List;

import pms.entity.Author;
import pms.entity.AuthorProxy;

public interface AuthorMapper {
	
	public int insertAuthor(AuthorProxy authorProxy);
	
	public int deleteAuthorByPaperId(int paper_id);
	
	public List<Author> findAuthorByPaperId(int paper_id);

}
