<template>
	<breadCrumb ref="breadcrumb" :item='item'></breadCrumb>
	<!-- wrapper -->
	<div class="module-common-wrapped">
		<div class="module-common-content">
			<el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">
				<el-tab-pane label="产品列表" name="first">
					<div class="pane-content">
						<div class="pane-top">
							<div class="module-common-header">
								<div class="search-wrapped">
									<el-input v-model="productId" class="w-50 m-2" size="large" placeholder="输入入库编号进行搜索"
										:prefix-icon="Search" @change="searchProduct()" clearable
										@clear="getProductFirstPageList" />
								</div>
								<div class="button-wrapped">
									<el-button type="primary" @click="productInWarehouse">新增产品</el-button>
								</div>
							</div>
							<!-- 表格部分 -->
							<div class="module-common-table">
								<el-table :data="tableData" border style="width: 100%">
									<el-table-column type="index" width="50"></el-table-column>
									<el-table-column prop="product_id" label="入库编号" width="200" />
									<el-table-column prop="product_name" label="产品名称" width="160" />
									<el-table-column prop="product_category" label="产品类别" width="100" />
									<el-table-column prop="product_unit" label="单位" />
									<el-table-column prop="product_in_warehouse_number" label="库存数量" width="100" />
									<el-table-column prop="product_single_price" label="产品单价" width="150" />
									<el-table-column prop="product_all_price" label="库存总价" width="100" />
									<el-table-column prop="product_status" label="库存状态" width="100">
										<template #default="{row}">
											<el-tag class="ml-2" type="success"
												v-if="row.product_in_warehouse_number<100">库存较少</el-tag>
											<el-tag class="ml-2" type="success"
												v-else-if="row.product_in_warehouse_number>100&&row.product_in_warehouse_number<300">库存正常</el-tag>
											<el-tag class="ml-2" type="success"
												v-else-if="row.product_in_warehouse_number>300">库存过剩</el-tag>
										</template>
									</el-table-column>
									<el-table-column prop="product_create_person" label="入库负责人" width="100" />
									<el-table-column prop="product_create_time" label="入库时间" width="200">
										<template #default="{row}">
											<div>{{row.product_create_time?.slice(0,10)}}</div>
										</template>
									</el-table-column>
									<el-table-column prop="product_update_time" label="最后修改时间" width="200">
										<template #default="{row}">
											<div>{{row.product_update_time?.slice(0,10)}}</div>
										</template>
									</el-table-column>
									<el-table-column prop="in_memo" label="入库备注" width="200" />
									<el-table-column label="操作" width="300" fixed="right">
										<template #default="{row}">
											<div>
												<el-button type="primary" @click="applyOut(row)"
													:disabled='row.product_out_status=="申请出库" || row.product_in_warehouse_number==0'>申请出库</el-button>
												<el-button type="success" @click="editProduct(row)"
													:disabled='row.product_out_status=="申请出库"'>修改</el-button>
												<el-button type="danger" @click="deleteProduct(row.id)"
													:disabled='row.product_out_status=="申请出库"'>删除</el-button>
											</div>
										</template>
									</el-table-column>
								</el-table>
							</div>
						</div>
						<div class="table-footer">
							<el-pagination :page-size="1" :current-page="paginationData.productCurrentPage"
                             :pager-count="7" :total="paginationData.productTotal"
                             :page-count="paginationData.productPageCount" @current-change="ProductCurrentChange"
                             layout="prev, pager, next" />
						</div>
					</div>
				</el-tab-pane>
				<el-tab-pane label="审核列表" name="second">
					<div class="pane-content">
						<div class="pane-top">
							<div class="module-common-header">
								<div class="search-wrapped">
									<el-input v-model="productOutId" class="w-50 m-2" size="large" clearable
										placeholder="输入入库编号进行搜索" :prefix-icon="Search" @change="searchApplyProduct()"
										@clear="getApplyProductFirstPageList" />
								</div>
								<div class="button-wrapped">
								</div>
							</div>
							<!-- 表格部分 -->
							<div class="module-common-table">
								<el-table :data="applyTableData" border style="width: 100%">
									<el-table-column type="index" width="50"></el-table-column>
									<el-table-column prop="product_out_id" label="申请出库编号" width="200" />
									<el-table-column prop="product_name" label="产品名称" width="200" />
									<el-table-column prop="product_out_number" label="申请出库数量" width="180" />
									<el-table-column prop="product_out_price" label="申请出库总价" width="180" />
									<el-table-column prop="product_out_apply_person" label="申请人" width="100" />
									<el-table-column prop="product_apply_time" label="申请出库时间" width="180">
										<template #default="{row}">
											<div>{{row.product_apply_time?.slice(0,10)}}</div>
										</template>
									</el-table-column>
									<el-table-column prop="product_out_audit_person" label="审核人" width="150" />
									<el-table-column prop="product_audit_time" label="审核时间" width="180">
										<template #default="{row}">
											<div>{{row.product_audit_time?.slice(0,10)}}</div>
										</template>
									</el-table-column>
									<el-table-column prop="product_out_status" label="审核状态" width="100" />
									<el-table-column prop="apply_memo" label="申请出库备注" width="200" />
									<el-table-column prop="audit_memo" label="审核备注" width="200" />
									<el-table-column label="操作" width="300" fixed="right">
										<template #default="{row}">
											<div>
												<el-button type="primary"
													@click="withdrawProduct(row.id)">撤回申请</el-button>
												<el-button type="success" :disabled='row.product_out_status=="申请出库"'
													@click="againApply(row)">再次申请</el-button>
												<el-button type="danger" @click="auditProduct(row)">审核</el-button>
											</div>
										</template>
									</el-table-column>
								</el-table>
							</div>
						</div>
						<div class="table-footer">
							<el-pagination :page-size="1" :current-page="paginationData.applyProductCurrentPage"
                             :pager-count="7" :total="paginationData.applyProductTotal"
                             :page-count="paginationData.applyProductCount"
                             @current-change="applyProductCurrentChange" layout="prev, pager, next" />
						</div>
					</div>
				</el-tab-pane>
			</el-tabs>
		</div>
	</div>
	<!-- 入库操作影响产品列表 -->
	<warehousing  ref="in_warehouse" @success='getProductFirstPageList'></warehousing>
	<!-- 申请操作影响审核列表 -->
	<apply ref="apply_product" @success='changeTwoPageList'></apply>
	<!-- 编辑操作影响产品列表 -->
	<edit ref="edit_product" @success='getProductFirstPageList'></edit>
	<!-- 删除操作影响产品列表 -->
	<deleteP ref="delete_product" @success='getProductFirstPageList'></deleteP>
	<!-- 审核操作影响产品列表、审核列表 -->
	<audit ref="audit_product" @success='changeTwoPageList'></audit>
	<!-- 撤回操作影响产品列表、审核列表 -->
	<withdraw ref="withdraw_product" @success='changeTwoPageList'></withdraw>
	<!-- 再次申请操作影响审核列表 -->
	<again ref="again_product" @success='getApplyProductFirstPageList'></again>
