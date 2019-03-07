function initChart() {

    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    var highlight = '#03b7c9';

    var demoData = [

        {name: '心率', value: heart, unit: '次/分钟', pos: ['16.6%', '50%'], range: [0, 200]},
        {name: '收缩压', value: high, unit: 'mmHg', pos: ['49.8%', '50%'], range: [0, 300]},
        {name: '舒张压', value: low, unit: 'mmHg', pos: ['83%', '50%'], range: [0, 150]}
    ];

    option = {
        backgroundColor: '',
        series: (function () {
            var result = [];

            demoData.forEach(function (item) {
                result.push(
                    // 外围刻度
                    {
                        type: 'gauge',
                        center: item.pos,
                        radius: '65.33%',  // 1行3个
                        splitNumber: item.splitNum || 10,
                        min: item.range[0],
                        max: item.range[1],
                        startAngle: 225,
                        endAngle: -45,
                        axisLine: {
                            show: true,
                            lineStyle: {
                                width: 2,
                                shadowBlur: 0,
                                color: [
                                    [1, highlight]
                                ]
                            }
                        },
                        axisTick: {
                            show: true,
                            lineStyle: {
                                color: highlight,
                                width: 1
                            },
                            length: -5,
                            splitNumber: 10
                        },
                        splitLine: {
                            show: true,
                            length: -14,
                            lineStyle: {
                                color: highlight,
                            }
                        },
                        axisLabel: {
                            distance: -20,
                            textStyle: {
                                color: highlight,
                                fontSize: '14',
                                fontWeight: 'bold'
                            }
                        },
                        pointer: {
                            show: 0
                        },
                        detail: {
                            show: 0
                        }
                    },

                    // 内侧指针、数值显示
                    {
                        name: item.name,
                        type: 'gauge',
                        center: item.pos,
                        radius: '59.33%',
                        startAngle: 225,
                        endAngle: -45,
                        min: item.range[0],
                        max: item.range[1],
                        axisLine: {
                            show: true,
                            lineStyle: {
                                width: 10,
                                color: [
                                    [1, '#eaeaea']
                                ]
                            }
                        },
                        axisTick: {
                            show: 0,
                        },
                        splitLine: {
                            show: 0,
                        },
                        axisLabel: {
                            show: 0
                        },
                        pointer: {
                            show: true,
                            length: '105%'
                        },
                        detail: {
                            show: true,
                            offsetCenter: [0, '100%'],
                            textStyle: {
                                fontSize: 20,
                                color: '#000'
                            },
                            formatter: [
                                '{value} ' + (item.unit || ''),
                                '{name|' + item.name + '}'
                            ].join('\n'),
                            rich: {
                                name: {
                                    fontSize: 14,
                                    lineHeight: 30,
                                    color: '#03b7c9'
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: highlight,
                            }
                        },
                        data: [{
                            value: item.value
                        }]
                    }
                );
            });

            return result;
        })()
    };


    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }


    var dom1 = document.getElementById("chart");
    var myChart1 = echarts.init(dom1);
    var app1 = {};
    option1 = null;
    option1 = {
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
                animation: true
            }/*,
        formatter: function (a) {
            for (var i = 0; i < a.length; i++) {
                a[i]['value'] = a[i]['value'] == '' || typeof a[i]['value'] == undefined ? 0 : a[i]['value'];
                a[i]['color'] = a[i]['color'] == '' || typeof a[i]['color'] == undefined ? '#FFF' : a[i]['color'];
                a[i]['seriesName'] = a[i]['seriesName'] == '' || typeof a[i]['seriesName'] == undefined ? '无数据' : a[i]['seriesName'];
            }
            return (
                a[0]['axisValueLabel'] + "<br>" +

                '<span style="display: inline-block; margin-right: 5px; border-radius: 10px; width: 9px; height: 9px; background-color: ' + a[0]['color'] + '"></span>' +
                a[0]['seriesName'] + ': ' + a[0]['value'] + "<br>" +

                '<span style="display: inline-block; margin-right: 5px; border-radius: 10px; width: 9px; height: 9px; background-color: ' + a[1]['color'] + '"></span>' +
                a[1]['seriesName'] + ': ' + a[1]['value'] + "<br>" +

                '<span style="display: inline-block; margin-right: 5px; border-radius: 10px; width: 9px; height: 9px; background-color: ' + a[2]['color'] + '"></span>' +
                a[2]['seriesName'] + ': ' + a[2]['value']
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
            height: '100',
        }, {
            left: '3%',
            right: '4%',
            top: '200',
            height: '100',
        }, {
            left: '3%',
            right: '4%',
            top: '360',
            height: '100',
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
                data: hourbpxyTime,
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
                data: hourbpxyTime,


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
                data: hourheartTime,
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
                data: hourheart,
            },
            {
                name: '收缩压',
                type: 'line',
                xAxisIndex: 1,
                yAxisIndex: 1,
                data: hourHigh,

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
                data: hourLow,
            }
        ]
    };


    if (option1 && typeof option1 === "object") {
        myChart1.setOption(option1, true);
    }

}

//重新渲染
function rerender() {
    myChart.setOption(option, true);
    myChart1.setOption(option1, true);
}