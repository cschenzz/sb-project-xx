function initChart() {
    var dom_line = document.getElementById("container");
    var line = echarts.init(dom_line);
    var app = {};
    line_option = null;
    var colorList = [
        '#60C0DD', '#9BCA63', '#FAD860', '#f8631d', '#60C0DD',
        '#D7504B', '#C6E579', '#F4E001', '#F0805A', '#26C0C0'
    ];
    var xAxisData = ['0-59', '60-79', '80-99', '>100'];
    var xAxisData1 = ['0-89', '90-119', '120-139', '>140'];
    var xAxisData2 = ['0-59', '60-79', '80-89', '>90'];
    line_option = {
        title: [{
            text: '心率统计',
            x: '15%',
            y: '88%',
            textAlign: 'center'
        }, {
            text: '收缩压统计',
            x: '48%',
            y: '88%',
            textAlign: 'center'
        }, {
            text: '舒张压统计',
            x: '83%',
            y: '88%',
            textAlign: 'center'
        }],
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross'
            }
        },
        grid: [
            {
                show: false,
                left: '5%',
                top: '15%',
                containLabel: true,
                width: '20%',
                height: '70%'
            },
            {
                show: false,
                left: '38%',
                top: '15%',
                containLabel: true,
                width: '20%',
                height: '70%'
            },
            {
                show: false,
                left: '70%',
                top: '15%',
                containLabel: true,
                width: '20%',
                height: '70%'
            }


        ],
        xAxis: [
            {
                gridIndex: 0,
                axisTick: {
                    alignWithLabel: true
                },
                data: xAxisData
            },
            {
                gridIndex: 1,
                axisTick: {
                    alignWithLabel: true
                },
                data: xAxisData1
            },
            {
                gridIndex: 2,
                axisTick: {
                    alignWithLabel: true
                },
                data: xAxisData2
            },


        ],
        yAxis: [
            {
                gridIndex: 0,
            },
            {
                gridIndex: 1,
            },
            {
                gridIndex: 2,
            },


        ],

        series: [
            {
                type: 'bar',
                xAxisIndex: 0,
                yAxisIndex: 0,
                itemStyle: {
                    normal: {
                        color: function (params) {
                            return colorList[params.dataIndex];
                        }
                    }
                },
                data: heartCount
            },
            {
                type: 'bar',
                xAxisIndex: 1,
                yAxisIndex: 1,
                itemStyle: {
                    normal: {
                        color: function (params) {
                            return colorList[params.dataIndex];
                        }
                    }
                },
                data: highCount
            },
            {
                type: 'bar',
                xAxisIndex: 2,
                yAxisIndex: 2,
                name: '3',
                itemStyle: {
                    normal: {
                        color: function (params) {
                            return colorList[params.dataIndex];
                        }
                    }
                },
                data: lowCount
            }


        ]
    };

    if (line_option && typeof line_option === "object") {
        line.setOption(line_option, true);
    }


    var dom_chart = document.getElementById("chart");
    var chart = echarts.init(dom_chart);
    var app = {};
    chart_option = null;
    chart_option = {
        title: {
            text: '',
            subtext: '',
            x: 'center'
        },
        legend: {
            data: ['心率', '收缩压', '舒张压']
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                animation: false
            }/*,
            formatter: function (a) {
                return (
                    a[0]['axisValueLabel'] + "<br>" +
                    '<span style="display: inline-block; margin-right: 5px; border-radius: 10px; width: 9px; height: 9px; background-color: ' + a[0]['color'] + '"></span>' +
                    a[0]['seriesName'] + ': ' + a[0]['value'] + '万' + "<br>" +
                    '<span style="display: inline-block; margin-right: 5px; border-radius: 10px; width: 9px; height: 9px; background-color: ' + a[1]['color'] + '"></span>' +
                    a[1]['seriesName'] + ': ' + a[1]['value'] + '万小时'
                );
            }*/
        },
        color: ['#fbad0b', '#0696ff', '#4ecb73'],
        axisPointer: {
            link: {xAxisIndex: 'all'}
        },
        grid: [{
            left: '3%',
            right: '4%',
            top: '30',
            height: '90',
        }, {
            left: '3%',
            right: '4%',
            top: '200',
            height: '90',
        }, {
            left: '3%',
            right: '4%',
            top: '360',
            height: '90',
        },],
        xAxis: [
            {
                type: 'category',
                boundaryGap: true,
                axisLine: {
                    onZero: true,
                    lineStyle: {
                        color: '#888888'
                    }
                },
                data: heartDataTime,
                axisLabel: {
                    textStyle: {
                        color: '#888888',
                        fontSize: '10'
                    },
                },

            },
            {
                gridIndex: 1,
                type: 'category',
                boundaryGap: true,
                axisLine: {
                    onZero: true,
                    lineStyle: {
                        color: '#888888'
                    }
                },
                data: xyDataTime,


            },
            {
                gridIndex: 2,
                type: 'category',
                boundaryGap: true,
                axisLine: {
                    onZero: false,
                    lineStyle: {
                        color: '#888888'
                    }
                },
                // position: 'bottom',
                data: xyDataTime,
                // axisLabel: {
                //     textStyle: {
                //         color: '#888888',
                //         fontSize: '10'
                //     },
                // },
            }
        ],
        yAxis: [
            {
                name: '',
                type: 'value',
                nameTextStyle: {
                    color: '#888888',
                    fontSize: 10
                },
                splitLine: {
                    lineStyle: {
                        type: 'dashed',
                        color: '#e6e6e6'
                    }
                },
                axisLine: {
                    onZero: false,
                    lineStyle: {
                        color: '#888888'
                    }
                },
                axisLabel: {
                    textStyle: {
                        color: '#888888',
                        fontSize: '10'
                    },
                },
            },
            {
                gridIndex: 1,
                name: '',
                type: 'value',
                nameTextStyle: {
                    color: '#888888',
                    fontSize: 10
                },
                axisLine: {
                    onZero: false,
                    lineStyle: {
                        color: '#888888'
                    }
                },
                splitLine: {
                    lineStyle: {
                        type: 'dashed',
                        color: '#e6e6e6'
                    }
                },
                axisLabel: {
                    textStyle: {
                        color: '#888888',
                        fontSize: '10'
                    },
                },
            },
            {
                gridIndex: 2,
                name: '',
                type: 'value',
                nameTextStyle: {
                    color: '#888888',
                    fontSize: 10
                },
                inverse: false,
                splitLine: {
                    lineStyle: {
                        type: 'dashed',
                        color: '#e6e6e6'
                    }
                },
                axisLine: {
                    onZero: false,
                    lineStyle: {
                        color: '#888888'
                    }
                },
                axisLabel: {
                    textStyle: {
                        color: '#888888',
                        fontSize: '10'
                    },
                },
            }
        ],
        series: [
            {
                name: '心率',
                type: 'line',
                data: heartData,
            },
            {
                name: '收缩压',
                type: 'line',
                xAxisIndex: 1,
                yAxisIndex: 1,
                data: highData,

            },
            {
                name: '舒张压',
                type: 'line',
                xAxisIndex: 2,
                barWidth: '20',
                yAxisIndex: 2,
                // areaStyle: {
                //     normal: {
                //         color: '#4ecb73',
                //         opacity: 0.51
                //     }
                // },
                data: lowData,
            }
        ]
    };


    if (chart_option && typeof chart_option === "object") {
        chart.setOption(chart_option, true);
    }
}

