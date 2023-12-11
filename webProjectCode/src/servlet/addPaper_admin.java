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

public class addPaper_admin extends HttpServlet {
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
        String title = request.getParameter("titel");
        String data = request.getParameter("data");
        String task = request.getParameter("task");
        String model = request.getParameter("model");
        String journal = request.getParameter("journal");
        String year = request.getParameter("year");
        String kkword = request.getParameter("kkword");

        Papers apaper=new Papers();
        apaper.settitel(title);
        apaper.setData(data);
        apaper.setTask(task);
        apaper.setModel(model);
        apaper.setjournal(journal);
        apaper.setyear(year);
        apaper.setkeywords(kkword);

        PaperDao up=new PaperDaoImpl();
        response.setContentType("text/html;charset=utf-8");
        if(up.addpaper(apaper)){
            request.setAttribute("addpaperSucced", "添加成功");  //向request域中放置参数
        }else {
            request.setAttribute("addpaperSucced", "添加失败,论文已存在");  //向request域中放置参数
        }
        request.setAttribute("hell","欢迎用户"+nm);
        request.getRequestDispatcher("add-article.jsp").forward(request, response);
    }
}
