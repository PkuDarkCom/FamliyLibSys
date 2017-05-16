<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta id="viewport" content="width=device-width, initial-scale=1.0" />
	<meta id="description" content="Xenon Boostrap Admin Panel" />
	<meta id="author" content="" />

	<title>新增家庭图书</title>

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

</head>
<body class="page-body">
	<div class="page-container">
		<!-- 左侧菜单 -->
		<jsp:include page="sidebar.jsp">
			<jsp:param value="addBook" name="active"/>
		</jsp:include>
		<div class="main-content">
			<div class="panel panel-default panel-headerless">
				<div class="panel-body layout-variants">
					<form role="form" class="form-horizontal" id="bookInfo">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="bookTitle">书名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="bookTitle" placeholder="请输入书的标题" data-require="1">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="isbn">ISBN</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="isbn" placeholder="请输入书的ISBN" data-require="1">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="author">作者</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="author" placeholder="请输入作者" data-require="1">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="authorIntro">作者简介</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="authorIntro" rows="3" placeholder="请输入作者简介" data-require="0"></textarea>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="summary">内容简介</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="summary" rows="3" placeholder="请输入书的内容简介" data-require="0"></textarea>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="shelfNm">书架</label>
							<div class="col-sm-10">
								<select class="form-control" id="shelf-select" name="shelfNm" data-require="1">
									<option value="1">已读</option>
									<option value="2">阅读中</option>
									<option value="0">未读</option>
								</select>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="isEbook">电子书</label>
							<div class="col-sm-10">
								<select class="form-control" id="ebook-select" name="isEbook" data-require="0">
									<option value="">请选择是否电子书</option>
									<option value="1">是</option>
									<option value="0">否</option>
								</select>
								<span class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="txt-center">
				<a href="index.html" class="ml15 btn btn btn-info">返回首页</a>
				<a class="btn btn-blue" id="btnsubmit">提交</a>
			</div>
		</div>
	</div>
	<!-- Page Loading Overlay -->
	<div class="page-loading-overlay">
		<div class="loader-2"></div>
	</div>
	<!-- Imported scripts on this page -->
	
	<script src="../static/asset/js/resizeable.js"></script>
	<script src="../static/asset/js/joinable.js"></script>
	<script src="../static/asset/js/select2/select2.min.js"></script>
	<script src="../static/asset/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="../static/asset/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="../static/asset/js/multiselect/js/jquery.multi-select.js"></script>
	<script src="../static/asset/js/xenon-custom.js"></script>
	<script src="../static/js/common.js"></script>
	<script>
		$(document).ready(function ($) {
			var $bookInfo = $('#bookInfo');
			request.getShelf('请选择书架'); // 获取书架信息
			// 下拉框插件化
			var selectArray = ['ebook-select', 'shelf-select'];
			for (var i = 0; i < selectArray.length; i++) {
				$('#' + selectArray[i]).selectBoxIt({
					showFirstOption: false
				}).on('open', function () {
					$(this).data('selectBoxSelectBoxIt').list.perfectScrollbar();
				});
			};
			// 文本框失焦事件
			$bookInfo.find('[type="text"], textarea').blur(function (e) {
				var $el = $(this);
				var require = +$el.data('require');
				if (require === 1) {
					blur($el);
				}
			});
			// 下拉框
			$('select').change(function (e) {
				var $el = $(this);
				var name = $el.attr('name');
				var value = $el.val();
				$('[name="' + name + '"]').val(value);
				var require = +$el.data('require');
				if (require === 1) {
					blur($el);
				}
			});
			$('#btnsubmit').on('click', function (e) {
				var isPass = true;
				var data = {};
				$bookInfo.find('.form-control').each(function (e) {
					var $el = $(this);
					var require = +$el.data('require');
					var name = $el.attr('name');
					if (require === 1 && !validator($el)) {
						isPass = false;
					}
					else {
						!data[name] && (data[name] = $el.val());
					}
				});
				if (isPass) {
					submit(data);
				}
			});
			// 失焦事件
			function blur($el) {
				var $this = $el;
				var value = $.trim($this.val());
				var $parents = $this.parents('.form-group');
				if (!value) {
					$parents.addClass('has-error');
				}
				else {
					$parents.removeClass('has-error');
				}
			}
			// 验证表单
			function validator($el) {
				var value = $.trim($el.val());
				var isPass = false;
        		if (!value) {
	                var msg = '请输入' + $el.attr('placeholder');
	                $el.parents('.form-group').addClass('has-error')
	            }
	            else {
	                $el.parents('.form-group').removeClass('has-error')
	                isPass = true;
	            }
	            return isPass;
			}
			// 提交表单事件
			function submit(data) {
				$.ajax({
                    type: 'POST',
                    url: '/login/checkLogin', // 待修改
                    data: data,
                    dataType: 'json',
                    success: function (resp) {
                        if (+resp.code === 1) {
                            alert('新增图书成功');
                        } else {
                        	alert(resp.msg);
                        }
                    }
                });
			}
		});
	</script>

</body>
</html>