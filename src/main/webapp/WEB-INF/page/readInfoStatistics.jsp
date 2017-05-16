<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>阅读信息统计</title>
        <link rel="stylesheet" href="../static/asset/css/fonts/linecons/css/linecons.css">
        <link rel="stylesheet" href="../static/asset/css/fonts/fontawesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="../static/asset/css/bootstrap.css">
        <link rel="stylesheet" href="../static/asset/css/xenon-core.css">
        <link rel="stylesheet" href="../static/asset/css/xenon-forms.css">
        <link rel="stylesheet" href="../static/asset/css/xenon-components.css">
        <link rel="stylesheet" href="../static/asset/css/xenon-skins.css">
        <link rel="stylesheet" href="../static/asset/css/custom.css">

        <link href="../static/css/animate.min.css" rel="stylesheet">
        <link href="../static/css/style.min862f.css" rel="stylesheet">
	</head>
	<body class="page-body">
        <div class="page-container">
            <!-- 左侧菜单 -->
            <jsp:include page="sidebar.jsp">
                <jsp:param value="statistics" name="active"/>
            </jsp:include>
            <div class="main-content">
                <!--<jsp:include page="userinfo.jsp"></jsp:include>-->
                <div class="panel panel-default panel-headerless">
                    <div class="panel-body layout-variants">
                        <div class="animated fadeInRight row">
                            <div class="col-sm-5">
                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                       
                                    </div>
                                    <div class="ibox-content">
                                        <div class="echarts" id="pieChart"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        
                                    </div>
                                    <div class="ibox-content">
                                        <div class="echarts" id="barChart"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Loading Overlay -->
        <div class="page-loading-overlay">
            <div class="loader-2"></div>
        </div>
        <script src="../static/asset/js/jquery-1.11.1.min.js"></script>
        <script src="../static/asset/js/resizeable.js"></script>
        <script src="../static/asset/js/joinable.js"></script>
        <script src="../static/asset/js/select2/select2.min.js"></script>
        <script src="../static/asset/js/jquery-ui/jquery-ui.min.js"></script>
        <script src="../static/asset/js/multiselect/js/jquery.multi-select.js"></script>
        <script src="../static/asset/js/xenon-custom.js"></script>
        <script src="../static/asset/js/bootstrap.min.js"></script>
        <script src="../static/asset/js/echarts.js"></script>
        <script src="../static/asset/js/content.min.js"></script>
        <script src="../static/js/readinfostatistics.js"></script>
    </body>
</html>