package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//在filter下新建一个EncodingFilter用来解决中文字符集乱码，它需要实现Filter接口，并重写doFilter函数
public class EncodingFilter implements Filter {
    public EncodingFilter() {
        System.out.println("过滤器构造");
    }

    public void destroy() {
        System.out.println("过滤器销毁");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8"); //将编码改为utf-8
        response.setContentType("text/html;charset=utf-8");
        chain.doFilter(request, response);
    }

    public void init(FilterConfig arg0) throws ServletException {
        System.out.println("过滤器初始化");
    }
}

