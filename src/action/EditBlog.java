package action;

import dao.BlogDao;
import vo.Blog;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 老子从来不写注释
 * time: 16-4-30.
 * author: han
 */
public class EditBlog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BlogDao blogDao = new BlogDao();
        List<Blog> blogs = blogDao.findById(Integer.parseInt(req.getParameter("id")));
        Blog blog = blogs.get(0);
        req.setAttribute("blog",blog);

        RequestDispatcher dispatcher=
                req.getRequestDispatcher("editBlog.jsp");//转发添加正确页面
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        BlogDao blogDao = new BlogDao();
        Blog blog = new Blog();
        blog.setId(Integer.valueOf(req.getParameter("id")));
        blog.setTitle(req.getParameter("title"));
        blog.setContent(req.getParameter("content"));
        blog.setUser_id(Integer.valueOf(req.getParameter("user_id")));
        blog.setDel_status(Integer.valueOf(req.getParameter("del_status")));
        blogDao.update(blog);

        resp.sendRedirect("showBlogs");
    }
}
