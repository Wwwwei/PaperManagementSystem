package pms.common.enums;

/**
 * 论文期刊类型枚举类
 * Created by wei on 16/12/10.
 */
public enum PaperJournalsTypeEnum {
    ZKY(1, "中科院等级"),
    JCR(2, "JCR等级"),
    CCF(3, "CCF等级"),
    ESI(4, "ESI等级"),
    OTHER(5, "其他等级");

    public Integer getType() {
        return type;
    }

    public String getDescription() {
        return description;
    }

    private Integer type;
    private String description;

    private PaperJournalsTypeEnum(Integer type, String description) {
        this.type = type;
        this.description = description;
    }
}
