package servlet;

import dao.UserDao;
import dao.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class updateUserNameServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String name = request.getParameter("name"); //获取jsp页面传过来的参数

        UserDao ud = new UserDaoImpl();

        if(ud.update(name, id)){
            request.getRequestDispatcher("/addUpdateDeleteSuccess.jsp").forward(request, response);
        }else{
            response.sendRedirect("addUpdateDeleteFail.jsp");
        }
    }
}
