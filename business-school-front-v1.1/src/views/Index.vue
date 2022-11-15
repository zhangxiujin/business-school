<template>
    <div id="container">
        <div class="answer_info">
            <div class="answer_info_title">
                <span class="answer_info_title_item">
                    发布的悬赏
                </span>
            </div>
            <div class="answer_info_content">
                <el-table
                        :data="tableData"
                        style="width: 100%">
                    <el-table-column
                            prop="id"
                            label="序号"
                            width="100">
                    </el-table-column>
                    <el-table-column
                            prop="primaryKey"
                            label="主键"
                            v-if="ifShowPrimaryColumn">
                    </el-table-column>
                    <el-table-column
                            prop="title"
                            label="标题"
                            width="180">
                    </el-table-column>
                    <el-table-column
                            prop="publisher"
                            label="发布者"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            prop="personCount"
                            label="回答人数"
                            width="100">
                    </el-table-column>
                    <el-table-column
                            prop="createTime"
                            label="创建时间">
                    </el-table-column>
                    <el-table-column
                            label="操作"
                            width="100">
                        <template #default="scope">
                            <el-button link type="primary" size="small" @click.prevent="answer(scope)">回答</el-button>
                        </template>
                    </el-table-column>
                </el-table>
            </div>
            <div style="margin-top:120px;">
                <el-pagination
                        @current-change="handleCurrentPage"
                        background
                        layout="prev, pager, next"
                        :page-size="pageSize"
                        :total="total">
                </el-pagination>
            </div>
        </div>



        <div id="statistics" class="statistics">
            <h1>悬赏统计区域</h1>
        </div>
    </div>
</template>

<script>
    import {loadPublishedList} from '../api/reward/reward';
    import {browerCount} from '../api/statistics/brower';
    import {statisticPublishCount} from '../api/statistics/reward';
    import * as echarts from 'echarts';
    var arr;

    export default {
        data() {
            return {
                tableData: [],
                pageSize: 4,
                pageNum : 1,
                total: 0,
                ifShowPrimaryColumn: false,
                // option: {
                //     xAxis: {
                //         type: 'category',
                //         data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                //     },
                //     yAxis: {
                //         type: 'value'
                //     },
                //     series: [
                //         {
                //             data: [150, 230, 224, 218, 135, 147, 260],
                //             type: 'line'
                //         }
                //     ]
                // }
                option: {
                    title: {
                        text: '悬赏发布统计'
                    },
                    tooltip: {},
                    legend: {
                        data: ['发布数量']
                    },
                    xAxis: {
                        data: ['当日', '本周', '本月', '本年度']
                    },
                    yAxis: {},
                    series: [
                        {
                            name: '发布数量',
                            type: 'bar',
                            data: []
                        }
                    ]
                }

                // option: {
                //     title: {
                //         text: 'Referer of a Website',
                //         subtext: 'Fake Data',
                //         left: 'center'
                //     },
                //     tooltip: {
                //         trigger: 'item'
                //     },
                //     legend: {
                //         orient: 'vertical',
                //         left: 'left'
                //     },
                //     series: [
                //         {
                //             name: 'Access From',
                //             type: 'pie',
                //             radius: '50%',//调整饼图大小
                //
                //             label: {
                //                 normal: {
                //                     show: true,
                //                     position: 'left',
                //                     textStyle: {
                //                         fontWeight: 100,
                //                         fontSize: 14
                //                     },
                //                     formatter: '{d}%'
                //                 }
                //             },//lable用来显示饼图百分比
                //             data: [],//后端数据传入这里
                //             emphasis: {
                //                 itemStyle: {
                //                     shadowBlur: 10,
                //                     shadowOffsetX: 0,
                //                     shadowColor: 'rgba(0, 0, 0, 0.5)'
                //                 }
                //             }
                //         }
                //     ]
                // }
            }
        },
        created() {
            this.loadPublishedList();
        },
        mounted() {
            this.loadEcharts();
        },
        methods: {
            answer(item) {
                this.browserCount({catalog: 'reward', businessId: item.row.primaryKey}, item);
            },
            handleCurrentPage(num) {
                this.pageNum = num;

                this.loadPublishedList();
            },
            loadPublishedList() {
                var params = {pageNum: this.pageNum, pageSize: this.pageSize};
                this.tableData = [];
                loadPublishedList(params).then((response) => {
                    console.log(response.data)
                    this.total = response.total;
                    response.data.forEach((item, index) => {
                        var json = {};
                        json.id = index + 1;
                        json.primaryKey = item.reward.rewardId;
                        json.title = item.reward.title;
                        json.publisher = item.user.username;
                        json.personCount = item.answerCount;
                        json.createTime = item.reward.createTime;
                        this.tableData.push(json);
                    })
                })
            },
            browserCount(params, item) {
                browerCount(params).then((response) => {
                    this.$router.push({name:'detail', query:{id: item.row.primaryKey}});
                })
            },
            loadEcharts() {
                var chartDom = document.getElementById('statistics');
                var myChart = echarts.init(chartDom);
                let arr = this.option;
                console.log(arr)
                statisticPublishCount().then(response => {
                    let obj = response.data;
                    // console.log(arr.series.data)
                    arr.series[0].data.push(obj.currentDayCount)
                    arr.series[0].data.push(obj.currentWeekCount)
                    arr.series[0].data.push(obj.currentMonthCount)
                    arr.series[0].data.push(obj.currentYearCount)
                    myChart.setOption(arr);
                })
            }
        }
    }
</script>

<style scoped>
    #container {
        width: 1440px;
        height: calc(100vh - 50px);
        margin-top: 100px;
        /*border: 1px solid red;*/
    }

    .answer_info {
        height: 50%;
        width: 700px;
        /*border: 1px solid orchid;*/
        float: left;
        text-align: center;
        border: 1px solid black;
        margin-left: 30px;
    }

    .answer_info_title {
        width: 100%;
        height: 30px;
        border-bottom: 1px solid black;
    }

    .answer_info_title_item {
        height: 30px;
    }

    .statistics {
        height: 50%;
        width: calc(1440px - 700px - 30px);
        /*border: 1px solid orchid;*/
        float: left;
        text-align: center;
    }
</style>
