package servlet;

import dao.PaperDao;
import dao.PaperDaoImpl;
import entity.Papers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class SearchallofmycollecServlet extends HttpServlet {
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
        PaperDao ud = new PaperDaoImpl();
        List<Papers> papersAll = ud.getPaperAllofMine(nm);
        request.setAttribute("hell","欢迎用户"+nm);
        request.setAttribute("paperallofmine", papersAll);
        request.getRequestDispatcher("mycollectedpapers.jsp").forward(request, response);
    }
}
