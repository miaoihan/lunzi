package dao;

import vo.Blog;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * time: 16-4-29.
 * author: han
 */
public class BlogDao extends BaseDao {

    public List<Blog> getAll(){
        String sql = "select * from blog ";
        return getBySql(sql);
    }

    public List<Blog> getAll(Integer uid){
        String sql = "select * from blog where del_status = 1 and user_id =" + uid + " order by created_time desc";
        return getBySql(sql);
    }

    public List<Blog> getBySql(String sql){
        List<Blog> list = new ArrayList<>();
        ResultSet res = super.getResultSet(sql);
        try {
            while (res.next()){
                Blog blog = new Blog();
                blog.setId(res.getInt("id"));
                blog.setTitle(res.getString("title"));
                blog.setContent(res.getString("content"));
                blog.setUser_id(res.getInt("user_id"));
                blog.setDel_status(res.getInt("del_status"));
                blog.setCreated_time(res.getDate("created_time"));
                list.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Blog> findById(Integer id){
        String sql = "select * from blog where id = " + id;
        return getBySql(sql);
    }

    public void update(Blog blog) {
        String sql = String.format("update blog set title='%s',content='%s', user_id='%d',del_status='%d' " +
                                    "where id='%d'",
                                    blog.getTitle(),blog.getContent(),blog.getUser_id(),blog.getDel_status(),blog.getId());

        super.executeSQL(sql);
    }

}
