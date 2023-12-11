<%--
  Created by IntelliJ IDEA.
  User: XXX
  Date: 2021/1/22
  Time: 1:41 上午
  To change this template use File | Settings | File Templates.
--%>
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
<html>

<head>
    <base href="<%=basePath%>">
    <title>我的动态</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/ibootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/icss/tianqun.css">
    <link rel="stylesheet" href="/icss/animate.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="icss/moment.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .divhead {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 3px solid #87CEEB;
            overflow: hidden;
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
        <div class="row wow fadeInDown" data-wow-offset="10">
            <div class="col-md-3">
                <div class="sideMomentPanel">
                    <a href="temp_userinfor.jsp"><h4 align="center">个人信息及修改</h4></a><hr />
                    <a href="temp_moments.jsp"><h4 align="center">我的讨论</h4></a><hr />
                    <a href="deliverMoment.jsp"><h4 align="center">发布讨论</h4></a><hr />
                    <a href="temp_messageCopy.jsp"><h4 align="center">收到分享的文献</h4></a><hr />
                    <a href="temp_messages.jsp"><h4 align="center">已分享</h4></a><hr />
                    <a href="sendmessage.jsp"><h4 align="center">分享文献</h4></a><hr />
                    <a href="temp_userinfor.jsp"><h4 align="center">好友列表</h4></a><hr />
                    <span class="label label-info">${requestScope.likeSucced}${requestScope.undolikeSucced}${requestScope.commentSucced}</span>
                </div>
            </div>
            <div class="col-md-9">
                <%
                    List<Moments> momentsAllofmine = (List<Moments>)pageContext.findAttribute("allofMyMoments");
                    int momentId=1,i=0;
                    momentId=1;
                    for(Moments usrmoments:momentsAllofmine){
                        momentId=usrmoments.getmomentId();
                %>
                <div class="momentPanel">
                    <table width="100%" align="center">
                        <tr>
                            <td>
                                <div class="divhead">
                                    <img src="/myimages/<%=usrmoments.getheadUrl()%>" class="img-circle" width="120" height="120">
                                </div>
                            </td>
                            <td></td>
                            <td>
                                <h2>&nbsp;&nbsp;<%=usrmoments.getUsername()%></h2>
                                <hr align="left" width="100%" />&nbsp;&nbsp;
                                    <%=usrmoments.getmomentTime()%>&nbsp;&nbsp;&nbsp;&nbsp;<i>
                                <%=usrmoments.getmomentAddr()%></i>
                                &nbsp;&nbsp;&nbsp;&nbsp;点赞人数&nbsp;&nbsp;<span class="label label-info"><%=usrmoments.getlikeNum()%></span>
                                &nbsp;&nbsp;&nbsp;&nbsp;<a href="dolikeServlet?momentId=<%=usrmoments.getmomentId()%>"><span class="glyphicon glyphicon-thumbs-up"></span></a>
                                <hr align="left" width="100%" />
                            <td>
                            <td>
                                <!-- 按钮触发模态框 -->

                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <th colspan="2">
                                <p>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <%=usrmoments.getmomentWord() %>
                                </p>
                            </th>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <% int havepics=usrmoments.gethavePicture();
                            if(havepics==1){
                        %>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <th colspan="3">
                                <div class="fakeimg">
                                    <img src="/myimages/<%=usrmoments.getpictureUrl()%>" class="img-thumbnail" width="50%">
                                </div>
                            </th>
                        </tr>
                        <%} %>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <th colspan="2">
                                <hr />
                            </th>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td>
                                <p class="text-left">
                                    <%
                                        int etcYN=0;
                                        for(User useroflike:usrmoments.getUseroflikeList()) {
                                            etcYN++;
                                    %>
                                    <span class="label label-info"><%=useroflike.getusername()%></span>
                                    <%
                                        }
                                        if(etcYN>0){
                                    %> 等觉得很赞。<a href="undolikeServlet?momentId=<%=usrmoments.getmomentId()%>">取消点赞</a>
                                    <%}%>
                                </p>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td>
                                <div class="form-container ">
                                <form action="addCommentServlet" method="post">
                                    <input type="text" name="commentofUser" placeholder="评论区...">
                                    <input type="hidden" name="momentId" value="<%=usrmoments.getmomentId()%>">
                                </form>
                                </div>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <%
                            for(Comments commentlist:usrmoments.getCommentlist()) {
                        %>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td>
                                <span class="label label-info"><%=commentlist.getUsername()%></span>:<%=commentlist.getcommentsword()%><br><br>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <%}%>

                    </table>
                </div>
                <br>
                <%}%>
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