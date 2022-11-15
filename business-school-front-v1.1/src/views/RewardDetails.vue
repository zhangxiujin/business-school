<template>
    <div style="width: 1000px; height: 500px; margin-left: auto; margin-right: auto; ">
        <div style="margin-top: 50px; margin-left: 50px; ">
            <div class="reward_title"><span>{{detail.title}}</span></div>
            <div style="float: left;  width: 40%;"><span>悬赏金: ￥{{detail.amount / 100}}</span></div>
        </div>
        <hr style="width: 100%"/>
        <div style="margin-top: 50px; margin-left: 50px; ">
            <div style="float: left;">
                <img src="https://img2.baidu.com/it/u=390829681,3002818272&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500" style="width: 50px; height: 50px;"/>
            </div>
            <div style="float: left;">
                <span style="width: 40%; line-height: 50px; margin-left: 50px;">{{detail.username}}</span>
            </div>
        </div>
        <hr  style="width: 100%;"/>
        <div style="margin-top: 50px; margin-left: 50px; ">
            <span v-html="detail.content"></span>
        </div>
        <hr  style="width: 100%;"/>
        <br>
        <div>
            <div style="width: 100%; height: 50px; font-size: 20px; margin-left: 50px;">
                <span style="float: left; width: 200px;">回答区</span>
            </div>

            <hr width="100%;" />

            <div style="" v-if="(answers.length == 0)">
                <p style="text-align: center; line-height: 80px;">暂无评论</p>
            </div>

            <div style="height: auto;" v-for="item in answers" :key="item.rewardAnswer.answerId">
                <div style="width: 100%; height: 80px;">

                    <div style="width: 100%; margin-left: 50px; margin-top: 30px;">
                        <div style="float: left;">
                            <img src="https://img2.baidu.com/it/u=390829681,3002818272&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500" style="width: 50px; height: 50px;"/>
                        </div>
                        <div style="float: left;">
                        <span style="width: 40%; line-height: 50px; margin-left: 50px;">
                            {{item.username}}</span>
                    </div>
                        <div style="float: left;">
                        <span style="width: 40%; line-height: 50px; margin-left: 50px;">
                            评论时间: {{item.rewardAnswer.answerTime}}</span>
                        </div>
                    </div>
                </div>
                <div style="margin-left: 50px; width: 100%; min-height: 80px; height: auto; ">
                    <div v-html="item.rewardAnswer.content" style="float: left; width: 80%;">
                    </div>
                </div>
            </div>

            <hr width="100%;"/>

            <div class="editor-container">
                <div style=" width: 100%; height: 20px;">
                    <el-button style="display: block; float:right;" type="primary" @click="submitAnswer">提交回答</el-button>
                </div>
                <!--<button @click="getContent">获取编辑器内容</button>-->
                <div ref="editorContainer" class="editor"></div>
            </div>
        </div>
    </div>
</template>

<script>
    import {loadJsResource} from '@/utils/ueditor';
    import { ref, onMounted }  from 'vue';
    import {queryRewardDetail, saveAnswer} from '../api/reward/reward'

    export default {
        setup() {
            const editorContainer = ref(null);
            let editorInstance = null;
            onMounted(()=>{
                if(!window.UE) {
                    const scripts = ['UEditor/ueditor.config.js','UEditor/ueditor.all.js'];
                    loadJsResource(scripts, 'http://127.0.0.1:5173/').then(()=>{
                        if(window.UE) {
                            editorInstance = window.UE.getEditor(editorContainer.value);
                        }
                    })
                } else {
                    if(!editorInstance) {
                        editorInstance = window.UE.getEditor(editorContainer.value);
                    }
                }

            })
            const getContent = () => {
                // alert(editorInstance.getContent())
                console.log(editorInstance.getContent())
                return editorInstance;
            }
            return {
                editorContainer,
                getContent
            }
        },
        data() {
            return {
                id: null,
                value: '这是我调用 vue-ueditor-wrap 的案例',
                myConfig: {
                    // 编辑器不自动被内容撑高
                    autoHeightEnabled: false,
                    // 初始容器高度
                    initialFrameHeight: 240,
                    // 初始容器宽度
                    initialFrameWidth: '100%',
                    // 上传文件接口 (这个地址是我为了方便各位体验文件上传功能搭建的临时接口, 请勿在生产环境使用!!!)
                    serverUrl: '',
                    // UEditor 资源文件的存放路径, 如果你使用的是 vue-cli 生成的项目, 通常不需要设置该选项, vue-ueditor-wrap 会自动处理常见的情况, 如果需要特殊配置, 参考下方的常见问题 2
                    UEDITOR_HOME_URL: '/UEditor/'
                },
                detail: {
                    title: null,
                    amount: null,
                    username: null,
                    content: null
                },
                answers: []
            }
        },
        created() {
            this.id = this.$route.query.id;
            this.queryRewardDetail();
        },
        methods: {
            queryRewardDetail() {
                queryRewardDetail(this.id).then((response) => {
                    var detail = response.data.detail;
                    this.detail.title = detail.reward.title;
                    this.detail.amount = detail.reward.amount;
                    this.detail.content = detail.reward.content;
                    this.detail.username = detail.user.username;
                    this.answers = response.data.answers;

                })
            },
            submitAnswer() {
                var ueditorInstance = this.getContent();
                var params = {content: ueditorInstance.getContent(), rewardId: this.id};
                saveAnswer(params).then((response) => {
                    // alert(response.code)
                    if (response.code == 200) {
                        alert('提交成功!');
                        this.$router.go(0);
                    }
                    // if (typeof response == 'string') {
                    //     var json = JSON.parse(response);
                    //     if (json.code == '200') {
                    //         alert('提交成功!')
                    //     }
                    // }
                })
            }
        },
        components: {
        }
    }
</script>

<style scoped>
    .reward_title {
        float: left;
        /*border: 1px solid blue;*/
        width: 60%;
        font-size: 20px;
    }

    .editor {
        height: 200px;
        width: 100%;
        margin-top: 30px;
    }
    .editor-container {
        margin-top: 30px;
    }
</style>
