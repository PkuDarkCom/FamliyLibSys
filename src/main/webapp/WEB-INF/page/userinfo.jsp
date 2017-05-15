<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<a href="/book/bookList" class="dropdown-toggle" data-toggle="dropdown">
				<img src="/static/images/user-4.png" alt="user-image" class="img-circle img-inline userpic-32" width="28" />
				<span>
					<%=session.getAttribute("userName")%>
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