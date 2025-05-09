<template>
	<el-dialog v-model="state.dialogFormVisible" :title="title" width="800px" destroy-on-close center>
		<el-container>
			<el-main>
				<div class="content" v-html="valueHtml"></div>
			</el-main>
		</el-container>
	</el-dialog>
</template>
<script lang="ts" setup>
	import {
		onBeforeUnmount, ref, reactive
	} from 'vue'
	import { bus } from "@/utils/mitt.js"
	import { getCompanyIntroduce } from '@/api/setting'
	const title = ref()
	const valueHtml = ref()
	bus.on("introduce", async (id : number) => {
		if (id == 1) {
			title.value = '学校介绍'
			valueHtml.value = '苏州科技大学坐落于素有“人间天堂”之称的历史文化名城苏州，由原苏州城建环保学院与原苏州铁道师范学院合并而成，是一所以工为主、工理文管艺多学科协调发展的全日制普通高校，是住房和城乡建设部与江苏省共建高校、教育部本科教学工作水平评估优秀高校、博士学位授予单位。'
		}
		if (id == 2) {
			title.value = '公司架构'
			valueHtml.value = await getCompanyIntroduce('学校架构')
		}
		if (id == 3) {
			title.value = '公司战略'
			valueHtml.value = await getCompanyIntroduce('学校战略')
		}
		if (id == 4) {
			title.value = '公司高层'
			valueHtml.value = await getCompanyIntroduce('学校高层')
		}
	})
	const state = reactive({
		dialogFormVisible: false,
	});

	// 暴露open方法
	const open = () => {
		state.dialogFormVisible = true;
	};
	defineExpose({
		open,
	});

	// 取消订阅/监听
	onBeforeUnmount(() => {
		bus.all.clear()
	})
</script>

<style lang="scss" scoped>
	.content {
		text-align: center;
	}
	
	:deep(.el-main){
		min-height: 500px;
	}
</style>