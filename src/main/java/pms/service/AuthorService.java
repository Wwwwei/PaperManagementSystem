package pms.service;

import java.util.List;

import pms.entity.Author;
import pms.entity.AuthorProxy;

public interface AuthorService {
	public boolean insertAuthor(AuthorProxy authorProxy);

	public boolean deleteAuthor(int paper_id);

	public List<Author> findAuthor(int paper_id);

	/**
	 * 根据论文id查找Author对象列表
	 *
	 * @param paper_id
	 * @return
	 */
	public List<Author> findAuthorListByPaperId(String paper_id);

	/**
	 * 插入Author数据
	 *
	 * @param author
	 * @return
	 */
	public Integer createAuthor(Author author);


	/**
	 * 跟新Author数据
	 *
	 * @param author
	 * @return
	 */
	public Integer updateAuthor(Author author);


}
