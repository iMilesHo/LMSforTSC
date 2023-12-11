<%--
  Created by IntelliJ IDEA.
  User: XXX
  Date: 2021/1/22
  Time: 1:41 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <base href="<%=basePath%>">
    <title>统计</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/ibootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/icss/tianqun.css">
    <link rel="stylesheet" href="/icss/animate.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="icss/addpaper.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

<!--导航开始-->
<nav class="navbar navbar-default navbar-fixed-top tq-navbar-default">
    <div class="collapse navbar-collapse">
        <div class="container">
            <!--小屏幕logo和栏目按钮-->
            <div class="navbar-header">
                <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="success.jsp" class="navbar-brand">
                    <p class="wordcolor">面向生理时间序列分类的文献管理系统</p>
                </a>
            </div>
            <!--导航-->
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="success.jsp">首页</a></li>
                    <li><a href="statisticPaper.jsp">文献统计</a></li>
                    <li><a href="temp_mycollectedpapers.jsp">我的文献</a></li>
                    <li><a href="temp_userinfor.jsp">个人中心</a></li>
                    <li><a href="login.jsp">退出登录</a></li>
                    <li>
                        <a>
                            <form action="SrchPaprServlet" method="post" class="form-inline my-2 my-lg-0" role="search">
                                <input class="form-control mr-sm-2" type="text" placeholder="Search..." name="ikeywords">
                                <button class="btn btn-secondary my-2 my-sm-0" type="submit">搜索</button>
                            </form>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!--导航结束-->

<!--bootstrap开始-->
<section id="bootstarp">
    <div class="container">
        <div class="row wow fadeInDown" data-wow-offset="10"></div>
        <div class="col-md-2">
            <div class="sideMomentPanel">
                <a href="temp_mycollectedpapers.jsp"><h4 align="center">我的收藏</h4></a><hr />
                <a href="addpapers.jsp"><h4 align="center">添加文献</h4></a><hr />
                <a href="statisticPaper.jsp"><h4 align="center">所有文献统计</h4></a><hr />
            </div>
        </div>
        <div class="col-md-10" align="center">
            <div class="statisticPanel">
                <div class="form-container ">
                    <form action="addPaperServlet" method="post">
                        <h2>录入文献</h2>
                        <p class="color: #333">${requestScope.addpaperSucced}</p>
                        <input type="text" name="titel" placeholder="题目(必填)">
                        <input type="text" name="data" placeholder="使用数据类型(必填)">
                        <input type="text" name="task" placeholder="研究任务或应用(必填)">
                        <input type="text" name="journal" placeholder="期刊或会议(必填)">
                        <input type="text" name="model" placeholder="使用的模型(必填)">
                        <input type="text" name="year" placeholder="发表年份(必填)">
                        <input type="text" name="kkword" placeholder="关键词(选填)">
                        <button type="submit">提交</button>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>
</section>
<!--bootstrap结束-->
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
<script>
    $(function() {
        // 大屏导航跳转参数
        $('.nav').singlePageNav({
            offset: 70
        });
        // 小屏导航跳转参数
        $('.navbar-collapse a').click(function() {
            $('.navbar-collapse').collapse('hide');
        });
        new WOW().init();
    })
</script>
</body>

</html>