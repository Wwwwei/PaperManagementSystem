package pms.entity;

/**
 * 论文类
 *
 * @author Administrator
 */
public class Paper {
    private Integer paper_id;
    private String paper_name;
    private Teacher paper_teacher; // 录入教师信息
    private int paper_rank; // 录入教师在所有作者中的排名
    private int paper_authorNum;// 作者总数
    /*废弃*/
    // private Journals_Conference paper_journals_Conference;
    private String paper_includedType; // 收录类型
    private String paper_accNum;// 检索号
    private String paper_time;
    /*废弃*/
//    private String paper_location;// 论文所在会议或期刊的具体位置(包括页码，期刊号等)
    private String paper_location;// 论文具体位置(若为期刊包括期刊号,卷期,页码;若为会议包括会议页码,会议举办地;用$分隔)
    private String paper_publishName;//论文出版物名称(若为期刊,则为期刊名称;若为会议,则为会议名称)
    private Integer paper_publishType;//论文出版物类型(1:国内;2:国外;3:国际)
    //    private String paper_conference_location;// 论文所在会议或期刊的具体位置(包括,用$分隔)
    /*废弃*/
    // private String paper_url; // 论文地址
    private int paper_citations; // 总引用
    private int paper_citations_others; // 它引
    private int paper_citations_google; // google scholar 引用
    private int paper_status; // 表示论文状态
    private int paper_issue;// 发表方式（0:期刊;1:会议）
    private Journals_Conference paper_journals_conference_ZKY; // 中科院期刊会议
    private Journals_Conference paper_journals_conference_JCR; // JCR期刊会议
    private Journals_Conference paper_journals_conference_CCF; // CFF期刊会议
    private Journals_Conference paper_journals_conference_ESI; // ESI期刊会议
    private Journals_Conference paper_journals_conference_OTHER; // 其他期刊会议
    private String paper_journals_conference_CUSTOM;//自定义期刊会议
    private int paper_journals_conference_isZjut100 = 0; // 是否zjut100期刊论文(0:不是;1:是)
    private int paper_journals_conference_isOther = 1;// 是否勾选期刊会议其他(0:表示期刊会议为其他，1:表示期刊会议为存在)
    //    private String paper_location_ZKY;// 论文所在会议或期刊的具体位置(包括页码，期刊号等)对弈ZKY期刊会议
//    private String paper_location_JCR;// 论文所在会议或期刊的具体位置(包括页码，期刊号等)对应JCR期刊会议
//    private String paper_location_CCF;// 论文所在会议或期刊的具体位置(包括页码，期刊号等)对弈CFF期刊会议
    private Double paper_if;// 论文当年影响因子

    public Integer getPaper_id() {
        return paper_id;
    }

    public void setPaper_id(Integer paper_id) {
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
//
//    public int getPaper_journals_conference_other() {
//        return paper_journals_conference_other;
//    }
//
//    public void setPaper_journals_conference_other(int paper_journals_conference_other) {
//        this.paper_journals_conference_other = paper_journals_conference_other;
//    }

//    public String getPaper_location_ZKY() {
//        return paper_location_ZKY;
//    }
//
//    public void setPaper_location_ZKY(String paper_location_ZKY) {
//        this.paper_location_ZKY = paper_location_ZKY;
//    }
//
//    public String getPaper_location_JCR() {
//        return paper_location_JCR;
//    }
//
//    public void setPaper_location_JCR(String paper_location_JCR) {
//        this.paper_location_JCR = paper_location_JCR;
//    }

    public Journals_Conference getPaper_journals_conference_CCF() {
        return paper_journals_conference_CCF;
    }

    public void setPaper_journals_conference_CCF(Journals_Conference paper_journals_conference_CCF) {
        this.paper_journals_conference_CCF = paper_journals_conference_CCF;
    }

//    public String getPaper_location_CCF() {
//        return paper_location_CCF;
//    }
//
//    public void setPaper_location_CCF(String paper_location_CCF) {
//        this.paper_location_CCF = paper_location_CCF;
//    }

    public int getPaper_issue() {
        return paper_issue;
    }

    public void setPaper_issue(int paper_issue) {
        this.paper_issue = paper_issue;
    }

    public Double getPaper_if() {
        return paper_if;
    }

    public void setPaper_if(Double paper_if) {
        this.paper_if = paper_if;
    }
//    public String getPaper_journals_location() {
//        return paper_journals_location;
//    }
//
//    public void setPaper_journals_location(String paper_journals_location) {
//        this.paper_journals_location = paper_journals_location;
//    }
//
//    public String getPaper_conference_location() {
//        return paper_conference_location;
//    }
//
//    public void setPaper_conference_location(String paper_conference_location) {
//        this.paper_conference_location = paper_conference_location;
//    }

    public String getPaper_location() {
        return paper_location;
    }

    public void setPaper_location(String paper_location) {
        this.paper_location = paper_location;
    }

    public Journals_Conference getPaper_journals_conference_ESI() {
        return paper_journals_conference_ESI;
    }

    public void setPaper_journals_conference_ESI(Journals_Conference paper_journals_conference_ESI) {
        this.paper_journals_conference_ESI = paper_journals_conference_ESI;
    }

    public Journals_Conference getPaper_journals_conference_OTHER() {
        return paper_journals_conference_OTHER;
    }

    public void setPaper_journals_conference_OTHER(Journals_Conference paper_journals_conference_OTHER) {
        this.paper_journals_conference_OTHER = paper_journals_conference_OTHER;
    }

    public String getPaper_journals_conference_CUSTOM() {
        return paper_journals_conference_CUSTOM;
    }

    public void setPaper_journals_conference_CUSTOM(String paper_journals_conference_CUSTOM) {
        this.paper_journals_conference_CUSTOM = paper_journals_conference_CUSTOM;
    }

//    public int getPaper_journals_conference_zjut100() {
//        return paper_journals_conference_zjut100;
//    }
//
//    public void setPaper_journals_conference_zjut100(int paper_journals_conference_zjut100) {
//        this.paper_journals_conference_zjut100 = paper_journals_conference_zjut100;
//    }

    public int getPaper_journals_conference_isZjut100() {
        return paper_journals_conference_isZjut100;
    }

    public void setPaper_journals_conference_isZjut100(int paper_journals_conference_isZjut100) {
        this.paper_journals_conference_isZjut100 = paper_journals_conference_isZjut100;
    }

    public int getPaper_journals_conference_isOther() {
        return paper_journals_conference_isOther;
    }

    public void setPaper_journals_conference_isOther(int paper_journals_conference_isOther) {
        this.paper_journals_conference_isOther = paper_journals_conference_isOther;
    }

    public String getPaper_publishName() {
        return paper_publishName;
    }

    public void setPaper_publishName(String paper_publishName) {
        this.paper_publishName = paper_publishName;
    }

    public Integer getPaper_publishType() {
        return paper_publishType;
    }

    public void setPaper_publishType(Integer paper_publishType) {
        this.paper_publishType = paper_publishType;
    }
}
