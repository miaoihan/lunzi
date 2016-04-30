package action;

import dao.BlogDao;
import vo.Blog;
import vo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * time: 16-4-29.
 * author: han
 */
public class ShowBlogs extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        BlogDao blogDao= new BlogDao();
        HttpSession session = req.getSession();
        /**  获取当前回话用户的id   */
        User user = (User)session.getAttribute("user");
        Integer uid = user.getId();
        /**  查询当前用户的blogs   */
        List<Blog> blogs = blogDao.getAll(uid);
        req.setAttribute("blogs",blogs);

//        RequestDispatcher dispatcher=
//                req.getRequestDispatcher("showBlogs.jsp");//转发添加正确页面
//        dispatcher.forward(req,resp);
        req.getRequestDispatcher("blogList.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
