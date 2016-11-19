package pms.service;

import java.util.List;

import pms.entity.Author;
import pms.entity.AuthorProxy;

public interface AuthorService {
	public boolean insertAuthor(AuthorProxy authorProxy);
	
	public boolean deleteAuthor(int paper_id);
	
	public List<Author> findAuthor(int paper_id);

}
