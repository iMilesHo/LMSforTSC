<%--
  Created by IntelliJ IDEA.
  User: XXX
  Date: 2021/1/22
  Time: 9:31 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP  starting page</title>
</head>
<body >
<form action="registerServlet"method="post" style="padding-top:-700px;">
    输入账号:<input name="userId" type="text"><br><br>
    输入姓名:<input name="name" type="text"><br><br>
    输入密码:<input name="password" type="password"><br><br>
    输入领域:<input name="field" type="text" ><br><br>
    <input type="reset"value="重置"><input type="submit"value="注册">
</form>
</body>
</html>
