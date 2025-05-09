import {
	// 创建路由的api
	createRouter,
	// 创建路由的历史模式
	createWebHashHistory
} from 'vue-router'

const routes = [{
		path: '/',
		redirect: '/login'
	},
	{
		name: 'login',
		path: '/login',
		component: () => import('@/views/login/index.vue')
	},
	{
		name: 'menu',
		path: '/menu',
		component: () => import('@/views/menu/index.vue'),
		children: [{
				name: 'home',
				path: '/home',
				component: () => import('@/views/home/index.vue')
			},
			{
				name: 'set',
				path: '/set',
				component: () => import('@/views/set/index.vue')
			},
			{
				name: 'overview',
				path: '/overview',
				component: () => import('@/views/overview/index.vue')
			},
			{
				name: 'admin_manage',
				path: '/admin_manage',
				component: () => import('@/views/user_manage/admin_manage/index.vue')
			},
			{
				name: 'student_manage',
				path: '/student_manage',
				component: () => import('@/views/user_manage/student_manage/index.vue')
			},
			{
				name: 'teacher_manage',
				path: '/teacher_manage',
				component: () => import('@/views/user_manage/user_manage/index.vue')
			},
			{
				name: 'user_list',
				path: '/user_list',
				component: () => import('@/views/user_manage/user_list/index.vue')
			},
			{
				name: 'product_manage_list',
				path: '/product_manage_list',
				component: () => import('@/views/product/product_manage_list/index.vue')
			},
			{
				name: 'out_product_manage_list',
				path: '/out_product_manage_list',
				component: () => import('@/views/product/out_product_manage_list/index.vue')
			},
			{
				name: 'message_list',
				path: '/message_list',
				component: () => import('@/views/message/message_list/index.vue')
			},
			{
				name: 'recycle',
				path: '/recycle',
				component: () => import('@/views/message/recycle/index.vue')
			},
			{
				name: 'file',
				path: '/file',
				component: () => import('@/views/file/index.vue')
			},
			{
				name: 'operation_log',
				path: '/operation_log',
				component: () => import('@/views/operation_log/index.vue')
			},
			{
				name: 'login_log',
				path: '/login_log',
				component: () => import('@/views/login_log/index.vue')
			},
		]
	},
]

const router = createRouter({
	history: createWebHashHistory(),
	routes
})

export default router