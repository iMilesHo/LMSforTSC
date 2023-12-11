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
    <title>登录注册页面</title>
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
                <a href="login.jsp" class="navbar-brand">
                    <p class="wordcolor">面向生理时间序列分类的文献管理系统</p>
                </a>
            </div>
            <!--导航-->
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login.jsp">首页</a></li>
                    <li><a href="login.jsp">文献统计</a></li>
                    <li><a href="login.jsp">我的文献</a></li>
                    <li><a href="login.jsp">个人中心</a></li>
                    <li><a href="login.jsp">退出登录</a></li>
                    <li>
                        <a>
                            <form action="#" method="post" class="form-inline my-2 my-lg-0" role="search">
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
            <div class="col-md-7">
                <div class="dowebok" id="dowebok">
                    <div class="form-container sign-up-container">
                        <form action="registerServlet" method="post">
                            <h1>注册</h1>
                            <div class="social-container">
                                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                            <span>或使用邮箱注册</span>
                            <input type="text" name="userId" placeholder="账户，仅数字构成">
                            <input type="text" class="form-control" name="name" placeholder="用户名">
                            <input type="password" class="form-control" name="password" placeholder="密码">
                            <input type="text" class="form-control" name="field" placeholder="关注领域关键词">
                            <div class="form-group">
                                <label>学位</label>
                                <select name="degress">
                                    <option value="本科" selected>本科</option>
                                    <option value="硕士">硕士</option>
                                    <option value="博士">博士</option>
                                </select>
                            </div>
                            <button type="submit">注册</button>
                        </form>
                    </div>
                    <div class="form-container sign-in-container">
                        <form action="loginServlet" method="post">
                            <h1>登录</h1>
                            <div class="social-container">
                                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                            <span>或使用您的帐号</span>
                            <input type="text" name="name" placeholder="输入用户名">
                            <input type="password" name="password" placeholder="输入密码">
                            <a href="#">忘记密码？</a>
                            <button type="submit">登录</button>
                        </form>
                    </div>
                    <div class="overlay-container">
                        <div class="overlay">
                            <div class="overlay-panel overlay-left">
                                <h1>已有帐号？</h1>
                                <p>请使用您的帐号进行登录</p>
                                <button class="ghost" id="signIn">登录</button>
                            </div>
                            <div class="overlay-panel overlay-right">
                                <h1>没有帐号？</h1>
                                <p>立即注册加入我们，和我们一起开始旅程吧</p>
                                <button class="ghost" id="signUp">注册</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <script>
                        var signUpButton = document.getElementById('signUp')
                        var signInButton = document.getElementById('signIn')
                        var container = document.getElementById('dowebok')

                        signUpButton.addEventListener('click', function() {
                            container.classList.add('right-panel-active')
                        })

                        signInButton.addEventListener('click', function() {
                            container.classList.remove('right-panel-active')
                        })
                    </script>
                </div>
            </div>
            <div class="col-md-5">
                <br><br><br>
                <div id="container" style="width: 450px;height:400px;"></div>
                <script src="http://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
                <script>
                    // 图表配置
                    var chart = Highcharts.chart('container', {
                        title: {
                            text: '2000 ~ 2019 面向生理时间序列分类的文献数量'
                        },
                        subtitle: {
                            text: '数据由个人收集'
                        },
                        yAxis: {
                            title: {
                                text: '文献数量'
                            }
                        },
                        legend: {
                            layout: 'vertical',
                            align: 'right',
                            verticalAlign: 'middle'
                        },
                        plotOptions: {
                            series: {
                                label: {
                                    connectorAllowed: false
                                },
                            }
                        },
                        series: [{
                            name: '文献数量',
                            data: [1,1,3,2,2,6,2,7,5,17,11,23,71,196,218]
                        }],
                        responsive: {
                            rules: [{
                                condition: {
                                    maxWidth: 500
                                },
                                chartOptions: {
                                    legend: {
                                        layout: 'horizontal',
                                        align: 'center',
                                        verticalAlign: 'bottom'
                                    }
                                }
                            }]
                        }
                    });
                </script>
            </div>
        </div>
    </div>
</section>
<!--bottstarp结束-->

<!--联系我们 开始-->
<section id="contact">
    <div class="musk">
        <div class="container">
            <div class="row">
                <div class="col-md-8 wow fadeInLeft">
                    <h2><span class="glyphicon glyphicon-send"></span>问题反馈</h2>
                    <p class="contact-p">面向生理时间序列分类相关文献的文献管理系统，旨在帮助科研工作者快速的了解和学习面向生理时间序列分类相关进展和发展历史，同时建立了一个科研工作者交流的平台，可以相互交流该领域最新的发展成果，了解发展方向。而且还要具备文献管理系统的基础功能，对文献进行搜索、录入、存储和管理，并可以将文献相关的资料上传至数据库一边随时查阅的文献，建立文献资源库; 能够帮助用户进行参考文献导出以及自定义用户引文编排风格。</p>
                </div>
                <div class="col-md-4 wow fadeInRight">
                    <a role="button" data-toggle="modal" data-target="#myModal" class="form-control">反馈问题</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <from action="addQuestionRevServlet" method="post">
                    <input type="text" name="name" class="form-control" placeholder="您的姓名">
                    <input type="email" name="emil" class="form-control" placeholder="您的邮箱">
                    <input type="text" name="title" class="form-control" placeholder="标题">
                    <textarea class="form-control" name="words" rows="4" placeholder="请输入内容"></textarea>
                    <input type="submit" value="提交">
                </from>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!--联系我们 结束-->
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