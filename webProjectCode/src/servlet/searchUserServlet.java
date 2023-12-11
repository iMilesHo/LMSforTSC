package servlet;

import dao.UserDao;
import dao.UserDaoImpl;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class searchUserServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session==null){
            //没有登录成功，跳转到登录页面
            response.sendRedirect("login.jsp");
            return;
        }
        //取出会话数据
        String nm = (String)session.getAttribute("loginName");
        if(nm==null){
            //没有登录成功，跳转到登录页面
            response.sendRedirect("login.jsp");
            return;
        }
        String kd = request.getParameter("name"); //得到jsp页面传过来的参数
        response.setContentType("text/html;charset=utf-8");
        UserDao ud = new UserDaoImpl();
        List<User> userList = ud.searchUsers(kd);
        String resnum="检索到"+userList.size()+"位用户";
        request.setAttribute("bikeywords",kd);
        request.setAttribute("inum",resnum);
        request.setAttribute("hell","欢迎用户"+nm);
        request.setAttribute("allofUserss", userList);
        request.getRequestDispatcher("user-search.jsp").forward(request, response);
    }
}
