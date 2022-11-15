<template>
    <div style="width: 500px; height: auto; margin-top:50px; margin-left: 50px;">
        <el-form ref="form" :model="form" label-width="80px">
            <el-form-item label="悬赏标题">
                <el-input v-model="form.title"></el-input>
            </el-form-item>
            <el-form-item label="赏金">
                <el-input-number v-model="form.amount" @change="handleChange" :min="1" label="请输入赏金金额"></el-input-number>
            </el-form-item>
<!--            <el-form-item label="活动区域">-->
<!--                <el-select v-model="form.region" placeholder="请选择活动区域">-->
<!--                    <el-option label="区域一" value="shanghai"></el-option>-->
<!--                    <el-option label="区域二" value="beijing"></el-option>-->
<!--                </el-select>-->
<!--            </el-form-item>-->
            <el-form-item label="截止时间">
                <el-col :span="11">
                    <el-date-picker type="datetime" placeholder="选择日期" v-model="form.endTime" style="width: 100%;"></el-date-picker>
                </el-col>
<!--                <el-col class="line" :span="2">-</el-col>-->
<!--                <el-col :span="11">-->
<!--                    <el-time-picker placeholder="选择时间" v-model="form.date2" style="width: 100%;"></el-time-picker>-->
<!--                </el-col>-->
            </el-form-item>
<!--            <el-form-item label="即时配送">-->
<!--                <el-switch v-model="form.delivery"></el-switch>-->
<!--            </el-form-item>-->
            <el-form-item label="悬赏内容" style="height: auto;">
                <div ref="editorContainer" class="editor"></div>
            </el-form-item>
            <el-form-item label="附件上传">
                <el-upload
                        class="upload-demo"
                        drag
                        action="http://localhost:8081/bs/upload/uploadFile"
                        :on-success="(response, file, fileList) => {uploadSuccess(response, fileList, row)}"
                        multiple>
<!--                    <i class="el-icon-upload"></i>-->
                    <el-icon><Upload /></el-icon>
                    <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
                    <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过500kb</div>
                </el-upload>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="saveDraft">保存草稿</el-button>
                <el-button type="primary" @click="onSubmit">发布</el-button>
                <el-button @click="cancel">取消</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
    import {loadJsResource} from '@/utils/ueditor';
    import { ref, onMounted }  from 'vue';
    import {publish, saveDraft} from '../api/reward/reward'
    import {Upload} from "@element-plus/icons";

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
                uploadUrl: null,
                uploadedList: [],
                fileList: null,
                form: {
                    title: '',
                    amount: null,
                    endTime: null
                },
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
                }
            }
        },
        methods: {
            onSubmit() {
                var ueditorInstance = this.getContent();
                var content = ueditorInstance.getContent();
                var params = {title: this.form.title, amount: this.form.amount,
                    endTime: this.form.endTime, content: content, attachList: this.uploadedList};
                publish(params).then(response => {
                    if (response.code == 111) {
                        alert('标题涉及敏感信息，不能发布!');
                    } else {
                        this.form.title = null;
                        this.form.amount = null;
                        this.form.endTime = null;
                        ueditorInstance.setContent('');
                        this.fileList = [];
                        alert('发布成功')
                    }
                })
            },
            saveDraft() {
                var ueditorInstance = this.getContent();
                var content = ueditorInstance.getContent();
                var params = {title: this.form.title, amount: this.form.amount, endTime: this.form.endTime, content: content};
                saveDraft(params).then(response => {
                    if (response.code == 111) {
                        alert('标题涉及敏感信息，不能发布!');
                    } else {
                        this.form.title = null;
                        this.form.amount = null;
                        this.form.endTime = null;
                        ueditorInstance.setContent('');
                        alert('保存成功')
                    }
                })
            },
            cancel() {
                this.$router.go(-1);
            },
            uploadSuccess(response, fileList, row) {
                console.log(response)
                this.fileList = fileList;
                response.data.forEach(it => {
                    var item = {fileExt: it.fileExt, fileName: it.fileName, fileSize: it.fileSize, fileUrl: it.fileUrl};
                    this.uploadedList.push(item);
                })
            }
        },
        components: {


        }
    }
</script>

<style scoped>
    .editor {
        /*height: 200px;*/
        width: 100%;
        margin-top: 30px;
    }
</style>
