/***医生统计界面*/


var dom = document.getElementById("chart");
var myChart = echarts.init(dom);
var app = {};
option = null;
app.title = '正负条形图';

app.title = '正负条形图';

option = {
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'line'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    grid: [
        {
        left: '0%',
        right: '200%',
        bottom: '5%',
        containLabel: true
    },
    {
        left:'25%',
        right:'4%',
        top:'20%',
        height:'70%',
        width:'70%',
        containLabel:true
    }, {
            left:'50%',
            right:'4%',
            top:'20%',
            height:'70%',
            width:'70%',
            containLabel:true
        }
    ],
    xAxis : [
        {
            type : 'value',
        },
        {
            type: 'category',
            axisTick: {show: false},
            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
            gridIndex: 1
        }
    ],
    yAxis : [
        {

        },
        {
            // type : 'value',
            gridIndex:1
        }
    ],
    series : [
         {
            name: '咨询',
            type: 'bar',
            barWidth:10,
            data: zxsl,
            xAxisIndex: 1,
            yAxisIndex: 1
        },
        {
            name: '已解决',
            type: 'bar',
            barWidth:10,
            data: zxsl_ok,
            xAxisIndex: 1,
            yAxisIndex: 1
        },
        {
            name: '未解决',
            type: 'bar',
            barWidth:10,
            data: zxsl_nok,
            xAxisIndex: 1,
            yAxisIndex: 1
        },
        {
        type: 'pie',
        radius: [0, '55%'],
        center: ['13%', '50%'],
        label: {
            normal: {
                    position: 'inner'
                }
            },
            labelLine: {
                normal: {
                    show: true
                }
            },
            data:[
                {value:zxsl_count_ok, name:'已解决咨询：' + zxsl_count_ok},
                {value:zxsl_count_nok, name:'未解决咨询：' + zxsl_count_nok},
                {value:jycount, name:'建议总数：' + jycount}
            ]
    },
    ]
};



if (option && typeof option === "object") {
    myChart.setOption(option, true);
}