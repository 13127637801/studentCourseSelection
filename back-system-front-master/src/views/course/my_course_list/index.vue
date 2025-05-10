<template>
    <breadCrumb ref="breadcrumb" :item='item'></breadCrumb>
    <div class="module-common-wrapped">
        <el-table :data="tableData" style="width: 100%">
            <el-table-column prop="course_id" label="课程编号" width="180" />
            <el-table-column prop="course_name" label="课程名称" width="180" />
            <el-table-column prop="course_type" label="课程类型" width="180" />
            <el-table-column prop="course_desc" label="课程简介" />
            <el-table-column prop="teacher" label="授课老师" />
        </el-table>
    </div>
</template>

<script lang='ts' setup>
    import {
        ref,
        reactive,
    } from 'vue'
    import breadCrumb from '@/components/bread_crumb.vue'
    import {
		getMyCourseList,
	} from '@/api/course.js'
    
   // 面包屑
    const breadcrumb = ref()
    // 面包屑参数
    const item = ref({
        first: '课程管理',
        second: '课程列表'
    })

    const tableData = ref([])

    const getList = async () => {
      const res = await getMyCourseList()
      tableData.value = res ?? []
    }

    getList()

</script>

<style lang="scss" scoped>
    
</style>