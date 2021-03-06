<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="sidebar-menu toggle-others fixed">
	<div class="sidebar-menu-inner">
		<header class="logo-env">

			<!-- logo -->
			<div class="logo">
				<a href="/book/bookList" class="logo-expanded">
					家庭图书管理系统
				</a>

				<a href="/book/bookList" class="logo-collapsed">
					<img src="../static/images/logo-collapsed@2x.png" width="40" alt="" />
				</a>
			</div>

			<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
			<div class="mobile-menu-toggle visible-xs">
				<a href="/book/bookList" data-toggle="user-info-menu">
					<i class="fa-bell-o"></i>
					<span class="badge badge-success">7</span>
				</a>

				<a href="/book/bookList" data-toggle="mobile-menu">
					<i class="fa-bars"></i>
				</a>
			</div>

			<!-- This will open the popup with user profile settings, you can use for any purpose, just be creative -->
			<div class="settings-icon">
				<a href="/book/bookList" data-toggle="settings-pane" data-animate="true">
					<i class="linecons-cog"></i>
				</a>
			</div>
		</header>
		<ul id="main-menu" class="main-menu">
			<%=request.getParameter("active")%>
			<li <c:if test="${requestScope.active=='index'}">class="active"</c:if> >
				<a href="/book/bookList">
					<i class="linecons-cog"></i>
					<span class="title">首页</span>
				</a>
			</li>
				<c:choose>
				   <c:when test="${requestScope.active=='detail' || requestScope.active=='addBook'}"> 
				   <li  class="opened"   >
				   </c:when>
				   <c:otherwise>
				   <li  class="active"  >
				   </c:otherwise>
				</c:choose>			
				<i class="linecons-desktop"></i>
				<span class="title">图书管理</span>
				<ul>
				<li <c:if test="${requestScope.active=='addBook'}">class="active"</c:if> >
						<a href="/book/addBookPre">新增图书</a>
					</li>
					<!-- <li>
						<a href="editBook.html">编辑图书</a>
					</li> -->
				</ul>
			</li>
			<li <c:if test="${requestScope.active=='shelf'}">class="active"</c:if> >
				<a href="/book/bookShelfPre">
					<i class="linecons-note"></i>
					<span class="title">书架管理</span>
				</a>
			</li>
			<li <c:if test="${requestScope.active=='statistics'}">class="active"</c:if> >
                <a href="/read/readInfoStatPage">
                    <i class="linecons-note"></i>
                    <span class="title">阅读信息统计</span>
                </a>
            </li>
		</ul>
	</div>
</div>