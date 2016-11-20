package pms.dao;

import java.util.List;

import pms.entity.AuthorProxy;

public interface AuthorProxyMapper {
	/**
	 * 插入作者代理记录
	 * 
	 * @param authorProxy
	 * @return
	 */
	public Integer insert(AuthorProxy authorProxy);

	/**
	 * 更新作者代理记录
	 * 
	 * @param authorProxy
	 * @return
	 */
	public Integer update(AuthorProxy authorProxy);

	/**
	 * 根据论文代理表查找相关作者代理对象
	 * 
	 * @param paperproxy_id
	 * @return
	 */
	public List<AuthorProxy> findByPaperProxyId(String paperproxy_id);

	/**
	 * 根据id查找作者代理对象
	 * 
	 * @param authorProxy_id
	 * @return
	 */
	public AuthorProxy findById(String authorProxy_id);

	/**
	 * 根据id删除作者代理对象
	 * 
	 * @param authorProxy_id
	 * @return
	 */
	public Integer delete(String authorProxy_id);
	/**
	 * 根据paper_id删除作者代理对象
	 * @param paper_id
	 * @return
	 */
	public Integer deleteAll(String paper_id);
}
