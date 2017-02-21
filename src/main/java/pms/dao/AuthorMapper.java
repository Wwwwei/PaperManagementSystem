package pms.dao;

import pms.entity.Author;
import pms.entity.AuthorProxy;

import java.util.List;

public interface AuthorMapper {

	public int insertAuthor(AuthorProxy authorProxy);

	public int deleteAuthorByPaperId(int paper_id);

	public List<Author> findAuthorByPaperId(int paper_id);

	public List<Author> findByPaperId(String paperp_id);
	/**
	 * 插入作者记录
	 *
	 * @param author
	 * @return
	 */
	public Integer insert(Author author);

	/**
	 * 更新作者代理记录
	 *
	 * @param author
	 * @return
	 */
	public Integer update(Author author);



}
