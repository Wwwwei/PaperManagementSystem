package pms.entity;


/**
 * 作者表
 * @author Administrator
 *
 */
public class Author {
	private int author_id;
	private String author_no; //老师即为工号,其他作者类型可为学号或者身份证号等
	private String author_name;
	private String author_office;
	private int author_rank;
	private int author_type; // 作者类型(1:本校教师 2:外校教师 3:研究生 4:本科生)
	private Paper author_paper;
	public int getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}
	public String getAuthor_no() {
		return author_no;
	}
	public void setAuthor_no(String author_no) {
		this.author_no = author_no;
	}
	public String getAuthor_name() {
		return author_name;
	}
	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}
	public String getAuthor_office() {
		return author_office;
	}
	public void setAuthor_office(String author_office) {
		this.author_office = author_office;
	}
	public int getAuthor_rank() {
		return author_rank;
	}
	public void setAuthor_rank(int author_rank) {
		this.author_rank = author_rank;
	}
	public int getAuthor_type() {
		return author_type;
	}
	public void setAuthor_type(int author_type) {
		this.author_type = author_type;
	}
	public Paper getAuthor_paper() {
		return author_paper;
	}
	public void setAuthor_paper(Paper author_paper) {
		this.author_paper = author_paper;
	}
	
	

}
