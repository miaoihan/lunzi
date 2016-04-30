package vo;

/**
 * time: 16-4-27.
 * author: han
 */
public class User {
    private Integer id;
    private String nikname;
    private String username;
    private String password;
    private int del_status;

    public User() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNikname() {
        return nikname;
    }

    public void setNikname(String nikname) {
        this.nikname = nikname;
    }


    public int getDel_status() {
        return del_status;
    }

    public void setDel_status(int del_status) {
        this.del_status = del_status;
    }
}
