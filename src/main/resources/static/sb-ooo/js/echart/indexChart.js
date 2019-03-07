//男女统计&严重程度统计
var dom = document.getElementById("chart");
var myChart = echarts.init(dom);
var app = {};
option = null;
var scale = 1;
var echartData =[{
    name: '男性',
    value: manPuCount
},{
    name: '女性',
    value: womanPuCount
}]
var echartData2 =[{
    name: '高危患者',
    value: gwPuCount
},{
    name: '严重患者',
    value: yzPuCount
},{
    name: '普通患者',
    value: normalPuCount
}]
var rich = {
    yellow: {
        color: "#000",
        fontSize: 14 * scale,
        padding: [5, 4],
        align: 'center'
    },
    total: {
        color: "#000",
        fontSize: 14 * scale,
        align: 'center'
    },
    white: {
        color:'#000',
        align: 'center',
        fontSize: 14 * scale,
        padding: [5, 0]
    },
    blue: {
        color: '#222222',
        fontSize: 14 * scale,
        align: 'left'
    }
}
option = {

    legend: [{
        selectedMode:false,
        formatter: function(name) {
            var total = 0;
            var averagePercent;
            echartData.forEach(function(value, index, array) {
                total += value.value;
            });
            return '{total|' + total +'人'+ '}';
        },
        data: [echartData[0].name],
        left: '23%',
        top: 'center',
        icon: 'none',
        align:'center',
        textStyle: {
            fontSize: 16 * scale,
            rich: rich
        },
    },{
        formatter: function(name) {
            var total = 0;
            var averagePercent;
            echartData2.forEach(function(value, index, array) {
                total += value.value;
            });
            return '{total|' + total +'人'+ '}';
        },
        data: [echartData[1].name],
        left: '73%',
        top: 'center',
        icon: 'none',
        align:'center',
        textStyle: {
            fontSize: 16 * scale,
            rich: rich
        },
    }],
    series: [{
        name: '男女',
        type: 'pie',
        center:['25%','50%'],
        radius: ['30%', '40%'],
        hoverAnimation: false,
        color: ['#00baf7', '#ff6ee4'],
        label: {
            normal: {
                formatter: function(params, ticket, callback) {
                    var total = 0;
                    var percent = 0;
                    echartData.forEach(function(value, index, array) {
                        total += value.value;
                    });
                    percent = ((params.value / total) * 100).toFixed(1);
                    return '{white|' + params.name + '}\n{white|' + params.value +'人'+ '}：{blue|' + percent + '%}';
                },
                rich: rich
            },
        },
        labelLine: {
            normal: {
                length: 25 * scale,
                length2: 0,
                lineStyle: {
                    color: '#0b5263'
                }
            }
        },
        data: echartData
    },{
        name: '严重程度',
        type: 'pie',
        center:['75%','50%'],
        radius: ['30%', '40%'],
        hoverAnimation: false,
        color: ['#ff8427', '#fff227', '#27a2ff'],
        label: {
            normal: {
                formatter: function(params, ticket, callback) {
                    var total = 0;
                    var percent = 0;
                    echartData2.forEach(function(value, index, array) {
                        total += value.value;
                    });
                    percent = ((params.value / total) * 100).toFixed(1);
                    return '{white|' + params.name + '}：{yellow|' + params.value +'人'+ '}\n{blue|' +'（'+ percent + '%）}';
                },
                rich: rich
            },
        },
        labelLine: {
            normal: {
                length: 25 * scale,
                length2: 0,
                lineStyle: {
                    color: '#0b5263'
                }
            }
        },
        data: echartData2
    }]
};

if (option && typeof option === "object") {
    myChart.setOption(option, true);
}

//报警数据统计
var dom = document.getElementById("chart1");
var myChart = echarts.init(dom);
var app = {};
option = null;
app.title = '报警统计';

option = {
    tooltip: {
        trigger: "axis",
        padding: [8, 10],
        backgroundColor: 'rgba(0,0,0,0.5)',
        axisPointer: {
            type: "shadow",
            textStyle: {
                color: "#000"
            }
        }
    },
    toolbox: {
        feature: {
            dataView: {show: false, readOnly: false},
            magicType: {show: true, type: ['line', 'bar']},
        }
    },
    legend: {
        data:['报警次数']
    },
    label: {
        show: true,
        position: 'top',
        color: '#333',
        fontSize: 14,
        fontWeight: 70
    },
    xAxis: [
        {
            type: 'category',
            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
            axisPointer: {
                type: 'shadow'
            }
        }
    ],
    yAxis: [
        {
            type: 'value',
            name: '每月数量',
            min: 0,
            max: 50,
            interval: 10,
            axisLabel: {
                formatter: '{value} 次'
            }
        },

    ],
    series: [
        {
            name:'报警数',
            type:'bar',
            data:bjsl
        },

    ]
};


if (option && typeof option === "object") {
    myChart.setOption(option, true);
}