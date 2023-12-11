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
                    <a href="temp_content.jsp" class="list-group-item">文献管理</a>
                    <a href="add-article.jsp" class="list-group-item active">添加文献</a>
                </div>
            </div>
            <div class="col-md-10">
                <div class="page-header">
                    <h1 class="mg0 pd0 fz16">文献管理</h1>
                </div>
                <div>
                    <ul class="nav nav-tabs">
                        <li>
                            <a href="temp_content.jsp">文献列表</a>
                        </li>
                        <li  class="active">
                            <a href="add-article.jsp">添加文献</a>
                        </li>
                    </ul>
                    <form action="addPaper_admin" class="mt15">
                        <div class="form-group">
                            <label>标题</label>
                            <input class="form-control" type="text" name="titel" placeholder="题目(必填)"><label>使用数据类型</label>
                            <input class="form-control" type="text" name="data" placeholder="使用数据类型(必填)"><label>研究任务或应用</label>
                            <input class="form-control" type="text" name="task" placeholder="研究任务或应用(必填)"><label>期刊或会议</label>
                            <input class="form-control" type="text" name="journal" placeholder="期刊或会议(必填)"><label>使用的模型</label>
                            <input class="form-control" type="text" name="model" placeholder="使用的模型(必填)"><label>发表年份</label>
                            <input class="form-control" type="text" name="year" placeholder="发表年份(必填)"><label>关键词</label>
                            <input class="form-control" type="text" name="kkword" placeholder="关键词(选填)">
                        </div>
                        <div class="checkbox">
                            <button type="submit" class="btn btn-default pull-right">添加文献</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>



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