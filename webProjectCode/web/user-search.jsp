<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.ProcedureDao" %>
<%@ page import="dao.ProcedureDaoImpl" %>
<%@ page import="entity.Moments" %>
<%@ page import="entity.User" %>
<%@ page import="javax.xml.stream.events.Comment" %>
<%@ page import="entity.Comments" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>后台</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="/ibootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/icss/admin.css">


</head>
<body>
<!--导航开始-->
<nav class="navbar navbar-default" id="admin-nav">
    <div class="container">
        <!--小屏幕logo和栏目按钮-->
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="adminIndex.jsp" class="navbar-brand">Admin</a>
        </div>

        <!--中等及以上屏幕导航-->
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-left">
                <li class="active">
                    <a href="adminIndex.jsp">
                        <span class="glyphicon glyphicon-home"></span>
                        后台首页
                    </a>
                </li>
                <li>
                    <a href="temp_user-list.jsp">
                        <span class="glyphicon glyphicon-user"></span>
                        用户管理
                    </a>
                </li>
                <li>
                    <a href="temp_content.jsp">
                        <span class="glyphicon glyphicon-duplicate"></span>
                        文献管理
                    </a>
                </li>
                <li>
                    <a href="tag.jsp">
                        <span class="glyphicon glyphicon-tag"></span>
                        权限管理
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a id="dLabel" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        admin
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dLabel">
                        <li><a href="#"><span class="glyphicon glyphicon-globe"></span>前台首页</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span>个人主页</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-cog"></span>个人设置</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-th"></span>账户中心</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-heart"></span>我的收藏</a></li>
                    </ul>
                </li>
                <li><a href="#"><span class="glyphicon glyphicon-off"></span>退出</a></li>
            </ul>
        </div>
    </div>
</nav>
<!--导航结束-->

<section id="main">
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <div class="list-group">
                    <a href="temp_user-list.jsp" class="list-group-item">用户管理</a>
                    <a href="user-search.jsp" class="list-group-item active">用户搜索</a>
                    <a role="button" data-toggle="modal" data-target="#myModal" class="list-group-item">添加用户</a>
                </div>
            </div>
            <div class="col-md-10">
                <div class="page-header">
                    <h1 class="mg0 pd0 fz16">用户管理</h1>
                </div>
                <div>
                    <ul class="nav nav-tabs">
                        <li>
                            <a href="temp_user-list.jsp">用户列表</a>
                        </li>
                        <li class="active">
                            <a href="user-search.jsp">用户搜索</a>
                        </li>
                        <li>
                            <a role="button" data-toggle="modal" data-target="#myModal">添加用户</a>
                        </li>
                    </ul>
                    <form action="searchUserServlet" class="user-search">
                        <div class="alert alert-info" role="alert">
                            <strong>提示：</strong>支持模糊搜索和匹配搜索
                        </div>
                        <div class="form-group">
                            <label for="name">用户名</label>
                            <input type="text" id="name" class="form-control" placeholder="请输入用户名">
                        </div>
                        <button type="submit" name="name" class="btn btn-default">搜索</button>
                    </form>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>用户名</th>
                            <th>生日</th>
                            <th>ID</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="U" items="${requestScope.allofUserss}">
                            <tr>
                                <th scope="row">${U.username}</th>
                                <td>${U.birthday}</td>
                                <td>${U.userId}</td>
                                <td>
                                    <div role="presentation" class="dropdown">
                                        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                            操作<span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">删除账户</a></li>
                                            <li><a href="#">修改密码</a></li>
                                            <li><a href="#">重置用户</a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<!--添加用户 开始-->
<section id="user-add">

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加用户</h4>
                </div>
                <div class="modal-body">
                    <form action="#">
                        <div class="form-group">
                            <lable for="add-name">用户名</lable>
                            <input type="text" id="add-name" class="form-control" placeholder="请输入用户名">
                        </div>
                        <div class="form-group">
                            <lable for="add-password">密码</lable>
                            <input type="text" id="add-password" class="form-control" placeholder="请输入密码">
                        </div>
                        <div class="form-group">
                            <lable for="confirm-password">确认密码</lable>
                            <input type="text" id="confirm-password" class="form-control" placeholder="请再次输入密码">
                        </div>
                        <div class="form-group">
                            <lable for="add-email">确认密码</lable>
                            <input type="email" id="add-email" class="form-control" placeholder="请输入邮箱">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">提交</button>
                </div>
            </div>
        </div>
    </div>
</section>
<!--添加用户 结束-->

<!--footer 开始-->
<section id="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p>XXX|XXXXXXXX|XXXXXXXXXXXX</p>
            </div>
        </div>
    </div>
</section>
<!--footer 结束-->


<script src="/ibootstrap/js/jquery.min.js"></script>
<script src="/ibootstrap/js/bootstrap.min.js"></script>

</body>
</html>