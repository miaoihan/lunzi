package action;

import dao.BlogDao;
import vo.Blog;
import vo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import javax.websocket.Session;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * time: 16-4-29.
 * author: han
 */
public class NewBlog extends HttpServlet {
    public NewBlog() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        BlogDao blogDao = new BlogDao();
        Blog blog = new Blog();
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        blog.setTitle(req.getParameter("title"));
        blog.setContent(req.getParameter("content"));
        blog.setUser_id(user.getId());
        blog.setDel_status(1);
        blogDao.save(blog);

        resp.sendRedirect("showBlogs");
    }
}
