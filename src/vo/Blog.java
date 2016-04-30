package vo;

/**
 * time: 16-4-29.
 * author: han
 */
public class Blog {
    private Integer id;
    private String title;
    private String content;
    private Integer user_id;
    private Integer del_status;



    public Blog(String title, String content) {
        this.title = title;
        this.content = content;
    }

    public Blog() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getDel_status() {
        return del_status;
    }

    public void setDel_status(Integer del_status) {
        this.del_status = del_status;
    }
}

