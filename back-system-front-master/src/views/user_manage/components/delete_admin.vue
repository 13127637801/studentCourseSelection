<template>
	<el-dialog v-model="dialogFormVisible" title='删除操作' width="30%" center>
		<span v-if="adminId">是否删除此用户？</span>
		<span v-else>请慎重操作，删除后此用户将永久失去登录资格</span>
		<template #footer>
			<span class="dialog-footer">
				<el-button type="primary" @click="deleteAdmin">
					确定
				</el-button>
			</span>
		</template>
	</el-dialog>
</template>

<script lang="ts" setup>
	import { onBeforeUnmount, ref } from 'vue'
	import {
		bus
	} from "@/utils/mitt.js"
	import {
		changeIdentityToUser, deleteUser
	} from '@/api/userinfor.js'
	import { ElMessage } from 'element-plus'
	import { tracking } from '@/utils/operation.js'
	const adminId = ref()
	const userid = ref()
	const account = ref()
	const name = ref()
	bus.on('deleteId', (id : number) => {
		adminId.value = id
	})
	bus.on('deleteUserId', (userInfo : any) => {
		userid.value = userInfo.id
		account.value = userInfo.account
		name.value = userInfo.name
	})
	// const emit = defineEmits(['success'])

	const deleteAdmin = async () => {
		if (adminId.value) {
			const res = await changeIdentityToUser(adminId.value)
			if (res.status == 0) {
				ElMessage({
					message: '删除用户成功',
					type: 'success',
				})
				// emit('success')
				bus.emit('adminDialogOff', 3)
				dialogFormVisible.value = false
			} else {
				ElMessage.error('对管理员降职失败')
				dialogFormVisible.value = false
			}
		}
		if (userid.value) {
			const res = await deleteUser(userid.value, account.value)
			if (res.status == 0) {
				ElMessage({
					message: '删除用户成功',
					type: 'success',
				})
				tracking('管理员',localStorage.getItem('name'),name.value,'高级')
				// 假设用户第二页 我们的用户为第一条数据 删除之后 页面变为第一页
				// 假设用户第二页 我们的用户不为第一条数据 删除之后 页面依然为第二页
				dialogFormVisible.value = false
				bus.emit('offDialog', 1)
			} else {
				ElMessage.error('删除用户失败')
				dialogFormVisible.value = false
			}
		}

	}

	// 弹窗开关
	const dialogFormVisible = ref(false)

	// 打开编辑管理员的弹窗
	const open = () => {
		dialogFormVisible.value = true
	}

	defineExpose({
		open
	})

	onBeforeUnmount(() => {
		bus.all.clear()
	})
</script>

<style lang="scss" scoped>

</style>