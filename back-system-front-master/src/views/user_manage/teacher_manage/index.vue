<template>
	<breadCrumb ref="breadcrumb" :item='item'></breadCrumb>
	<div class="table-wrapped">
		<!-- 顶部 -->
		<div class="table-top">
			<!-- 表格顶部 -->
			<div class="table-header">
				<!-- 搜索框 -->
				<div class="search-wrapped">
					<el-input v-model="adminAccount" class="w-50 m-2" size="large" placeholder="输入账号进行搜索"
						:prefix-icon="Search" @change='searchAdmin()' />
				</div>
				<div class="button-wrapped">
					<el-button  v-if="role === 'admin' || role === 'teacher'" type="primary" @click="openCreate(2)">添加教师</el-button>
				</div>
			</div>
			<!-- 表格内容 -->
			<div class="table-content">
				<el-table :data="tableData" style="width: 100%" border>
					<el-table-column type="index" width="50" />
					<el-table-column prop="account" label="账号" />
					<el-table-column prop="name" label="姓名" />
					<el-table-column prop="department" label="院系" />
					<el-table-column prop="email" label="邮箱" />
					<el-table-column label="操作">
						<template #default="{row}" v-if="role === 'admin' || role === 'teacher'">
							<div>
								<el-button type="success" @click="openEdit(row.id)">编辑</el-button>
								<el-button type="danger" @click="openDelete(row.id)">删除</el-button>
							</div>
						</template>
					</el-table-column>
				</el-table>
			</div>
		</div>
		<!-- 底部 -->
		<div class="table-footer">
			<el-pagination :page-size="1" :current-page="paginationData.currentPage" :pager-count="7"
				:total="adminTotal" :page-count="paginationData.pageCount" @current-change="currentChange"
				layout="prev, pager, next" />
		</div>
	</div>
	<createA ref="Create"></createA>
	<editA ref='Edit'></editA>
	<deleteA ref="Delete"></deleteA>
</template>

<script lang="ts" setup>
	import {
		ref, reactive,onBeforeUnmount
	} from 'vue'
	import { Search } from '@element-plus/icons-vue'
	import breadCrumb from '@/components/bread_crumb.vue'
	import createA from '../components/create_admin.vue'
	import editA from '../components/edit_admin.vue'
	import deleteA from '../components/delete_admin.vue'
	import { searchUser, getAdminListLength, returnListData } from '@/api/userinfor.js'
	import {
		bus
	} from "@/utils/mitt.js"
	// 面包屑
	const breadcrumb = ref()
	// 面包屑参数
	const item = ref({
		first: '用户管理',
		second:'教师'
	})
	const adminAccount = ref('')
	const role = localStorage.getItem('role')

	// 表格内容
	const tableData = ref()
	// 搜索函数
	const searchAdmin = async () => {
		tableData.value = await searchUser(adminAccount.value,'教师')
	}
	// 分页数据
	const paginationData = reactive({
		// 总页数
		pageCount: 1,
		// 当前所处页数
		currentPage: 1,
	})
	const adminTotal = ref<number>(0)
	// 获取管理员的数量
	const returnAdminListLength = async () => {
		const res = await getAdminListLength('教师')
		adminTotal.value = res.length
		paginationData.pageCount = Math.ceil(res.length / 10)
	}
	returnAdminListLength()
	// 默认获取第一页的数据据
	const getFirstPageList = async () => {
		tableData.value = await returnListData(1, '教师')
	}
	getFirstPageList()
	// 监听换页
	const currentChange = async (value : number) => {
		paginationData.currentPage = value
		tableData.value = await returnListData(paginationData.currentPage, '教师')
	}

	bus.on('adminDialogOff', async (id : number) => {
		// 当前页数
		const current = paginationData.currentPage
		// 1为创建管理员
		if (id == 1) {
			getFirstPageList()
		}
		// 2为编辑管理员
		if (id == 2) {
			tableData.value = await returnListData(paginationData.currentPage, '教师')
		}
		// 3为对管理员进行降职
		if (id == 3) {
			tableData.value = await returnListData(paginationData.currentPage, '教师')
			if (tableData.value.length == 0) {
				paginationData.currentPage = current - 1
				returnAdminListLength()
			}
		}
	})
	// 新建管理员
	const Create = ref()
	const openCreate = (id : number) => {
		bus.emit('createId', id)
		Create.value.open()
	}

	// 编辑管理员
	const Edit = ref()
	const openEdit = (id : number) => {
		bus.emit('editId', id)
		Edit.value.open()
	}
	// 降级管理员
	const Delete = ref()
	const openDelete = (id : number) => {
		bus.emit('deleteId', id)
		Delete.value.open()
	}
	
	onBeforeUnmount(() => {
		bus.all.clear()
	})
</script>

<style lang='scss' scoped>
</style>