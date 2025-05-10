import instance from '@/http/index.js'

// 创建课程
export const createCourse = data => {
    const {
        course_id,
		course_name,
		course_type,
		course_desc,
        teacher,
    } = data
    return instance({
        url: '/cus/createCourse',
        method: 'POST',
        data: {
            course_id,
            course_name,
            course_type,
            course_desc,
            teacher,
        }
    })
}

// 删除课程
export const deleteCourse = id => {
    return instance({
        url: '/cus/deleteCourse',
        method: 'POST',
        data: {
            id
        }
    })
}

// 编辑课程
export const editCourse = data => {
    const {
        id,
        course_name,
        course_type,
        course_desc,
        teacher,
    } = data
    return instance({
        url: '/cus/editCourse',
        method: 'POST',
        data: {
            id,
            course_name,
            course_type,
            course_desc,
            teacher,
        }
    })
}

// 获取课程列表 getCourseList
export const getCourseList = () => {
    return instance({
        url: '/cus/getCourseList',
        method: 'POST',
    })
}

// 课程选择
export const applyCourse = data => {
    const {
        id,
        course_id,
		course_name,
        course_type,
        course_desc,
        teacher,
    } = data
    return instance({
        url: '/cus/applyCourse',
        method: 'POST',
        data: {
            id,
            course_id,
            course_name,
            course_type,
            course_desc,
            teacher,
        }
    })
}




// 获取我的课程列表
export const getMyCourseList = () => {
    return instance({
        url: '/cus/getMyCourseList',
        method: 'POST',
    })
}



// 监听换页返回数据  产品页面
export const returnCourseListData = pager => {
    return instance({
        url: '/cus/returnCourseListData',
        method: 'POST',
        data: {
            pager
        }
    })
}



// 监听换页返回数据  出库页面
export const returnMyCourseListData = pager => {
    return instance({
        url: '/cus/returnMyCourseListData',
        method: 'POST',
        data: {
            pager
        }
    })
}
