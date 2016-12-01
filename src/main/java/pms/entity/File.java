package pms.entity;

public class File {
    private int file_id;// 文件id
    private int file_type; // 文件类型 1:作者信息页;2:论文全页;3:论文/期刊封面;4:论文/期刊封底;5:论文检索证明(国内类型1、2、3、4，国外类型2、5)
    private String file_url;// 文件路径
    private int file_isValid;//文件是否有效(预留字段)
    private int file_paperproxy_id;//论文代理id
    private int file_paper_id;// 论文id

    public int getFile_id() {
        return file_id;
    }

    public void setFile_id(int file_id) {
        this.file_id = file_id;
    }

    public int getFile_type() {
        return file_type;
    }

    public void setFile_type(int file_type) {
        this.file_type = file_type;
    }

    public String getFile_url() {
        return file_url;
    }

    public void setFile_url(String file_url) {
        this.file_url = file_url;
    }

    public int getFile_isValid() {
        return file_isValid;
    }

    public void setFile_isValid(int file_isValid) {
        this.file_isValid = file_isValid;
    }

    public int getFile_paperproxy_id() {
        return file_paperproxy_id;
    }

    public void setFile_paperproxy_id(int file_paperproxy_id) {
        this.file_paperproxy_id = file_paperproxy_id;
    }

    public int getFile_paper_id() {
        return file_paper_id;
    }

    public void setFile_paper_id(int file_paper_id) {
        this.file_paper_id = file_paper_id;
    }
}
