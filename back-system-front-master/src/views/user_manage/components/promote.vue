<template>
	<el-dialog v-model="dialogPromoteVisible" title="赋权操作" center width="30%">
		<el-radio-group v-model="radio" class="ml-4">
			<el-radio label="管理员" size="large">管理员</el-radio>
			<el-radio label="教师" size="large">教师</el-radio>
			<el-radio label="学生" size="large">学生</el-radio>
		</el-radio-group>
		<template #footer>
			<span class="dialog-footer">
				<el-button type="primary" @click="yes">
					确定
				</el-button>
			</span>
		</template>
	</el-dialog>
</template>

<script lang="ts" setup>
	import { ref } from 'vue'
	import {
		bus
	} from "@/utils/mitt.js"
	import { changeIdentityToAdmin } from '@/api/userinfor.js'
	import { ElMessage } from 'element-plus'
	const userid = ref()
	bus.on('promoteId', (id : number) => {
		userid.value = id
	})
	const radio = ref()

	const yes = async () =>{
		const res = await changeIdentityToAdmin(userid.value,radio.value)
		if (res.status == 0) {
			ElMessage({
				message: '赋权管理员成功',
				type: 'success',
			})
			bus.emit('offDialog',1)
			dialogPromoteVisible.value = false
		} else {
			ElMessage.error('赋权管理员失败')
			dialogPromoteVisible.value = false
		}
	}
	
	// 弹窗开关
	const dialogPromoteVisible = ref(false)

	// 打开编辑管理员的弹窗
	const open = () => {
		dialogPromoteVisible.value = true
	}

	defineExpose({
		open
	})
</script>

<style lang="scss" scoped>
	.el-radio-group {
		display: flex;
		justify-content: center;
	}
</style>