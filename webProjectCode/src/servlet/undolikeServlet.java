package servlet;

import dao.ProcedureDao;
import dao.ProcedureDaoImpl;
import entity.Moments;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class undolikeServlet extends HttpServlet {
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
        String momentId=request.getParameter("momentId");
        ProcedureDao mwp0 = new ProcedureDaoImpl();
        if(mwp0.undoLike(momentId,nm)){
            request.setAttribute("undolikeSucced", "撤销成功");  //向request域中放置参数
        }else{
            request.setAttribute("undolikeSucced", "失败，已经点赞");  //向request域中放置参数
        }
        response.setContentType("text/html;charset=utf-8");
        ProcedureDao mwp1 = new ProcedureDaoImpl();
        List<Moments> myMoments = mwp1.getMomentsAllofMine(nm);
        request.setAttribute("hell","欢迎用户"+nm);
        request.setAttribute("allofMyMoments", myMoments);
        request.getRequestDispatcher("moments.jsp").forward(request, response);


    }

}
