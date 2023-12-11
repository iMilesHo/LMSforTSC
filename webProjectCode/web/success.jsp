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
    <title>搜索</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/ibootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/icss/tianqun.css">
    <link rel="stylesheet" href="/icss/animate.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="icss/logininstyle.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        .search {
            height: 36px;
            width: 584px;
            line-height: 44px;
            border: none;
            border-radius: 15px;
            box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.16), 0 0 0 1px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
            font: 16px arial,sans-serif;
            padding-left: 17px;
        }
        .search:hover, .search:focus {
            outline: none;
            box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.16), 0 0 0 1px rgba(0, 0, 0, 0.08);
        }
    </style>
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
        <div class="dowebok2">
        <div class="row wow fadeInDown" data-wow-offset="10" align="center">
                <form action="SrchPaprServlet" method="post" class="form-inline my-2 my-lg-0" role="search">
                    <input class="search" type="text" placeholder="Search..." name="ikeywords">
                    <button class="btn btn-info btn-lg" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                </form>
            <h4 style="color: green">${requestScope.inum}</h4>
            <h4 style="color: green">${requestScope.colleSucced}</h4>
            <table class="table table-striped">
                <caption></caption>
                <thead>
                <tr>
                    <th>题目</th>
                    <th>来源</th>
                    <th>时间</th>
                    <th>作者</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>...</th>
                    <th>...</th>
                    <th>...</th>
                    <th>...</th>
                    <th>...</th>
                </tr>
                <c:forEach var="U" items="${requestScope.searchpaperesult}">
                    <tr>
                        <td>${U.titel}</td>
                        <td>${U.journal}</td>
                        <td>${U.year}</td>
                        <td>${U.authors}</td>
                        <td>
                            <a href="collectionServlet?ipaperid=${U.paperId}??${requestScope.bikeywords}" style="color: #269abc">收藏</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
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