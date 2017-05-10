<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../include/nav.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
 $().ready(function(){
	 tradedata();
 });
 
 function tradedata(){
	 
	 var time = new Date().getTime();
	 var startTime = $("#dpd1").val();
	 var endTime = $("#dpd2").val();
	 var traderId = $("#traderId").val();
	 var symbol = $("#symbol").val();
	 
	 $.ajax({
		 type:"POST",
		 url:"/order/orderContent",
		 data:{
			 "startTime":startTime,
			 "endTime":endTime,
			 "traderId":traderId,
			 "symbol":symbol,
			 "time":time
		 },
		 dataType:"html",
		 success:function(msg){
			 $("#main").html(msg);
			 /*分页*/
			 dataTablesOpreation();
		 }
	 });
 }
 
 //根据牛人查询
 function onChangeTrader(val) {   	
    $("#traderId").val(val);
    //tradedata();	
 }
 
 function onChangeSymbol(val) {   	
    $("#symbol").val(val);
    //tradedata();	
 }

</script>
<body>
	<div class="modal-shiftfix">
	    <!-- 引入菜单页 -->
		<jsp:include page="../include/menu.jsp"></jsp:include>
		<div class="container-fluid main-content">
			<div class="page-title">
				<h1></h1>
			</div>
			<!-- DataTables Example -->
			<div class="row">
				<div class="col-lg-12">
					<div class="widget-container fluid-height clearfix">
						<div class="heading">
							<i class="icon-bar-chart"></i>牛人交易数据
						</div>
						<input id="rs" type="hidden" /><!-- 当前列表页数 -->
						<div class="row">
							<div class="col-lg-12">
								<div class="widget-container fluid-height clearfix">
									<div class="heading">
										<i class="icon-collapse"></i>查询条件
									</div>
									<div class="widget-content padded">
										<div class="form-horizontal">
											<div class="form-group">
												<label class="control-label col-md-1">日期范围</label>
												<div class="col-sm-2">
													<input class="form-control" data-date-autoclose="true"
														data-date-format="yyyy-mm-dd" id="dpd1" placeholder="开始日期"
														type="text">
												</div>
												<div class="col-sm-2">
													<input class="form-control" data-date-autoclose="true"
														data-date-format="yyyy-mm-dd" id="dpd2" placeholder="结束日期"
														type="text">
													
												</div>
												<font color="red">(默认查询当前日期至前一个月的数据)</font>
											</div>
											<div class="form-group">
												<label class="control-label col-md-1">牛人列表</label>
												<div class="col-md-2">
													<select class="form-control" id="traderId" onchange="onChangeTrader(this.value)">
													    <option value="">全部牛人</option>
														<c:forEach items="${traderList}" var="trader">
													       <option value="${trader.traderId}">${trader.traderName}</option>
													    </c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-1">货币列表</label>
												<div class="col-md-2">
													<select class="form-control" id="symbol" onchange="onChangeTrader(this.value)">
													    <option value="">全部货币</option>
														<c:forEach items="${symbolList}" var="sy">
													       <option value="${sy.symbol}">${sy.symbol}</option>
													    </c:forEach>
													</select>
												</div>
												<div class="control-label col-md-8"></div>
												<button class="btn btn-primary" onclick="tradedata()"><i class="icon-search"></i>查询</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="widget-content padded clearfix" id="main">
							
						</div>
					</div>
				</div>
			</div>
			<!-- end DataTables Example -->
		</div>
	</div>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>