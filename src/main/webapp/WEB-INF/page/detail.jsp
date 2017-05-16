<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />

	<title>家庭图书详情</title>

	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
	<link rel="stylesheet" href="../static/asset/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="../static/asset/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../static/asset/css/bootstrap.css">
	<link rel="stylesheet" href="../static/asset/css/xenon-core.css">
	<link rel="stylesheet" href="../static/asset/css/xenon-forms.css">
	<link rel="stylesheet" href="../static/asset/css/xenon-components.css">
	<link rel="stylesheet" href="../static/asset/css/xenon-skins.css">
	<link rel="stylesheet" href="../static/asset/css/custom.css">
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="../static/asset/js/select2/select2.css">
	<link rel="stylesheet" href="../static/asset/js/select2/select2-bootstrap.css">
	<link rel="stylesheet" href="../static/asset/js/multiselect/css/multi-select.css">
	<link rel="stylesheet" href="../static/css/style.css">
	

	<script src="../static/asset/js/jquery-1.11.1.min.js"></script>
	<script src="../static/asset/js/handlebars.min.js"></script>
	<script src="/static/asset/js/bootstrap.min.js"></script>

</head>
<body class="page-body">
	<div class="page-container">
		<!-- 左侧菜单 -->
		<jsp:include page="sidebar.jsp">
			<jsp:param value="detail" name="active"/>
		</jsp:include>
		<div class="main-content">
			<!-- 在这里引入userinfo.jsp -->
			<div class="panel panel-default">
				<div class="panel highlights list-unstyled" id="detail">
				</div>
			</div>
			<div class="txt-center">
				<span class="btn btn-turquoise" id="btn-edit">编辑</span>
				<a class="btn btn-blue">开始阅读</a>
				<a href="/book/bookList" class="ml15 btn btn btn-info">返回首页</a>
		</div>
	</div>
	<!-- Page Loading Overlay -->
	<div class="page-loading-overlay">
		<div class="loader-2"></div>
	</div>
	<!-- Imported scripts on this page -->
	<script id="detailTemplate" type="text/x-handlebars-template">
		<div class="row">
			<div class="entry-img col-sm-4">
				<img src="{{image}}" />
			</div>
			<div class="entry-description col-sm-8">
				<h3>{{bookTitle}}</h3>
				<p>{{tags}}</p>
				<p>{{author}} 著；</p>
				<p>{{translator}} 译；</p>
				<p><!--编号：{{bookId}}；<span class="ml15"></span>--> ISBN：{{isbn}}；</p>
				<p>出版社： {{press}} <span class="ml15"></span>出版时间：{{pubDate}}；</p>
				<p>豆瓣评分：{{rating}}；</p>
				<p>页数：{{pages}}；</p>
				<p>售价：￥{{price}}</p>
				<p>书架：{{shelfNm}}</p>
			</div>
			<div class="col-sm-12 mt20 ">
				<h2 class="panel-heading ">作者简介：</h2>
				<p class="panel-body">{{authorIntro}}</p>
				<div class="mt20"></div>
				<h2 class="mt20 panel-heading">内容简介：</h2>
				<p class="panel-body">{{summary}}</p>
			</div>
		</div>
	</script>
	<script src="../static/asset/js/resizeable.js"></script>
	<script src="../static/asset/js/joinable.js"></script>

	<script src="../static/asset/js/select2/select2.min.js"></script>
	<script src="../static/asset/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="../static/asset/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="../static/asset/js/multiselect/js/jquery.multi-select.js"></script>

	<script src="../static/asset/js/xenon-custom.js"></script>
	<script>
		$(document).ready(function ($) {
			$.ajax({
		        url: '/book/bookDetailData',
		        method: 'get',
		        data: {
		        	bookId: location.search.split('=')[1]
		        },
		        dataType: 'json',
		        success: function (resp) {
		            if (+resp.code === 1) {
						var detailTemplate = Handlebars.compile($("#detailTemplate").html());
						$('#detail').html(detailTemplate(resp.data));
		            }
		        }
		    });
			$('.btn-edit').on('click', function () {
				location.href = '/book/modifyBookPre' + location.search;
			});
		});
	</script>

</body>
</html>