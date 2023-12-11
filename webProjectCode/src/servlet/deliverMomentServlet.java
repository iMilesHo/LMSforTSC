package servlet;

import dao.ProcedureDao;
import dao.ProcedureDaoImpl;
import entity.Moments;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class deliverMomentServlet extends HttpServlet {
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
        //String momentWords = request.getParameter("momentWords");
        //String momentAddr = request.getParameter("momentAddr");

        Moments md = new Moments(); //实例化一个对象，组装属性
        md.setpictureUrl("1");
        md.sethavePicture(0);
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                // 1. 创建DiskFileItemFactory对象，设置缓冲区大小和临时文件目录
                DiskFileItemFactory factory = new DiskFileItemFactory();
                // System.out.println(System.getProperty("java.io.tmpdir"));//默认临时文件夹

                // 2. 创建ServletFileUpload对象，并设置上传文件的大小限制。
                ServletFileUpload sfu = new ServletFileUpload(factory);
                sfu.setSizeMax(10 * 1024 * 1024);// 以byte为单位 不能超过10M 1024byte =
                // 1kb 1024kb=1M 1024M = 1G
                sfu.setHeaderEncoding("utf-8");

                // 3.
                // 调用ServletFileUpload.parseRequest方法解析request对象，得到一个保存了所有上传内容的List对象。
                @SuppressWarnings("unchecked")
                List<FileItem> fileItemList = sfu.parseRequest(request);
                Iterator<FileItem> fileItems = fileItemList.iterator();

                // 4. 遍历list，每迭代一个FileItem对象，调用其isFormField方法判断是否是上传文件
                while (fileItems.hasNext()) {
                    FileItem fileItem = fileItems.next();
                    // 普通表单元素
                    if (fileItem.isFormField()) {
                        String name = fileItem.getFieldName();// name属性值
                        String values = fileItem.getString("utf-8");// name对应的value值
                        if(name.equals("momentAddr")) {
                            md.setmomentAddr(values);
                        }else if(name.equals("momentWords")) {
                            md.setmomentWord(values);
                        }

                        System.out.println(name + " = " + values);
                    }
                    // <input type="file">的上传文件的元素
                    else {
                        String fileName = fileItem.getName();// 文件名称
                        System.out.println("原文件名：" + fileName);// Koala.jpg

                        String suffix = fileName.substring(fileName.lastIndexOf('.'));
                        System.out.println("扩展名：" + suffix);// .jpg

                        // 新文件名（唯一）
                        String newFileName = new Date().getTime() + suffix;
                        System.out.println("新文件名：" + newFileName);// image\1478509873038.jpg
                        md.setpictureUrl(newFileName);
                        md.sethavePicture(1);
                        // 5. 调用FileItem的write()方法，写入文件
                        File file = new File("/Users/yuanlaihe/javawebpicture/" + newFileName);
                        System.out.println(file.getAbsolutePath());
                        fileItem.write(file);

                        // 6. 调用FileItem的delete()方法，删除临时文件
                        fileItem.delete();
                    }
                }

            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        System.out.println("getdynamic_words"+md.getmomentWord());
        System.out.println("gethavapictue"+md.gethavePicture());
        if((md.getmomentWord().equals("")||md.getmomentWord()==null)&&md.gethavePicture()==0) {
            request.setAttribute("undeliver", "不能发布空的动态");  //向request域中放置参数
            request.getRequestDispatcher("/deliverMoment.jsp").forward(request, response);
            return ;
        }
        ProcedureDao mpd = new ProcedureDaoImpl();
        if(mpd.deliverMoments(md,nm)){
            request.setAttribute("deliver", "发布成功");  //向request域中放置参数
        }else{
            request.setAttribute("undeliver", "发布失败");  //向request域中放置参数
        }
        request.getRequestDispatcher("/deliverMoment.jsp").forward(request, response);
    }
}
