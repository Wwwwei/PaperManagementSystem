package pms.dao;

import pms.entity.Paper;

public interface PaperProxyMapper {
	/**
	 * 插入论文代理对象
	 * 
	 * @param paper
	 * @return
	 */
	public Integer insert(Paper paper);

	/**
	 * 更新论文代理对象
	 * 
	 * @param paper
	 * @return
	 */
	public Integer update(Paper paper);

	/**
	 * 根据Id查找论文代理对象
	 * 
	 * @param paper_id
	 * @return
	 */
	public Paper findById(Integer paper_id);

	/**
	 * 根据Id删除论文代理对象
	 * 
	 * @param paper_id
	 * @return
	 */
	public Integer delete(Integer paper_id);

	/**
	 * 根据论文名称查找论文代理对象
	 * 
	 * @param paper_name
	 * @return
	 */
	public Paper findByName(String paper_name);
}
