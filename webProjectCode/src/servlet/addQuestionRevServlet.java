package servlet;

import dao.ProcedureDao;
import dao.ProcedureDaoImpl;
import entity.QuestionReview;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class addQuestionRevServlet extends HttpServlet {
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
        String name = request.getParameter("name");
        String title = request.getParameter("tile");
        String emil = request.getParameter("emil");
        String words = request.getParameter("words");

        QuestionReview q=new QuestionReview();
        q.setName(name);
        q.setTitle(title);
        q.setEmil(emil);
        q.setWords(words);
        ProcedureDao pd=new ProcedureDaoImpl();
        response.setContentType("text/html;charset=utf-8");
        if(pd.addQuestionReview(q)){
            request.setAttribute("addquestionSucced", "添加成功");  //向request域中放置参数
        }else {
            request.setAttribute("addquestionSucced", "添加失败");  //向request域中放置参数
        }
        request.setAttribute("hell","欢迎用户"+nm);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
