package pms.common.enums;

/**
 * 论文出版物类型枚举类
 * Created by wei on 16/12/8.
 */
public enum PaperPublishTypeEnum {
    DOMESTIC(1, "国内"),
    ABROAD(2, "国外"),
    INTERNATIONAL(3, "国际");

    public Integer getType() {
        return type;
    }

    public String getDescription() {
        return description;
    }

    private Integer type;
    private String description;

    private PaperPublishTypeEnum(Integer type, String description) {
        this.type = type;
        this.description = description;
    }
}
