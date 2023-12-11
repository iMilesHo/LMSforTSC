package servlet;

import dao.ProcedureDao;
import dao.ProcedureDaoImpl;
import entity.Messages;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class showCopyMessageServlet extends HttpServlet {
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
        response.setContentType("text/html;charset=utf-8");
        ProcedureDao mwp = new ProcedureDaoImpl();
        List<Messages> messageCopy = mwp.getMessagesAllofMine_copy(nm);
        request.setAttribute("hell","欢迎用户"+nm);
        request.setAttribute("messageCopy", messageCopy);
        request.getRequestDispatcher("messageCopy.jsp").forward(request, response);
    }
}
