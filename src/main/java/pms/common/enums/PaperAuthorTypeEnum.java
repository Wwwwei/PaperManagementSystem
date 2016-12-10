package pms.common.enums;


/**
 * 论文作者类型枚举类
 * Created by wei on 16/12/10.
 */
public enum PaperAuthorTypeEnum {
    OUR_SCHOOL_TEACHER(1, "本校教师"),
    OTHER_SCHOOL_TEACHER(2, "外校教师"),
    POSTGRADUATE(3, "研究生"),
    UNDERGRADUATE(4, "本科生");

    public Integer getType() {
        return type;
    }

    public String getDescription() {
        return description;
    }

    private Integer type;
    private String description;

    private PaperAuthorTypeEnum(Integer type, String description) {
        this.type = type;
        this.description = description;
    }
}
