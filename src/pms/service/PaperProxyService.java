package pms.service;

import pms.entity.Paper;

public interface PaperProxyService {

	/**
	 * 插入PaperProxy对象
	 * 
	 * @param paper
	 * @return 主键
	 */
	public Integer createPaperProxy(Paper paper);

	/**
	 * 更新PaperProxy对象
	 * 
	 * @param paper
	 * @return
	 */
	public Integer updatePaperProxy(Paper paper);

	/**
	 * 根据Id查找PaperProxy对象
	 * 
	 * @param paper_id
	 * @return
	 */
	public Paper findPaperProxyById(Integer paperproxy_id);

	/**
	 * 根据Id删除PaperProxy对象
	 * 
	 * @param paperproxy_id
	 * @return
	 */
	public Integer deletePaperProxy(Integer paperproxy_id);

	/**
	 * 查找PaperProxy对象是否重名
	 * 
	 * @param paperproxy_name
	 * @return
	 */
	public boolean findPaperProxyByName(String paperproxy_name);
}
