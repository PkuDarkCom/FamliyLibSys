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
		<!-- 在这里引入sidebar.jsp -->
		<div class="main-content">
			<!-- 在这里引入userinfo.jsp -->
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