</template>

<script lang='ts' setup>
	import {
		ref,
		reactive,
	} from 'vue'
	import breadCrumb from '@/components/bread_crumb.vue'
	import warehousing  from '../components/product_in_warehouse.vue'
	import apply from '../components/apply.vue'
	import edit from '../components/edit_product.vue'
	import deleteP from '../components/delete_product.vue'
	import audit from '../components/audit.vue'
	import withdraw from '../components/withdraw.vue'
	import again from '../components/again_apply.vue'
	import {
		searchProductForId,
		searchProductForApplyId,
		getProductLength,
		getApplyProductLength,
		returnProductListData,
		returnApplyProductListData,
	} from '@/api/product.js'
	import {
		bus
	} from "@/utils/mitt.js"
	import {
		Search
	} from '@element-plus/icons-vue'
	import type {
		TabsPaneContext
	} from 'element-plus'
	// 面包屑
	const breadcrumb = ref()
	// 面包屑参数
	const item = ref({
		first: '产品管理',
		second: '产品列表'
	})
	const handleClick = (tab: TabsPaneContext) => {
		if (tab.props.label == '产品列表') {
			getProductFirstPageList()
		}
		if (tab.props.label == '审核列表') {
			getApplyProductFirstPageList()
		}
	}

	const activeName = ref('first')

	// 产品入库编号
	const productId = ref < number > ()
	// 产品申请出库编号
	const productOutId = ref < number > ()
	// 产品表格
	const tableData = ref([])
	// 产品申请出库表格
	const applyTableData = ref([])

	// 分页数据
	const paginationData = reactive({
		// 产品总数
		productTotal: 0,
		// 产品列表总页数
		productPageCount: 0,
		// 产品列表当前所处页数
		productCurrentPage: 1,
		// 申请的总数
		applyProductTotal: 0,
		// 申请列表总页数
		applyProductCount: 0,
		// 申请列表当前所处页数
		applyProductCurrentPage: 1,
	})
	
	
	// 获取产品列表的页数
	const getProductListLength = async () => {
		const res = await getProductLength()
		paginationData.productTotal = res.length
		paginationData.productPageCount = Math.ceil(res.length / 10)
	}
	getProductListLength()
	// 获取审核列表的页数
	const getApplyProductListLength = async () => {
		const res = await getApplyProductLength()
		paginationData.applyProductTotal = res.length
		paginationData.applyProductCount = Math.ceil(res.length / 10)
	}
	getApplyProductListLength()
	// 默认获取产品列表第一页的数据
	const getProductFirstPageList = async () => {
		tableData.value = await returnProductListData(1)
	}
	getProductFirstPageList()
	// 默认获取审核列表第一页的数据
	const getApplyProductFirstPageList = async () => {
		applyTableData.value = await returnApplyProductListData(1)
	}
	getApplyProductFirstPageList()

	// 更新产品列表及审核列表的第一页数据
	const changeTwoPageList = () => {
		getProductFirstPageList()
		getApplyProductFirstPageList()
	}

	// 产品列表监听换页
	const ProductCurrentChange = async (value: number) => {
		paginationData.productCurrentPage = value
		tableData.value = await returnProductListData(paginationData.productCurrentPage)
	}

	// 申请列表监听换页
	const applyProductCurrentChange = async (value: number) => {
		paginationData.applyProductCurrentPage = value
		tableData.value = await returnApplyProductListData(paginationData.applyProductCurrentPage)
	}

	// 通过产品入库ID去搜索
	const searchProduct = async () => {
		tableData.value = await searchProductForId(productId.value)
	}
	// 通过产品申请出库ID去搜索
	const searchApplyProduct = async () => {
		tableData.value = await searchProductForApplyId(productId.value)
	}

	// 打开产品入库
	const in_warehouse  = ref()
	const productInWarehouse = () => {
    in_warehouse .value.open()
	}

	// 产品申请出库
	const apply_product  = ref()
	const applyOut = (row: any) => {
		bus.emit('applyId', row)
    apply_product .value.open()
	}

	// 编辑产品信息
	const edit_product  = ref()
	const editProduct = (row: any) => {
		bus.emit('editProductId', row)
    edit_product .value.open()
	}

	// 删除产品
	const delete_product  = ref()
	const deleteProduct = (id: number) => {
		bus.emit('deleteProductId', id)
    delete_product .value.open()
	}

	// 审核产品
	const audit_product  = ref()
	const auditProduct = (row: any) => {
		bus.emit('applyProductInfo', row)
    audit_product .value.open()
	}

	// 撤回产品申请
	const withdraw_product = ref()
	const withdrawProduct = (id: number) => {
		bus.emit('withdrawId', id)
    withdraw_product.value.open()
	}

	// 再次申请产品出库
	const again_product  = ref()
	const againApply = (row: any) => {
		bus.emit('againId', row)
    again_product .value.open()
	}
</script>

<style lang="scss" scoped>
	:deep(.el-table .cell) {
		font-weight: 400;
	}
</style>