package pms.entity;

public class Teacher {
	private int teacher_id;
	private String teacher_no;
	private String teacher_name;
	private String teacher_password;
	private String teacher_salt; //随机盐
	private int teacher_sex;   //0代表女的，1代表男的
	private String teacher_email;
	private String teacher_phoneNumber;
	private String teacher_officeNumber;
	private String teacher_title;
	private String teacher_birth;
	private int teacher_age;
	private String teacher_qq;
	private String teacher_idCard; //身份证
	private String teacher_comeTime;  //来工大时间
	private String teacher_graUniversity; //毕业院校
	private String teacher_info;
	private String teacher_info_url; //个人主页
	private String teacher_google_scolar_url; //谷歌个人主页
	private String teacher_university; //所在院校
	private String teacher_subject;
	private String teacher_subject_study; //研究方向
	private Institute teacher_institute;
	private TeachingProfession teacher_teachingProfession; //教学专业
	public int getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(int teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getTeacher_no() {
		return teacher_no;
	}
	public void setTeacher_no(String teacher_no) {
		this.teacher_no = teacher_no;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getTeacher_password() {
		return teacher_password;
	}
	public void setTeacher_password(String teacher_password) {
		this.teacher_password = teacher_password;
	}
	
	public String getTeacher_salt() {
		return teacher_salt;
	}
	public void setTeacher_salt(String teacher_salt) {
		this.teacher_salt = teacher_salt;
	}
	public int getTeacher_sex() {
		return teacher_sex;
	}
	public void setTeacher_sex(int teacher_sex) {
		this.teacher_sex = teacher_sex;
	}
	public String getTeacher_email() {
		return teacher_email;
	}
	public void setTeacher_email(String teacher_email) {
		this.teacher_email = teacher_email;
	}
	public String getTeacher_phoneNumber() {
		return teacher_phoneNumber;
	}
	public void setTeacher_phoneNumber(String teacher_phoneNumber) {
		this.teacher_phoneNumber = teacher_phoneNumber;
	}
	public String getTeacher_officeNumber() {
		return teacher_officeNumber;
	}
	public void setTeacher_officeNumber(String teacher_officeNumber) {
		this.teacher_officeNumber = teacher_officeNumber;
	}
	public String getTeacher_title() {
		return teacher_title;
	}
	public void setTeacher_title(String teacher_title) {
		this.teacher_title = teacher_title;
	}
	public String getTeacher_birth() {
		return teacher_birth;
	}
	public void setTeacher_birth(String teacher_birth) {
		this.teacher_birth = teacher_birth;
	}
	public int getTeacher_age() {
		return teacher_age;
	}
	public void setTeacher_age(int teacher_age) {
		this.teacher_age = teacher_age;
	}
	public String getTeacher_qq() {
		return teacher_qq;
	}
	public void setTeacher_qq(String teacher_qq) {
		this.teacher_qq = teacher_qq;
	}
	public String getTeacher_idCard() {
		return teacher_idCard;
	}
	public void setTeacher_idCard(String teacher_idCard) {
		this.teacher_idCard = teacher_idCard;
	}
	public String getTeacher_comeTime() {
		return teacher_comeTime;
	}
	public void setTeacher_comeTime(String teacher_comeTime) {
		this.teacher_comeTime = teacher_comeTime;
	}
	public String getTeacher_graUniversity() {
		return teacher_graUniversity;
	}
	public void setTeacher_graUniversity(String teacher_graUniversity) {
		this.teacher_graUniversity = teacher_graUniversity;
	}
	public String getTeacher_info() {
		return teacher_info;
	}
	public void setTeacher_info(String teacher_info) {
		this.teacher_info = teacher_info;
	}
	public Institute getTeacher_institute() {
		return teacher_institute;
	}
	public void setTeacher_institute(Institute teacher_institute) {
		this.teacher_institute = teacher_institute;
	}
	public String getTeacher_university() {
		return teacher_university;
	}
	public void setTeacher_university(String teacher_university) {
		this.teacher_university = teacher_university;
	}
	public String getTeacher_info_url() {
		return teacher_info_url;
	}
	public void setTeacher_info_url(String teacher_info_url) {
		this.teacher_info_url = teacher_info_url;
	}
	public String getTeacher_google_scolar_url() {
		return teacher_google_scolar_url;
	}
	public void setTeacher_google_scolar_url(String teacher_google_scolar_url) {
		this.teacher_google_scolar_url = teacher_google_scolar_url;
	}
	
	public String getTeacher_subject() {
		return teacher_subject;
	}
	public void setTeacher_subject(String teacher_subject) {
		this.teacher_subject = teacher_subject;
	}
	public String getTeacher_subject_study() {
		return teacher_subject_study;
	}
	public void setTeacher_subject_study(String teacher_subject_study) {
		this.teacher_subject_study = teacher_subject_study;
	}

	public TeachingProfession getTeacher_teachingProfession() {
		return teacher_teachingProfession;
	}
	public void setTeacher_teachingProfession(TeachingProfession teacher_teachingProfession) {
		this.teacher_teachingProfession = teacher_teachingProfession;
	}
	
	
	public Teacher(String teacher_no, String teacher_name, String teacher_password, String teacher_salt,
			int teacher_sex, String teacher_email, String teacher_phoneNumber, String teacher_officeNumber,
			String teacher_title, String teacher_birth, int teacher_age, String teacher_qq, String teacher_idCard,
			String teacher_comeTime, String teacher_graUniversity, String teacher_info, String teacher_info_url,
			String teacher_google_scolar_url, String teacher_university, String teacher_subject,
			String teacher_subject_study, Institute teacher_institute, TeachingProfession teacher_teachingProfession) {
		super();
		this.teacher_no = teacher_no;
		this.teacher_name = teacher_name;
		this.teacher_password = teacher_password;
		this.teacher_salt = teacher_salt;
		this.teacher_sex = teacher_sex;
		this.teacher_email = teacher_email;
		this.teacher_phoneNumber = teacher_phoneNumber;
		this.teacher_officeNumber = teacher_officeNumber;
		this.teacher_title = teacher_title;
		this.teacher_birth = teacher_birth;
		this.teacher_age = teacher_age;
		this.teacher_qq = teacher_qq;
		this.teacher_idCard = teacher_idCard;
		this.teacher_comeTime = teacher_comeTime;
		this.teacher_graUniversity = teacher_graUniversity;
		this.teacher_info = teacher_info;
		this.teacher_info_url = teacher_info_url;
		this.teacher_google_scolar_url = teacher_google_scolar_url;
		this.teacher_university = teacher_university;
		this.teacher_subject = teacher_subject;
		this.teacher_subject_study = teacher_subject_study;
		this.teacher_institute = teacher_institute;
		this.teacher_teachingProfession = teacher_teachingProfession;
	}
	public Teacher() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	

	
}