/**
 * 历史数据
 * */
function data_history(time, btn) {
    $(btn).siblings().removeClass("active");
    $(btn).addClass("active");
    var parm = {};
    var result;
    switch (time) {
        case "day":
            parm = {
                deviceId: deviceId,
                time: 'day'
            }
            break;
        case "week":
            parm = {
                deviceId: deviceId,
                time: 'week'
            }
            break;
        case "month":
            parm = {
                deviceId: deviceId,
                time: 'month'
            }
            break;
        case "3month":
            parm = {
                deviceId: deviceId,
                time: '3month'
            }
            break;
        case "halfYear":
            parm = {
                deviceId: deviceId,
                time: 'halfYear'
            }
            break;
        case "year":
            parm = {
                deviceId: deviceId,
                time: 'year'
            }
            break;
        default:
            parm = {
                deviceId: deviceId,
                time: 'day'
            }
            break;
    }
    result = requestPost(ctx + "api/handData/historyData", parm);
    if (result.msg == 'success') {
        heartCount = result.resultHeartCount;
        highCount = result.resultHighCount;
        lowCount = result.resultLowCount;
        heartData = result.resultHeartData;
        highData = result.resultHighData;
        lowData = result.resultLowData;

        heartDataTime = result.resultHeartDataTime;
        xyDataTime = result.resultXyDataTime;
        if (heartDataTime !== null && heartDataTime.length > 0) {
            for (var i = 0; i < heartDataTime.length; i++) {
                heartDataTime[i] = dateformat_all(heartDataTime[i]);
            }
        }
        if (xyDataTime !== null && xyDataTime.length > 0) {
            for (var i = 0; i < xyDataTime.length; i++) {
                xyDataTime[i] = dateformat_all(xyDataTime[i]);
            }
        }
    }

   // console.log(result);
    //重新刷新图表
    initChart();
}