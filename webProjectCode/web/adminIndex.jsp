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
                <li><a href="login.jsp"><span class="glyphicon glyphicon-off"></span>退出</a></li>
            </ul>
        </div>
    </div>
</nav>
<!--导航结束-->

<!--警告层 开始-->
<section id="warning">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-success alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4>欢迎登录！</h4>
                </div>
            </div>
        </div>
    </div>
</section>
<!--警告层 结束-->

<!--主体内容 开始-->
<section id="main">
    <div class="container">
        <div class="row">
            <!--网站统计数据-->
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">各任务的种类及文献数量</div>
                    <div class="panel-body">
                        <div id="container" style="min-width:400px;height:400px"></div>
                        <script src="http://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
                        <script>
                            var chart = Highcharts.chart('container', {
                                chart: {
                                    type: 'column'
                                },
                                title: {
                                    text: '各任务的种类及文献数量'
                                },
                                subtitle: {
                                    text: '数据截止 2021-1-1'
                                },
                                xAxis: {
                                    type: 'category',
                                    labels: {
                                        rotation: -45  // 设置轴标签旋转角度
                                    }
                                },
                                yAxis: {
                                    min: 0,
                                    title: {
                                        text: '文献数量 (篇)'
                                    }
                                },
                                legend: {
                                    enabled: false
                                },
                                tooltip: {
                                    pointFormat: '文献总量: <b>{point.y:.1f} 篇</b>'
                                },
                                series: [{
                                    name: '文献数量',
                                    data: [
                                        ['Denoising', 7],
                                        ['Help paralyzed persons', 27],
                                        ['Annotation or Localization', 14],
                                        ['Brain disease classification', 29],
                                        ['Brain functionality classification', 21],
                                        ['Heart disease detection', 113],
                                        ['Emotion classification', 66],
                                        ['Hand gesture classification', 44],
                                        ['Heart beat classification', 28],
                                        ['Motor Imagery ', 77],
                                        ['Muscle activity recognition', 6],
                                        ['Sleep stage classification', 98],
                                        ['Others', 57],
                                    ],
                                    dataLabels: {
                                        enabled: true,
                                        rotation: -90,
                                        color: '#FFFFFF',
                                        align: 'right',
                                        format: '{point.y:.0f}', // :.1f 为保留 1 位小数
                                        y: 10
                                    }
                                }]
                            });
                        </script>
                    </div>
                </div>
            </div>
            <!--网站热贴-->
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">各模型类型占比</div>
                    <div id="container1" style="min-width:400px;height:400px"></div>
                    <script src="http://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
                    <script>
                        Highcharts.chart('container1', {
                            chart: {
                                plotBackgroundColor: null,
                                plotBorderWidth: null,
                                plotShadow: false,
                                type: 'pie'
                            },
                            title: {
                                text: '各模型类型占比'
                            },
                            subtitle: {
                                text: '数据截止 2021-1-1'
                            },
                            tooltip: {
                                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                            },
                            plotOptions: {
                                pie: {
                                    allowPointSelect: true,
                                    cursor: 'pointer',
                                    dataLabels: {
                                        enabled: true,
                                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                        style: {
                                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                        }
                                    }
                                }
                            },
                            series: [{
                                name: '模型',
                                colorByPoint: true,
                                data: [{
                                    name: 'CNN',
                                    y: 52.73,
                                    sliced: true,
                                    selected: true
                                }, {
                                    name: 'RNN',
                                    y: 10.54
                                }, {
                                    name: 'CRNN',
                                    y: 4.86
                                }, {
                                    name: 'CNN+RNN',
                                    y: 4.05
                                }, {
                                    name: 'AE',
                                    y: 3.08
                                }, {
                                    name: 'DBN',
                                    y: 2.92
                                }, {
                                    name: 'NN',
                                    y: 2.92
                                }, {
                                    name: 'DNN',
                                    y: 1.95
                                }, {
                                    name: 'SVM',
                                    y: 1.62
                                }, {
                                    name: 'GAN',
                                    y: 0.81
                                }, {
                                    name: 'RBM',
                                    y: 0.81
                                }, {
                                    name: 'HMM',
                                    y: 0.49
                                }, {
                                    name: 'KNN',
                                    y: 0.49
                                }, {
                                    name: 'LDA',
                                    y: 0.49
                                }, {
                                    name: 'MCDFA',
                                    y: 0.49
                                }, {
                                    name: 'CapsNet',
                                    y: 0.32
                                }, {
                                    name: 'CNN+AE',
                                    y: 0.32
                                }, {
                                    name: 'DGCNN',
                                    y: 0.32
                                }, {
                                    name: 'ResNet',
                                    y: 0.32
                                }, {
                                    name: 'DDL',
                                    y: 0.32
                                }, {
                                    name: 'LDS',
                                    y: 0.32
                                }, {
                                    name: 'RNN+SVM',
                                    y: 0.32
                                }, {
                                    name: 'CapsNet',
                                    y: 0.32
                                }, {
                                    name: 'Others',
                                    y: 10.14
                                }]
                            }]
                        });
                    </script>
                </div>
            </div>
        </div>
        <div class="row">
            <!--统计图表 -->
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">今日访客统计</div>
                    <div class="panel-body">
                        <div id="container3" style="height:400px;"></div>
                        <script src="http://cdn.highcharts.com.cn/highcharts/highcharts-3d.js"></script>
                        <script>
                            // 图表配置
                            var chart = Highcharts.chart('container3', {
                                chart: {
                                    type: 'pie',
                                    options3d: {
                                        enabled: true,
                                        alpha: 45,
                                        beta: 0
                                    }
                                },
                                title: {
                                    text: '各数据类型占比'
                                },
                                subtitle: {
                                    text: '数据截止 2021-1-1'
                                },
                                tooltip: {
                                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                },
                                plotOptions: {
                                    pie: {
                                        allowPointSelect: true,
                                        cursor: 'pointer',
                                        depth: 35,
                                        dataLabels: {
                                            enabled: true,
                                            format: '{point.name}'
                                        }
                                    }
                                },
                                series: [{
                                    type: 'pie',
                                    name: '各数据类型占比',
                                    data: [
                                        ['EOG',   11.82],
                                        ['EMG',       35.14],
                                        {
                                            name: 'EEG',
                                            y: 42.4,
                                            sliced: true,
                                            selected: true
                                        },
                                        ['ECG',    47.3],
                                        ['Combination', 5.9]
                                    ]
                                }]
                            });
                        </script>
                    </div>
                </div>
            </div>
            <!--服务器状态-->
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">面向生理时间序列分类的文献数量</div>
                    <div id="container2" style="width: 550px;height:400px;"></div>
                    <script src="http://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
                    <script>
                        // 图表配置
                        var chart = Highcharts.chart('container2', {
                            title: {
                                text: '2000 ~ 2019 面向生理时间序列分类的文献数量'
                            },
                            subtitle: {
                                text: '数据截止 2021-1-1'
                            },
                            xAxis: {
                                categories: [
                                    '2000','2002','2006','2007','2008','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019'
                                ],
                                crosshair: true
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
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">热点讨论</div>
                    <div class="panel-body">
                        <!--留言板-->
                        <div class="col-md-6">
                            <div class="media well">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object wh64" src="/myimages/5.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">TomW</h4>
                                    在诸多情况下，为了社区开发者和学术青年更好的了解 IJCAI 2020会议情况，AI研习社整理了 IJCAI 2020录取论文合集，供大家查阅
                                </div>
                            </div>
                            <div class="media well">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object wh64" src="/myimages/6.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">JackyH</h4>
                                    在我自学JavaWeb时，有两个地方是我觉得最难的，一个是JDBC相关的内容，另一个就是JSP与Servlet。
                                </div>
                            </div>
                        </div>
                        <!--请输入内容-->
                        <div class="col-md-6">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">问题反馈</div>
                    <div class="panel-body">
                        <!--留言板-->
                        <div class="col-md-6">
                            <div class="media well">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object wh64" src="/myimages/4.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Rose</h4>
                                    JDBC之所以让我感觉很难，在于JDBC是我接触的第一个“非Java类”形式的知识点。它是一个接口，而不是以前学的Java类。这让我有好一阵子缓不过来。啥叫接口？
                                </div>
                            </div>
                            <div class="media well">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object wh64" src="/myimages/5.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">TomW</h4>
                                    在诸多情况下，为了社区开发者和学术青年更好的了解 IJCAI 2020会议情况，AI研习社整理了 IJCAI 2020录取论文合集，供大家查阅
                                </div>
                            </div>

                        </div>
                        <!--请输入内容-->
                        <div class="col-md-6">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">团队留言板</div>
                    <div class="panel-body">
                        <!--留言板-->
                        <div class="col-md-7">
                            <div class="media well">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object wh64" src="/myimages/5.jpg" alt="...">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">TomW</h4>
                                    在诸多情况下，为了社区开发者和学术青年更好的了解 IJCAI 2020会议情况，AI研习社整理了 IJCAI 2020录取论文合集，供大家查阅
                                </div>
                            </div>

                        </div>
                        <!--请输入内容-->
                        <div class="col-md-5">
                            <form action="#">
                                <div class="form-group">
                                    <label for="text1">输入留言内容</label>
                                    <textarea class="form-control" id="text1" cols="10" rows="5" placeholder="请输入留言内容"></textarea>
                                    <button type="submit" class="btn btn-default mt15">发送</button>
                                </div>
                            </form>
                            <div class="panel panel-default">
                                <div class="panel-heading">团队联系手册</div>
                                <div class="panel-body">
                                    <ul class="list-group mt15">
                                        <li class="list-group-item">作者：<span class="glyphicon glyphicon-phone"></span>158013*****</li>
                                        <li class="list-group-item">作者：<span class="glyphicon glyphicon-phone"></span>158013*****</li>
                                        <li class="list-group-item">作者：<span class="glyphicon glyphicon-phone"></span>158013*****</li>
                                        <li class="list-group-item">作者：<span class="glyphicon glyphicon-phone"></span>158013*****</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--主体内容 结束-->


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
<script src="/ijs/chart.js"></script>
<script src="/ijs/script.js"></script>

</body>
</html>