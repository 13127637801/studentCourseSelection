// 课程管理模块
// 引入express
const express = require('express')
// 使用express框架的路由
const router = express.Router()
// 导入user路由处理模块
const courseHandler = require('../router_handle/course')

// 创建课程
router.post('/createCourse', courseHandler.createCourse)
// 删除课程
router.post('/deleteCourse', courseHandler.deleteCourse)
// 编辑课程
router.post('/editCourse', courseHandler.editCourse)
// 获取课程列表
router.post('/getCourseList', courseHandler.getCourseList)
// 选择课程
router.post('/applyCourse', courseHandler.applyCourse)

// 已选课程列表
router.post('/getMyCourseList', courseHandler.getMyCourseList)

// 监听换页返回数据  课程页面
router.post('/returnCourseListData', courseHandler.returnCourseListData)
// 监听换页返回数据  已选择课程页面
router.post('/returnMyCourseListData', courseHandler.returnMyCourseListData)

module.exports = router