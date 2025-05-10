// 导入数据库操作模块
const db = require('../db/index')

// 创建课程
exports.createCourse = (req, res) => {
	const {
		course_id,
		course_name,
		course_type,
		course_desc,
        teacher,
	} = req.body
	const course_create_time = new Date()
	
	const sql0 = 'select * from course where course_id = ?'
	db.query(sql0, course_id, (err, results) => {
		if (results.length > 0) {
			res.send({
				status: 1,
				message: '课程编号已存在'
			})
		}
		const sql = 'insert into course set ?'
		db.query(sql, {
			course_id,
            course_name,
            course_type,
            course_desc,
            teacher,
            course_create_time
		}, (err, result) => {
			if (err) return res.cc(err)
			res.send({
				status: 0,
				message: '新增课程成功'
			})
		})
	})

}

// 删除课程
exports.deleteCourse = (req, res) => {
	const sql = 'delete from course where id = ?'
	db.query(sql, req.body.id, (err, result) => {
		if (err) return res.cc(err)
		res.send({
			status: 0,
			message: '删除课程成功'
		})
	})
}


// 编辑课程信息
exports.editCourse = (req, res) => {
	const {
        course_name,
        course_type,
        course_desc,
        teacher,
		id
	} = req.body
	const course_update_time = new Date()
	
	const sql =
		'update course set course_name = ?,course_type = ?,course_desc = ?,teacher = ?,course_update_time = ? where id = ?'
	db.query(sql, [
        course_name,
        course_type,
        course_desc,
        teacher,
		course_update_time,
		id
	], (err, result) => {
		if (err) return res.cc(err)
		res.send({
			status: 0,
			message: '编辑产品信息成功'
		})
	})
}

// 获取课程列表
exports.getCourseList = (req, res) => {
	const sql = 'select * from course'
	db.query(sql, (err, result) => {
		if (err) return res.cc(err)
		res.send(result)
	})
}

// 选择课程
exports.applyCourse = (req, res) => {
	const {
        course_id,
		course_name,
        course_type,
        course_desc,
        teacher,
	} = req.body
	const course_apply_time = new Date()
	
	const sql0 = 'select * from mycourse where course_id = ?'
	db.query(sql0, course_id, (err, result) => {
		if (result.length > 0) {
			res.send({
				status: 1,
				message: '课程编号已存在'
			})
		}else{
			const sql =
				'insert into mycourse set ?'
			db.query(sql, [
                course_id,
				course_name,
                course_type,
                course_desc,
                teacher,
                course_apply_time
			], (err, result) => {
				if (err) return res.cc(err)
				res.send({
					status: 0,
					message: '选择课程成功'
				})
			})
		}
	})
}

// 已选择课程列表
exports.getMyCourseList = (req, res) => {
	const sql = 'select * from mycourse'
	db.query(sql, (err, result) => {
		if (err) return res.cc(err)
		res.send(result)
	})
}

// 监听换页返回数据  课程页面
// limit 10 为我们要拿到数据 offset 我们跳过多少条数据
exports.returnCourseListData = (req, res) => {
	const number = (req.body.pager - 1) * 10
	const sql =
		`select * from course where ORDER BY course_create_time limit 10 offset ${number} `
	db.query(sql, (err, result) => {
		if (err) return res.cc(err)
		res.send(result)
	})
}


// 监听换页返回数据  已选择课程页面
// limit 10 为我们要拿到数据 offset 我们跳过多少条数据
exports.returnMyCourseListData = (req, res) => {
	const number = (req.body.pager - 1) * 10
	const sql = `select * from mycourse ORDER BY limit 10 offset ${number} `
	db.query(sql, (err, result) => {
		if (err) return res.cc(err)
		res.send(result)
	})
}

