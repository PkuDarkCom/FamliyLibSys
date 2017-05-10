<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../include/nav.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
 $().ready(function(){
	 traderdata();
 });
 
 function traderdata(){
	 
	 var time = new Date().getTime();
	 var traderStatus = $("#traderStatus").val();
	 
	 $.ajax({
		 type:"POST",
		 url:"/trader/traderContent",
		 data:{
			 "time":time,
			 "traderStatus":traderStatus
			 },
		 dataType:"html",
		 success:function(msg){
			 $("#main").html(msg);
			 /*分页*/
			 dataTablesOpreation();
		 }
	 });
 }
 
 //根据牛人状态查询
 function onChangeStatus(val) {   	
    $("#traderStatus").val(val);
    traderdata();	
 }
 
 //添加牛人
 function addTrader(){
	 var traderName = $("#traderName").val();
	 if(traderName == null || traderName ==""){
 		   alert("请填写牛人名称！");
 		   $("#traderName").focus();
 		   return;
 	 }
	 var traderId = $("#traderId").val();
	 if(traderId == null || traderId ==""){
 		   alert("请填写牛人ID！");
 		   $("#traderId").focus();
 		   return;
 	 }
	 
	 $.ajax({
		 type:"post",
		 url:"addTrader",
		 data:{
			 "traderName":traderName,
			 "traderId":traderId
		 },
		 dataType:"json",
		 success: function (data) {
             if (data.status == 0) {
             	 alert(data.message);       	 
             }else if (data.status == 1) {
            	 alert(data.message);
            	 $("#closeAddTrader").click();
             }
         }
	 });
 }

 //生成牛人名单文件
 function exportFile(){
	 
	 $.ajax({
		 type:"post",
		 url:"exportTraderFile",
		 dataType:"json",
		 success: function (data) {
             if (data.status == 0) {
             	 alert(data.message);       	 
             }else if (data.status == 1) {
            	 alert(data.message);
             }
         }
	 });
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
							<i class="icon-user" ></i>牛人管理
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
												<label class="control-label col-md-1">牛人状态</label>
												<div class="col-md-2">
													<select class="form-control" id="traderStatus" onchange="onChangeStatus(this.value)">
													    <option value="">所有状态</option>
													    <option value="01">有效</option>
													    <option value="00">无效</option>
													</select>
												</div>
												<div class="control-label col-md-6"></div>
												<button class="btn btn-primary" data-toggle="modal" href="#addTrader" ><i class="icon-plus-sign-alt "></i>添加 牛人</button>
												<button class="btn btn-primary" onclick="exportFile()"><i class="icon-file-alt "></i>生成配置</button>
												 
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
	<!-- 添加牛人弹出框 start-->
	 <div class="modal fade" id="addTrader">
       <div class="modal-dialog">
         <div class="modal-content">
           <div class="modal-header">
             <button aria-hidden="true" class="close" data-dismiss="modal" type="button">&times;</button>
             <h4 class="modal-title">
                                  添加牛人
             </h4>
           </div>
           <div class="modal-body">
             <div class="widget-content padded">
		            <div class="row">
		              <div class="col-md-6">
		                <div class="form-group">
		                  <label for="traderName">牛人名称</label><input class="form-control" id="traderName" name="traderName" type="text">
		                </div>
		              </div>
		              <div class="col-md-6">
		                <div class="form-group">
		                  <label for="traderId">牛人编号</label><input class="form-control" id="traderId" name="traderId" type="text">
		                </div>
		              </div>
		            </div>
		      </div>
           </div>
           <div class="modal-footer">
             <button class="btn btn-primary" type="button" onclick="addTrader()">保存</button><button class="btn btn-default-outline" data-dismiss="modal" type="button" id="closeAddTrader">关闭</button>
           </div>
         </div>
       </div>
     </div>
     <!-- 添加牛人弹出框 end-->
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>