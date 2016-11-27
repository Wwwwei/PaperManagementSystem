package pms.util.enums;

/**
 * 论文文件类型枚举类
 * Created by wei on 16/11/27.
 */
public enum PaperFileTypeEnum {
    AUTHOR(1, "作者信息页"),
    TEXT(2, "论文全文"),
    COVER(3, "论文/期刊封面"),
    BACK(4, "论文/期刊封底"),
    RETRIEVAL(5, "论文检索证明");

    public Integer getType() {
        return type;
    }

    public String getDescription() {
        return description;
    }

    private Integer type;
    private String description;

    private PaperFileTypeEnum(Integer type, String description) {
        this.type = type;
        this.description = description;
    }
}
