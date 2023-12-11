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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
            <div class="col-md-6">
            <div class="dowebok" id="dowebok">
                <br><br>
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
            <div class="col-md-6">
                <div class="dowebok" id="dowebok">
                    <br><br>
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
        <br><br>
        <div class="row wow fadeInDown" data-wow-offset="10">
            <div class="col-md-6">
                <div class="dowebok" id="dowebok">
                    <br><br>
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
            <div class="col-md-6">
                <div class="dowebok" id="dowebok">
                    <br><br>
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