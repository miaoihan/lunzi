package action;

import dao.BlogDao;
import vo.Blog;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * time: 16-4-30.
 * author: han
 */
public class DelBlog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BlogDao blogDao = new BlogDao();
        List<Blog> blog = blogDao.findById(Integer.parseInt(req.getParameter("id")));
//        blog.get(0).setDel_status(0);
        String sql = "update blog set del_status = 0 where id = " + blog.get(0).getId();
        blogDao.executeSQL(sql);
        resp.sendRedirect("showBlogs");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
