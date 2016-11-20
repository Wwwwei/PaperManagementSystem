package pms.entity;

/**
 * 反馈表
 * @author Administrator
 *
 */
public class Feedback {
	private int feedback_id;
	private Teacher feedback_teacher;
	private Admin feedback_admin;
	private String feedback_info;
	private int feedback_status;  //反馈状态 0为未处理  1为已处理成功 -1处理失败
	

}
