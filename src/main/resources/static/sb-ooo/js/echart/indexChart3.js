
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
        left: '63%',
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
        radius: ['20%', '30%'],
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
        center:['65%','50%'],
        radius: ['20%', '30%'],
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