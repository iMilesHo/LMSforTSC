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

public class collectionServlet extends HttpServlet {
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
        String cc=request.getParameter("ipaperid");
        String[] t=cc.split("\\?+");
        String id = t[0];
        String bbikeyword = t[1];
        request.setAttribute("bikeywords",bbikeyword);//把之前的搜索内容返回
        PaperDao pd=new PaperDaoImpl();
        if(pd.addcollectionlist(nm,id)){
            request.setAttribute("colleSucced", "收藏成功");  //向request域中放置参数
        }else{
            request.setAttribute("colleSucced", "收藏失败");  //向request域中放置参数
        }
        PaperDao ud = new PaperDaoImpl();
        List<Papers> papersAll = ud.getPaperSearch(bbikeyword);
        String resnum="检索到"+papersAll.size()+"条文献";
        request.setAttribute("bikeywords",bbikeyword);
        request.setAttribute("inum",resnum);
        request.setAttribute("hell","欢迎用户"+nm);
        request.setAttribute("searchpaperesult", papersAll);
        request.getRequestDispatcher("success.jsp").forward(request, response);
    }

}
