<template>
    <breadCrumb ref="breadcrumb" :item='item'></breadCrumb>
    <div class="module-common-wrapped">
        <div style="text-align: right;background-color: #fff;padding-top: 16px;">
            <el-button type="primary" @click="dialogFormVisible = true">新增课程</el-button>
            
        </div>
        <el-table :data="tableData" style="width: 100%">
            <el-table-column prop="course_id" label="课程编号" width="180" />
            <el-table-column prop="course_name" label="课程名称" width="180" />
            <el-table-column prop="course_type" label="课程类型" width="180">
                <template #default="scope">
                    <el-button link type="primary" size="small">
                      <el-tag v-if="scope.row.course_type === 'common'" type="primary">公共课</el-tag>
                      <el-tag v-else-if="scope.row.course_type === 'specialized'" type="success">专业课</el-tag>
                      <span v-else>-</span>
                    </el-button>
                </template>
            </el-table-column>
            <el-table-column prop="course_desc" label="课程简介" />
            <el-table-column prop="teacher" label="授课老师" />
            <el-table-column fixed="right" label="操作" min-width="120">
                <template #default="scope">
                    <el-button :disabled="!!scope.row.select_status" link type="primary" size="small" @click="handleChosen(scope.row)">
                      选择课程
                    </el-button>
                </template>
            </el-table-column>
        </el-table>


        <el-dialog v-model="dialogFormVisible" title="新增课程" width="500">
            <el-form :model="form">
            <el-form-item label="课程编号" :label-width="formLabelWidth">
                <el-input v-model="form.course_id" autocomplete="off" />
            </el-form-item>
            <el-form-item label="课程名称" :label-width="formLabelWidth">
                <el-input v-model="form.course_name" autocomplete="off" />
            </el-form-item>
            <el-form-item label="课程类型" :label-width="formLabelWidth">
                <el-select v-model="form.course_type" placeholder="请选择">
                    <el-option label="公共课" value="common" />
                    <el-option label="专业课" value="specialized" />
                </el-select>
            </el-form-item>
            <el-form-item label="课程简介" :label-width="formLabelWidth">
                <el-input v-model="form.course_desc" autocomplete="off" 
                    maxlength="100"
                    placeholder="请输入"
                    show-word-limit
                    type="textarea" 
                />
            </el-form-item>
            <el-form-item label="授课老师" :label-width="formLabelWidth">
                <el-input v-model="form.teacher" autocomplete="off" />
            </el-form-item>
            </el-form>
            <template #footer>
            <div class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取消</el-button>
                <el-button type="primary" @click="handleConfirm">
                    确认
                </el-button>
            </div>
            </template>
        </el-dialog>
    </div>
</template>

<script lang='ts' setup>
    import {
        ref,
        reactive,
    } from 'vue'
    import breadCrumb from '@/components/bread_crumb.vue'
    import {
		createCourse,
        getCourseList,
        applyCourse,
	} from '@/api/course.js'
    import { ElMessage, ElMessageBox } from 'element-plus'

   // 面包屑
    const breadcrumb = ref()
    // 面包屑参数
    const item = ref({
        first: '课程管理',
        second: '课程列表'
    })

    const dialogFormVisible = ref(false)
    const formLabelWidth = '140px'

    const form = reactive({
        course_id: '',
        course_name: '',
        course_type: '',
        course_desc: '',
        teacher: '',
    })

    const tableData = ref([])

    const getCourseInfoList = async () => {
       const res =  await getCourseList()
       tableData.value = res ?? []
       console.log(res,'=========')
    }

    getCourseInfoList()

    const handleChosen = (record) => {
        ElMessageBox.confirm(
            '确认选择该课程?',
            '提示',
                {
                confirmButtonText: '确认',
                cancelButtonText: '取消',
                type: 'warning',
                }
            )
            .then(async () => {
                try {
                    const res = await applyCourse(record)
                    console.log(res, record.course_id,'----------')
                    ElMessage({
                        type: 'success',
                        message: '操作成功',
                    }) 
                    getCourseInfoList()
                } catch (error) {
                    ElMessage({
                        type: 'error',
                        message: '操作失败',
                    })  
                }
                
            }).catch((e) => {
                console.log(e)
            })
    }

    const reset = () => {
        form.course_id =  ''
        form.course_name = ''
        form.course_type = ''
        form.course_desc = ''
        form.teacher = ''
    }

    async function handleConfirm() {
    try {
        await createCourse(form)
        ElMessage({
            message: '操作成功',
            type: 'success',
        })
        dialogFormVisible.value = false
        getCourseInfoList()
        reset()
    } catch (error) {
    }

}
</script>

<style lang="scss" scoped>
    
</style>