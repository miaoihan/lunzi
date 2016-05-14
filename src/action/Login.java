package action;

import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * time: 16-4-27.
 * author: han
 */
public class Login extends HttpServlet {
    private List list;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
//        User user = new User();
//        UserDao userDao = new UserDao();
        String username = req.getParameter("username");
        String pwd = req.getParameter("password");
        /**  判断？user   */
        if (isUser(username,pwd)) {
            session.setAttribute("user", list.get(0));
            /**  登陆成功之后跳转   */
            resp.sendRedirect("showBlogs");
            return;
        }
        /** 用户名或密码不正确跳转 */
        resp.sendRedirect("error.jsp");
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.sendRedirect("login.jsp");

    }

    public boolean isUser(String usn, String pwd){
        String sql = String.format("select * from user where username='%s' and password='%s'", usn,pwd);
        UserDao userDao = new UserDao();
        /**  去库里查有没有user   */
        list = userDao.getBySql(sql);
        return list != null && list.size() > 0;
    }
}

