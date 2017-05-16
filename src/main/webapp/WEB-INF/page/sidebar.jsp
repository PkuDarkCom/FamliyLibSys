<%@ page language="java" pageEncoding="utf-8" %>
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
			<%
				String active = request.getParameter('active');  
			%>
			<li <%if(active=='index') %>class="active"<%}%>>
				<a href="/book/bookList">
					<i class="linecons-cog"></i>
					<span class="title">首页</span>
				</a>
			</li>
			<li <%if(active=='detail' || active=='addBook' || active=='index') %>class="opened" <%}%>>
				<a href="/book/bookList">
					<i class="linecons-desktop"></i>
					<span class="title">图书管理</span>
				</a>
				<ul>
					<li <%if(active=='addBook') %>class="active"<%}%>>
						<a href="/book/addBookPre">新增图书</a>
					</li>
					<!-- <li>
						<a href="editBook.html">编辑图书</a>
					</li> -->
				</ul>
			</li>
			<li <%if(active=='shelf') %>class="active"<%}%>>
				<a href="/book/bookShelfPre">
					<i class="linecons-note"></i>
					<span class="title">书架管理</span>
				</a>
			</li>
            <li <%if(active=='statistics') %>class="active"<%}%>>
                <a href="/read/readInfoStatPage">
                    <i class="linecons-note"></i>
                    <span class="title">阅读信息统计</span>
                </a>
            </li>
		</ul>
	</div>
</div>