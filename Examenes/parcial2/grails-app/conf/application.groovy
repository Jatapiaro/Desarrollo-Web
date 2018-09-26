 
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.itesm.mx.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.itesm.mx.UserRole'
grails.plugin.springsecurity.authority.className = 'com.itesm.mx.Role'
authentication.signup.disabled = true
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],

	[pattern: '/equipo/create',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/equipo/edit',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/equipo/update/**',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/equipo/save/**',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/equipo/delete/**',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/equipo/index', access: ['ROLE_USER',"ROLE_ADMIN"]],
	[pattern: '/equipo/show', access: ['ROLE_USER',"ROLE_ADMIN"]],

	[pattern: '/jornada/create',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/jornada/update/**',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/jornada/save/**',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/jornada/delete/**',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/jornada/edit',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/jornada/index', access: ['ROLE_USER',"ROLE_ADMIN"]],
	[pattern: '/jornada/show', access: ['ROLE_USER',"ROLE_ADMIN"]],

	[pattern: '/partido/create',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/partido/update/**',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/partido/save/**',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/partido/edit',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/partido/delete',   	 access: ["ROLE_ADMIN"]],
	[pattern: '/partido/index', access: ['ROLE_USER',"ROLE_ADMIN"]],
	[pattern: '/partido/show', access: ['ROLE_USER',"ROLE_ADMIN"]],
	[pattern: '/user/**',   	 access: ['ROLE_ADMIN']],
	//[pattern: '**/jornadaActual',access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

