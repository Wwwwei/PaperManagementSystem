package pms.entity;

public class Journals_Conference {
	private int journals_conference_id;
	private String journals_conference_name;
	private String journals_conference_degree;// 刊物或论文等级
	private String journals_conference_info; // 刊物或论文简介
	private int journals_conference_flag; // 0代表期刊，1代表会议
	private double journals_conference_IF;// Impact Factor影响因子
	private int journals_conference_type;// 期刊或论文类型
											// (若journals_conference_flag=0,0:其他,1:中科院,2:JCR,3:CCF;journals_conference_flag=1,2:其他,1:CCF)
	private String journals_conference_year;//影响因子年份 
	public int getJournals_conference_id() {
		return journals_conference_id;
	}

	public void setJournals_conference_id(int journals_conference_id) {
		this.journals_conference_id = journals_conference_id;
	}

	public String getJournals_conference_name() {
		return journals_conference_name;
	}

	public void setJournals_conference_name(String journals_conference_name) {
		this.journals_conference_name = journals_conference_name;
	}

	public String getJournals_conference_degree() {
		return journals_conference_degree;
	}

	public void setJournals_conference_degree(String journals_conference_degree) {
		this.journals_conference_degree = journals_conference_degree;
	}

	public String getJournals_conference_info() {
		return journals_conference_info;
	}

	public void setJournals_conference_info(String journals_conference_info) {
		this.journals_conference_info = journals_conference_info;
	}

	public int getJournals_conference_flag() {
		return journals_conference_flag;
	}

	public void setJournals_conference_flag(int journals_conference_flag) {
		this.journals_conference_flag = journals_conference_flag;
	}

	public double getJournals_conference_IF() {
		return journals_conference_IF;
	}

	public void setJournals_conference_IF(double journals_conference_IF) {
		this.journals_conference_IF = journals_conference_IF;
	}

	public int getJournals_conference_type() {
		return journals_conference_type;
	}

	public void setJournals_conference_type(int journals_conference_type) {
		this.journals_conference_type = journals_conference_type;
	}

	public String getJournals_conference_year() {
		return journals_conference_year;
	}

	public void setJournals_conference_year(String journals_conference_year) {
		this.journals_conference_year = journals_conference_year;
	}

}
