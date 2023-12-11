var lineChartData = {
    //X坐标数据
    labels:["周一","周二","周三","周四","周五","周六","周日"],
    datasets:[
        {
            //统计表的背景颜色
            fillColor:"rgba(0,0,255,0.5)",
            //统计表画笔颜色
            strokeColor:"rgba(0,0,0,1)",
            //点的颜色
            pointColor:"rgba(155,39,39,1)",
            //点边框的颜色
            pointStrokeColor:"#fff",
            //鼠标触发时点的颜色
            pointHighlightFill:"fff",
            //鼠标触发时点边框的颜色
            pointHighlightStroke:"rgba(220,220,220,1)",
            //Y坐标数据
            data:[105,207,405,645,728,905,1000]
        },
        {
            fillColor: "rgba(0,255,0,0.5)",
            strokeColor:"rgba(92,184,92,1)",
            pointColor:"rgba(23,126,23,1)",
            pointStrokeColor:"#fff",
            pointHighlightFill:"fff",
            pointHighlightStroke:"rgba(151,187,205,1)",
            data:[155,407,705,345,678,565,900]
        },
        {
            fillColor: "rgba(255,0,0,0.5)",
            strokeColor:"rgba(92,0,92,1)",
            pointColor:"rgba(23,126,23,1)",
            pointStrokeColor:"#fff",
            pointHighlightFill:"fff",
            pointHighlightStroke:"rgba(151,187,205,1)",
            data:[455,207,505,345,778,965,400]
        }
    ]
}

window.onload = function () {
    var ctx = document.getElementById("canvas").getContext("2d");
    window.myline = new Chart(ctx).Line(lineChartData,{
        responsive: true
    });
}