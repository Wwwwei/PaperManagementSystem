package pms.common.enums;

/**
 * 论文发表方式枚举类
 * Created by wei on 16/12/8.
 */
public enum PaperIssueEnum {
    JOURNALS(0, "期刊"),
    CONFERENCE(1, "会议");

    public Integer getType() {
        return type;
    }

    public String getDescription() {
        return description;
    }

    private Integer type;
    private String description;

    private PaperIssueEnum(Integer type, String description) {
        this.type = type;
        this.description = description;
    }
}
