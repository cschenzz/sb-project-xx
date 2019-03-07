//报警统计
var dom = document.getElementById("chart1");
var myChart = echarts.init(dom);
var app = {};
option = null;
option = {

    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data: ['报警数']
    },
    calculable: true,
    xAxis: [
        {
            type: 'category',
            data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
        }
    ],
    yAxis: [
        {
            type: 'value'
        }
    ],
    series: [
        {
            name: '报警数',
            type: 'bar',
            data: bjsl,

        },

    ]
};

if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
