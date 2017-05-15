<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>阅读信息统计</title>
   		<link href="/static/css/bootstrap.min14ed.css" rel="stylesheet">

        <link href="/static/css/animate.min.css" rel="stylesheet">
        <link href="/static/css/style.min862f.css" rel="stylesheet">
        <script type="text/javascript" src="/static/asset/js/jquery-1.11.1.min.js"></script>
	    <script src="/static/asset/bootstrap.min.js"></script>
	    <script src="/static/asset/echarts.js"></script>
	    <script src="/static/asset/content.min.js"></script>
	    <script src="/static/js/readinfostatistics.js"></script>
	</head>
	<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
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
	</body>
</html>