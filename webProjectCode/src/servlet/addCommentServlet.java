package servlet;

import dao.ProcedureDao;
import dao.ProcedureDaoImpl;
import entity.Comments;
import entity.Moments;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class addCommentServlet extends HttpServlet {
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
        //journal
        String commentofUser = request.getParameter("commentofUser");
        String momentId = request.getParameter("momentId");
        Comments acomment=new Comments();

        acomment.setcommentsword(commentofUser);
        acomment.setmomentId(Integer.parseInt(momentId));

        ProcedureDao cmt=new ProcedureDaoImpl();

        response.setContentType("text/html;charset=utf-8");
        if(cmt.addComments(momentId,nm,commentofUser)){
            request.setAttribute("commentSucced", "评论成功");  //向request域中放置参数
        }else {
            request.setAttribute("commentSucced", "评论失败");  //向request域中放置参数
        }
        ProcedureDao mwp1 = new ProcedureDaoImpl();
        List<Moments> myMoments = mwp1.getMomentsAllofMine(nm);
        request.setAttribute("hell","欢迎用户"+nm);
        request.setAttribute("allofMyMoments", myMoments);
        request.getRequestDispatcher("moments.jsp").forward(request, response);
    }
}
