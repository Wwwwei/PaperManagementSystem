package pms.entity;

/**
 * 论文类
 * 
 * @author Administrator
 *
 */
public class Paper {
	private int paper_id;
	private String paper_name;
	private Teacher paper_teacher; // 录入教师信息
	private int paper_rank; // 录入教师在所有作者中的排名
	private int paper_authorNum;// 作者总数
	/** 废弃 **/
	// private Journals_Conference paper_journals_Conference;
	private String paper_includedType; // 收录类型
	private String paper_accNum;// 检索号
	private String paper_time;
	/** 废弃 **/
	// private String paper_location;// 论文所在会议或期刊的具体位置(包括页码，期刊号等)
	/** 废弃 **/
	// private String paper_url; // 论文地址
	private int paper_citations; // 总引用
	private int paper_citations_others; // 它引
	private int paper_citations_google; // google scholar 引用
	private int paper_status; // 表示论文状态
	private int paper_issue;// 发表方式（0:期刊;1:会议）
	private Journals_Conference paper_journals_conference_ZKY; // 中科院期刊会议
	private Journals_Conference paper_journals_conference_JCR; // JCR期刊会议
	private Journals_Conference paper_journals_conference_CCF; // CFF期刊会议
	private int paper_journals_conference_other = 1;// 期刊会议其他(0:表示期刊会议为其他，1:表示期刊会议为存在)
	private String paper_location_ZKY;// 论文所在会议或期刊的具体位置(包括页码，期刊号等)对弈ZKY期刊会议
	private String paper_location_JCR;// 论文所在会议或期刊的具体位置(包括页码，期刊号等)对应JCR期刊会议
	private String paper_location_CCF;// 论文所在会议或期刊的具体位置(包括页码，期刊号等)对弈CFF期刊会议
	private double paper_if;// 论文当年影响因子

	public int getPaper_id() {
		return paper_id;
	}

	public void setPaper_id(int paper_id) {
		this.paper_id = paper_id;
	}

	public String getPaper_name() {
		return paper_name;
	}

	public void setPaper_name(String paper_name) {
		this.paper_name = paper_name;
	}

	public Teacher getPaper_teacher() {
		return paper_teacher;
	}

	public void setPaper_teacher(Teacher paper_teacher) {
		this.paper_teacher = paper_teacher;
	}

	public int getPaper_rank() {
		return paper_rank;
	}

	public void setPaper_rank(int paper_rank) {
		this.paper_rank = paper_rank;
	}

	public int getPaper_authorNum() {
		return paper_authorNum;
	}

	public void setPaper_authorNum(int paper_authorNum) {
		this.paper_authorNum = paper_authorNum;
	}

	public String getPaper_includedType() {
		return paper_includedType;
	}

	public void setPaper_includedType(String paper_includedType) {
		this.paper_includedType = paper_includedType;
	}

	public String getPaper_accNum() {
		return paper_accNum;
	}

	public void setPaper_accNum(String paper_accNum) {
		this.paper_accNum = paper_accNum;
	}

	public String getPaper_time() {
		return paper_time;
	}

	public void setPaper_time(String paper_time) {
		this.paper_time = paper_time;
	}

	public int getPaper_citations() {
		return paper_citations;
	}

	public void setPaper_citations(int paper_citations) {
		this.paper_citations = paper_citations;
	}

	public int getPaper_citations_others() {
		return paper_citations_others;
	}

	public void setPaper_citations_others(int paper_citations_others) {
		this.paper_citations_others = paper_citations_others;
	}

	public int getPaper_citations_google() {
		return paper_citations_google;
	}

	public void setPaper_citations_google(int paper_citations_google) {
		this.paper_citations_google = paper_citations_google;
	}

	public int getPaper_status() {
		return paper_status;
	}

	public void setPaper_status(int paper_status) {
		this.paper_status = paper_status;
	}

	public Journals_Conference getPaper_journals_conference_ZKY() {
		return paper_journals_conference_ZKY;
	}

	public void setPaper_journals_conference_ZKY(Journals_Conference paper_journals_conference_ZKY) {
		this.paper_journals_conference_ZKY = paper_journals_conference_ZKY;
	}

	public Journals_Conference getPaper_journals_conference_JCR() {
		return paper_journals_conference_JCR;
	}

	public void setPaper_journals_conference_JCR(Journals_Conference paper_journals_conference_JCR) {
		this.paper_journals_conference_JCR = paper_journals_conference_JCR;
	}

	public int getPaper_journals_conference_other() {
		return paper_journals_conference_other;
	}

	public void setPaper_journals_conference_other(int paper_journals_conference_other) {
		this.paper_journals_conference_other = paper_journals_conference_other;
	}

	public String getPaper_location_ZKY() {
		return paper_location_ZKY;
	}

	public void setPaper_location_ZKY(String paper_location_ZKY) {
		this.paper_location_ZKY = paper_location_ZKY;
	}

	public String getPaper_location_JCR() {
		return paper_location_JCR;
	}

	public void setPaper_location_JCR(String paper_location_JCR) {
		this.paper_location_JCR = paper_location_JCR;
	}

	public Journals_Conference getPaper_journals_conference_CCF() {
		return paper_journals_conference_CCF;
	}

	public void setPaper_journals_conference_CCF(Journals_Conference paper_journals_conference_CCF) {
		this.paper_journals_conference_CCF = paper_journals_conference_CCF;
	}

	public String getPaper_location_CCF() {
		return paper_location_CCF;
	}

	public void setPaper_location_CCF(String paper_location_CCF) {
		this.paper_location_CCF = paper_location_CCF;
	}

	public int getPaper_issue() {
		return paper_issue;
	}

	public void setPaper_issue(int paper_issue) {
		this.paper_issue = paper_issue;
	}

	public double getPaper_if() {
		return paper_if;
	}

	public void setPaper_if(double paper_if) {
		this.paper_if = paper_if;
	}

}
