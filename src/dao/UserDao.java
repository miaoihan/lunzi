package dao;


import vo.Blog;
import vo.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * time: 16-4-27.
 * author: han
 */
public class UserDao extends BaseDao {
    public List<User> getAll(){
        String sql = "select * from blog ";
        return getBySql(sql);
    }

    public List<User> getBySql(String sql){
        DBUtil db = new DBUtil();
        List<User> list = new ArrayList<>();
        ResultSet res = db.getResultSet(sql);
        try {
            while (res.next()){
                User user = new User();
                user.setId(res.getInt("id"));
                user.setUsername(res.getString("username"));
                user.setPassword(res.getString("password"));
                user.setNikname(res.getString("nikname"));
                user.setDel_status(res.getInt("del_status"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
