package action;

import dao.UserDao;
import vo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * time: 16-4-27.
 * author: han
 */
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = new User();
        String name = req.getParameter("username");
        String pwd = req.getParameter("password");
        String nikn = req.getParameter("nikname");
        user.setUsername(name);
        user.setPassword(pwd);
        user.setNikname(nikn);
        user.setDel_status(1);
        UserDao udao = new UserDao();
        //存入数据库
        udao.save(user);
        session.setAttribute("user", user);
        resp.sendRedirect("login.jsp");

    }

}
