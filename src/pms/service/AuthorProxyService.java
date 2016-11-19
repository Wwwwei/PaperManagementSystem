package pms.service;

import java.util.List;

import pms.entity.AuthorProxy;

public interface AuthorProxyService {
	/**
	 * 插入AuthorProxy数据
	 * 
	 * @param authorProxy
	 * @return
	 */
	public Integer createAuthorProxy(AuthorProxy authorProxy);

	/**
	 * 跟新AuthorProxy数据
	 * 
	 * @param authorProxy
	 * @return
	 */
	public Integer updateAuthorProxy(AuthorProxy authorProxy);

	/**
	 * 根据论文id查找AuthorProxy对象列表
	 * 
	 * @param paperproxy_id
	 * @return
	 */
	public List<AuthorProxy> findAuthorProxyListByPaperProxyId(String paperproxy_id);

	/**
	 * 根据id查找AuthorProxy对象
	 * 
	 * @param authorProxy_id
	 * @return
	 */
	public AuthorProxy findAuthorProxyById(String authorProxy_id);

	/**
	 * 根据id删除AuthorProxy对象
	 * 
	 * @param authorProxy_id
	 * @return
	 */
	public Integer deleteAuthorProxy(String authorProxy_id);

	/**
	 * 根据paper_id删除AuthorProxy对象
	 * 
	 * @param paper_id
	 * @return
	 */
	public Integer deleteAuthorProxyByPaperId(String paper_id);
}
