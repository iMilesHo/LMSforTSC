package servlet;

import dao.UserDao;
import dao.UserDaoImpl;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class registerServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId= Integer.parseInt(request.getParameter("userId")); //获取jsp页面传过来的参数
        String name = request.getParameter("name");
        String pwd = request.getParameter("password");
        String field = request.getParameter("field");

        User user = new User(); //实例化一个对象，组装属性
        user.setuserId(userId);
        user.setusername(name);
        user.setpassword(pwd);
        user.setfield(field);

        UserDao ud = new UserDaoImpl();

        if(ud.register(user)){
            request.setAttribute("name", name+"注册成功，快登录吧！");  //向request域中放置参数
            request.getRequestDispatcher("/login.jsp").forward(request, response);  //转发到登录页面
        }else{
            request.setAttribute("name", "注册失败");  //向request域中放置参数
            response.sendRedirect("login.jsp");//注册失败则返回注册页面，但是缺少提示"注册失败"
        }
    }
}
