<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />

	<title>家庭图书管理系统</title>

	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
	<link rel="stylesheet" href="/static/asset/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="/static/asset/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/static/asset/css/bootstrap.css">
	<link rel="stylesheet" href="/static/asset/css/xenon-core.css">
	<link rel="stylesheet" href="/static/asset/css/xenon-forms.css">
	<link rel="stylesheet" href="/static/asset/css/xenon-components.css">
	<link rel="stylesheet" href="/static/asset/css/xenon-skins.css">
	<link rel="stylesheet" href="/static/asset/css/custom.css">
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="/static/asset/js/select2/select2.css">
	<link rel="stylesheet" href="/static/asset/js/select2/select2-bootstrap.css">
	<link rel="stylesheet" href="/static/asset/js/multiselect/css/multi-select.css">
	<link rel="stylesheet" href="/static/css/style.css">

	<script src="/static/asset/js/jquery-1.11.1.min.js"></script>
	<script src="/static/asset/js/handlebars.min.js"></script>
	<script src="/static/asset/js/bootstrap.min.js"></script>

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->


</head>
<body class="page-body">
	<div class="page-container">
		<!-- 左侧菜单 -->
		<div class="sidebar-menu toggle-others fixed">
			<div class="sidebar-menu-inner">
				<header class="logo-env">
		
					<!-- logo -->
					<div class="logo">
						<a href="/book/bookList" class="logo-expanded">
							家庭图书管理系统
						</a>
		
						<a href="/book/bookList" class="logo-collapsed">
							<img src="/static/images/logo-collapsed@2x.png" width="40" alt="" />
						</a>
					</div>
		
					<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
					<div class="mobile-menu-toggle visible-xs">
						<a href="#" data-toggle="user-info-menu">
							<i class="fa-bell-o"></i>
							<span class="badge badge-success">7</span>
						</a>
		
						<a href="#" data-toggle="mobile-menu">
							<i class="fa-bars"></i>
						</a>
					</div>
		
					<!-- This will open the popup with user profile settings, you can use for any purpose, just be creative -->
					<div class="settings-icon">
						<a href="#" data-toggle="settings-pane" data-animate="true">
							<i class="linecons-cog"></i>
						</a>
					</div>
				</header>
				<ul id="main-menu" class="main-menu">
					<li class="active opened">
						<a href="/book/bookList">
							<i class="linecons-cog"></i>
							<span class="title">首页</span>
						</a>
					</li>
					<li>
						<a href="myBooks.html">
							<i class="linecons-desktop"></i>
							<span class="title">图书管理</span>
						</a>
						<ul>
							<li>
								<a href="addBook.html">新增图书</a>
							</li>
							<li>
								<a href="editBook.html">编辑图书</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="index.html">
							<i class="linecons-note"></i>
							<span class="title">书架管理</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="main-content">
			<nav class="navbar user-info-navbar"  role="navigation">
				<ul class="user-info-menu left-links list-inline list-unstyled">
					<form role="form">
						<div class="form-group form-search">
							<div class="col-sm-8">
								<input type="text" class="form-control" id="searchContent" placeholder="可输入ISBN/书名/作者进行查询">
							</div>
							<div class="col-sm-3">
								<select class="ml15 form-control" id="shelf-select">
									<option value="">按书架选择</option>									
								</select>
							</div>
							<div class="col-sm-1">
								<span class="btn btn-blue" id="btnSearch">搜索</span>
							</div>
						</div>
					</form>
				</ul>
				<!-- Right links for user info navbar -->
				<ul class="user-info-menu right-links list-inline list-unstyled">
					<li class="dropdown user-profile">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img src="/static/images/user-4.png" alt="user-image" class="img-circle img-inline userpic-32" width="28" />
							<span>
								John Smith
								<i class="fa-angle-down"></i>
							</span>
						</a>
						<ul class="dropdown-menu user-profile-menu list-unstyled">
							<li class="last">
								<a href="/login/exit">
									<i class="fa-lock"></i>
									退出
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
			<!-- 图书列表 -->
			<div class="panel panel-default panel-headerless">
				<div class="panel-body layout-variants">
					<div class="row" id="bookList">

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Loading Overlay -->
	<div class="page-loading-overlay">
		<div class="loader-2"></div>
	</div>
	<!-- Handlebars.js 模板 -->
	<script id="booksTemplate" type="text/x-handlebars-template">
		{{#each data}}
			<div class="col-sm-4">
				<div class="layout-variant">
					<a href="/book/bookDetail?bid={{bookId}}">
						<div class="layout-img">
								<img src="{{image}}" />
						</div>
						<div class="layout-name">
							{{bookTitle}}
						</div>
						<ul class="layout-links">
							<li>
								作者：{{author}}
							</li>
							<li>
								简介：{{summary}}
							</li>
						</ul>
					</a>
				</div>
			</div>
			{{#ifThird @index}}
                <div class="clearfix"></div>
            {{/ifThird}}
      {{/each}}
	</script>
	<script src="/static/asset/js/TweenMax.min.js"></script>
	<script src="/static/asset/js/resizeable.js"></script>
	<script src="/static/asset/js/joinable.js"></script>
	<script src="/static/asset/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="/static/asset/js/select2/select2.min.js"></script>
	<script src="/static/asset/js/multiselect/js/jquery.multi-select.js"></script>
	<script src="/static/asset/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="/static/asset/js/xenon-custom.js"></script>
	<script src="/static/js/common.js"></script>
	<script src="/static/js/index.js"></script>
</body>
</html>